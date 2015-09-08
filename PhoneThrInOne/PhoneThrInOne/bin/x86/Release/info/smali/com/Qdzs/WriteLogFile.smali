.class public Lcom/Qdzs/WriteLogFile;
.super Ljava/lang/Object;
.source "WriteLogFile.java"


# static fields
.field private static myLogFilePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const-string v0, "/mnt/sdcard/"

    sput-object v0, Lcom/Qdzs/WriteLogFile;->myLogFilePath:Ljava/lang/String;

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearFile(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 23
    return-void
.end method

.method public static writeLog(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 38
    return-void
.end method

.method public static writePhoneNum(Ljava/lang/String;)V
    .locals 7
    .parameter "msg"

    .prologue
    .line 40
    const/4 v1, 0x0

    .line 42
    .local v1, file:Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    .line 43
    .local v4, nowDate:Ljava/util/Date;
    new-instance v3, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/Qdzs/WriteLogFile;->myLogFilePath:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "sysInfo.txt"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    .local v3, logFile:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 46
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 48
    :cond_0
    new-instance v2, Ljava/io/FileOutputStream;

    const/4 v5, 0x0

    invoke-direct {v2, v3, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .end local v1           #file:Ljava/io/FileOutputStream;
    .local v2, file:Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 50
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 55
    .end local v2           #file:Ljava/io/FileOutputStream;
    .end local v3           #logFile:Ljava/io/File;
    .end local v4           #nowDate:Ljava/util/Date;
    .restart local v1       #file:Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 51
    :catch_0
    move-exception v0

    .line 53
    .local v0, e:Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 51
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #file:Ljava/io/FileOutputStream;
    .restart local v2       #file:Ljava/io/FileOutputStream;
    .restart local v3       #logFile:Ljava/io/File;
    .restart local v4       #nowDate:Ljava/util/Date;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2           #file:Ljava/io/FileOutputStream;
    .restart local v1       #file:Ljava/io/FileOutputStream;
    goto :goto_1
.end method
