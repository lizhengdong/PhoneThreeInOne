.class public Lcom/Qdzs/RootCmd;
.super Ljava/lang/Object;
.source "RootCmd.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static execRootCmd(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .parameter "paramString"

    .prologue
    .line 12
    const-string v6, "result : "

    .line 14
    .local v6, result:Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v10

    const-string v11, "su "

    invoke-virtual {v10, v11}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    .line 15
    .local v5, localProcess:Ljava/lang/Process;
    invoke-virtual {v5}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 16
    .local v4, localOutputStream:Ljava/io/OutputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v4}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 18
    .local v1, localDataOutputStream:Ljava/io/DataOutputStream;
    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 19
    .local v3, localInputStream:Ljava/io/InputStream;
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 21
    .local v0, localDataInputStream:Ljava/io/DataInputStream;
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 22
    .local v7, str1:Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 23
    .local v8, str2:Ljava/lang/String;
    invoke-virtual {v1, v8}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 24
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 25
    const/4 v9, 0x0

    .line 29
    .local v9, str3:Ljava/lang/String;
    const-string v10, "exit\n"

    invoke-virtual {v1, v10}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 30
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 31
    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .end local v0           #localDataInputStream:Ljava/io/DataInputStream;
    .end local v1           #localDataOutputStream:Ljava/io/DataOutputStream;
    .end local v3           #localInputStream:Ljava/io/InputStream;
    .end local v4           #localOutputStream:Ljava/io/OutputStream;
    .end local v5           #localProcess:Ljava/lang/Process;
    .end local v7           #str1:Ljava/lang/String;
    .end local v8           #str2:Ljava/lang/String;
    .end local v9           #str3:Ljava/lang/String;
    :goto_0
    return-object v6

    .line 33
    :catch_0
    move-exception v2

    .line 34
    .local v2, localException:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected static execRootCmdSilent(Ljava/lang/String;)I
    .locals 8
    .parameter "paramString"

    .prologue
    .line 42
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    const-string v7, "su"

    invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 43
    .local v3, localProcess:Ljava/lang/Process;
    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 44
    .local v2, localObject:Ljava/io/OutputStream;
    new-instance v0, Ljava/io/DataOutputStream;

    .line 45
    check-cast v2, Ljava/io/OutputStream;

    .line 44
    .end local v2           #localObject:Ljava/io/OutputStream;
    invoke-direct {v0, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 46
    .local v0, localDataOutputStream:Ljava/io/DataOutputStream;
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 47
    .local v5, str:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 48
    .local v2, localObject:Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .end local v2           #localObject:Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 49
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V

    .line 50
    const-string v6, "exit\n"

    invoke-virtual {v0, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 51
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V

    .line 52
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    .line 53
    invoke-virtual {v3}, Ljava/lang/Process;->exitValue()I

    move-result v4

    .line 54
    .local v4, result:I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 57
    .end local v0           #localDataOutputStream:Ljava/io/DataOutputStream;
    .end local v3           #localProcess:Ljava/lang/Process;
    .end local v4           #result:I
    .end local v5           #str:Ljava/lang/String;
    :goto_0
    return v6

    .line 55
    :catch_0
    move-exception v1

    .line 56
    .local v1, localException:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 57
    const/4 v6, -0x1

    goto :goto_0
.end method

.method protected static haveRoot()Z
    .locals 2

    .prologue
    .line 64
    const-string v1, "echo test"

    invoke-static {v1}, Lcom/Qdzs/RootCmd;->execRootCmdSilent(Ljava/lang/String;)I

    move-result v0

    .line 65
    .local v0, i:I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 66
    const/4 v1, 0x1

    .line 68
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
