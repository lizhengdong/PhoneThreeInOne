.class public Lcom/Qdzs/IfRoot;
.super Ljava/lang/Object;
.source "IfRoot.java"


# static fields
.field private static final kSystemRootStateDisable:I = 0x0

.field private static final kSystemRootStateEnable:I = 0x1

.field private static final kSystemRootStateUnknow:I = -0x1

.field private static systemRootState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, -0x1

    sput v0, Lcom/Qdzs/IfRoot;->systemRootState:I

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

.method public static isRootSystem()Z
    .locals 8

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 14
    sget v6, Lcom/Qdzs/IfRoot;->systemRootState:I

    if-ne v6, v4, :cond_0

    .line 33
    .local v0, f:Ljava/io/File;
    .local v2, i:I
    .local v3, kSuSearchPaths:[Ljava/lang/String;
    :goto_0
    return v4

    .line 16
    .end local v0           #f:Ljava/io/File;
    .end local v2           #i:I
    .end local v3           #kSuSearchPaths:[Ljava/lang/String;
    :cond_0
    sget v6, Lcom/Qdzs/IfRoot;->systemRootState:I

    if-nez v6, :cond_1

    move v4, v5

    .line 17
    goto :goto_0

    .line 19
    :cond_1
    const/4 v0, 0x0

    .line 20
    .restart local v0       #f:Ljava/io/File;
    const/4 v6, 0x5

    new-array v3, v6, [Ljava/lang/String;

    const-string v6, "/system/bin/"

    aput-object v6, v3, v5

    const-string v6, "/system/xbin/"

    aput-object v6, v3, v4

    const/4 v6, 0x2

    .line 21
    const-string v7, "/system/sbin/"

    aput-object v7, v3, v6

    const/4 v6, 0x3

    const-string v7, "/sbin/"

    aput-object v7, v3, v6

    const/4 v6, 0x4

    const-string v7, "/vendor/bin/"

    aput-object v7, v3, v6

    .line 23
    .restart local v3       #kSuSearchPaths:[Ljava/lang/String;
    const/4 v2, 0x0

    .restart local v2       #i:I
    move-object v1, v0

    .end local v0           #f:Ljava/io/File;
    .local v1, f:Ljava/io/File;
    :goto_1
    :try_start_0
    array-length v6, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-lt v2, v6, :cond_2

    move-object v0, v1

    .line 32
    .end local v1           #f:Ljava/io/File;
    .restart local v0       #f:Ljava/io/File;
    :goto_2
    sput v5, Lcom/Qdzs/IfRoot;->systemRootState:I

    move v4, v5

    .line 33
    goto :goto_0

    .line 24
    .end local v0           #f:Ljava/io/File;
    .restart local v1       #f:Ljava/io/File;
    :cond_2
    :try_start_1
    new-instance v0, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    aget-object v7, v3, v2

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "su"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 25
    .end local v1           #f:Ljava/io/File;
    .restart local v0       #f:Ljava/io/File;
    if-eqz v0, :cond_3

    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 26
    const/4 v6, 0x1

    sput v6, Lcom/Qdzs/IfRoot;->systemRootState:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 30
    :catch_0
    move-exception v4

    goto :goto_2

    .line 23
    :cond_3
    add-int/lit8 v2, v2, 0x1

    move-object v1, v0

    .end local v0           #f:Ljava/io/File;
    .restart local v1       #f:Ljava/io/File;
    goto :goto_1

    .line 30
    :catch_1
    move-exception v4

    move-object v0, v1

    .end local v1           #f:Ljava/io/File;
    .restart local v0       #f:Ljava/io/File;
    goto :goto_2
.end method
