.class public Lcom/Qdzs/AutoInstall;
.super Ljava/lang/Object;
.source "AutoInstall.java"


# static fields
.field private static mContext:Landroid/content/Context;

.field private static mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static install(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 28
    sput-object p0, Lcom/Qdzs/AutoInstall;->mContext:Landroid/content/Context;

    .line 30
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 31
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/Qdzs/AutoInstall;->mUrl:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 32
    const-string v2, "application/vnd.android.package-archive"

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    sget-object v1, Lcom/Qdzs/AutoInstall;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    return-void
.end method

.method public static setUrl(Ljava/lang/String;)V
    .locals 0
    .parameter "url"

    .prologue
    .line 18
    sput-object p0, Lcom/Qdzs/AutoInstall;->mUrl:Ljava/lang/String;

    .line 19
    return-void
.end method
