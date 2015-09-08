.class public Lcom/Qdzs/IfApkExists;
.super Ljava/lang/Object;
.source "IfApkExists.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isExist(Landroid/content/Context;)Z
    .locals 8
    .parameter "mContext"

    .prologue
    const/4 v5, 0x0

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 13
    .local v2, manager:Landroid/content/pm/PackageManager;
    if-eqz v2, :cond_2

    .line 14
    invoke-virtual {v2, v5}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v4

    .line 15
    .local v4, pkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-lt v1, v6, :cond_0

    .line 30
    .end local v1           #i:I
    .end local v4           #pkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :goto_1
    return v5

    .line 16
    .restart local v1       #i:I
    .restart local v4       #pkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :cond_0
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/PackageInfo;

    .line 17
    .local v3, pI:Landroid/content/pm/PackageInfo;
    if-eqz v3, :cond_1

    .line 19
    :try_start_0
    iget-object v6, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 20
    const-string v7, "com.AndroidKernelService"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_1

    .line 21
    const/4 v5, 0x1

    goto :goto_1

    .line 22
    :catch_0
    move-exception v0

    .line 23
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

    .line 15
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 28
    .end local v1           #i:I
    .end local v3           #pI:Landroid/content/pm/PackageInfo;
    .end local v4           #pkgList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :cond_2
    const-string v6, "PackageManager\u5b9a\u4e49\u7684\u53d8\u91cfmanager\u4e3a\u7a7a"

    invoke-static {v6}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto :goto_1
.end method
