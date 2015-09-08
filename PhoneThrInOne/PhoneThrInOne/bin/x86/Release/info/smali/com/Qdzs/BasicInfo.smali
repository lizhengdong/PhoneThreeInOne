.class public Lcom/Qdzs/BasicInfo;
.super Ljava/lang/Object;
.source "BasicInfo.java"


# instance fields
.field context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/Qdzs/BasicInfo;->context:Landroid/content/Context;

    .line 15
    return-void
.end method


# virtual methods
.method public getIMEI()Ljava/lang/String;
    .locals 4

    .prologue
    .line 34
    iget-object v2, p0, Lcom/Qdzs/BasicInfo;->context:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 35
    .local v1, tm:Landroid/telephony/TelephonyManager;
    invoke-virtual {p0, v1}, Lcom/Qdzs/BasicInfo;->get_Sim_State(Landroid/telephony/TelephonyManager;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 36
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, imei:Ljava/lang/String;
    :goto_0
    return-object v0

    .line 39
    .end local v0           #imei:Ljava/lang/String;
    :cond_0
    const-string v0, "IMEI"

    .restart local v0       #imei:Ljava/lang/String;
    goto :goto_0
.end method

.method public getIMSI()Ljava/lang/String;
    .locals 4

    .prologue
    .line 47
    iget-object v2, p0, Lcom/Qdzs/BasicInfo;->context:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 48
    .local v1, tm:Landroid/telephony/TelephonyManager;
    invoke-virtual {p0, v1}, Lcom/Qdzs/BasicInfo;->get_Sim_State(Landroid/telephony/TelephonyManager;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 49
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, imsi:Ljava/lang/String;
    :goto_0
    return-object v0

    .line 52
    .end local v0           #imsi:Ljava/lang/String;
    :cond_0
    const-string v0, "IMSI"

    .restart local v0       #imsi:Ljava/lang/String;
    goto :goto_0
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 4

    .prologue
    .line 21
    iget-object v2, p0, Lcom/Qdzs/BasicInfo;->context:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 22
    .local v1, tm:Landroid/telephony/TelephonyManager;
    invoke-virtual {p0, v1}, Lcom/Qdzs/BasicInfo;->get_Sim_State(Landroid/telephony/TelephonyManager;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 23
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    .line 28
    .local v0, phoneNumber:Ljava/lang/String;
    :goto_0
    return-object v0

    .line 25
    .end local v0           #phoneNumber:Ljava/lang/String;
    :cond_0
    const-string v0, "1xxxxxxxxxx"

    .restart local v0       #phoneNumber:Ljava/lang/String;
    goto :goto_0
.end method

.method public get_Sim_State(Landroid/telephony/TelephonyManager;)Z
    .locals 2
    .parameter "tm"

    .prologue
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p1}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 73
    :goto_0
    :pswitch_0
    return v0

    .line 71
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 59
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
