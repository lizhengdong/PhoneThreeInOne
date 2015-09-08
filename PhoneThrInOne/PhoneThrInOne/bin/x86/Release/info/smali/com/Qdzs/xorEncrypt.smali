.class public Lcom/Qdzs/xorEncrypt;
.super Ljava/lang/Object;
.source "xorEncrypt.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static xorEn(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "sourcePhoneNum"

    .prologue
    .line 7
    const/16 v1, 0x14

    .line 8
    .local v1, code:I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 9
    .local v0, charArray:[C
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v3, v0

    if-lt v2, v3, :cond_0

    .line 12
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0}, Ljava/lang/String;-><init>([C)V

    return-object v3

    .line 10
    :cond_0
    aget-char v3, v0, v2

    xor-int/2addr v3, v1

    int-to-char v3, v3

    aput-char v3, v0, v2

    .line 9
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
