Return-Path: <SRS0=0Pte=AF=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74131C77B6E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BFC7C4339B; Fri, 14 Apr 2023 16:51:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65A5BC433D2;
	Fri, 14 Apr 2023 16:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65A5BC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id r20so2376668wra.5;
        Fri, 14 Apr 2023 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681491074; x=1684083074;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJeAOg25JWX/NJPCTUMVwLDaROKqhiw5/DLFXk3sOjo=;
        b=A9F7O2vUylOWXC8Q/ltB06BiiJi0O4vGA+3zyE/R68KGpajeIOJewD0MfOLiv05+mb
         GJxl8V11mQWqsDbFTOVFoTqwm3xZASTFJ3E4VANOE+82Xnq2LaoyVW2DtFf8WStH4A0/
         sTZNqPrdh4SnkpqO49/37a6hbF//5r3okJogkNInlB50Z0UVLpXXvyUHKE7EiDYwtszN
         +k3Kj+2/q7jo5NYp5fFKm1fr0GOAg7Srum7GEBWnZODkL2RMN4tmlJ8ERvAet5P2Yy7T
         Xg89M2UwF+D5+HBorQmKzuNIJxKZAYWZo6ICiGt58bCgHLp/lMaQC2xSUktN9QxJu8T+
         L0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491074; x=1684083074;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJeAOg25JWX/NJPCTUMVwLDaROKqhiw5/DLFXk3sOjo=;
        b=EW0w0KkZu1RqcuUubSRgj4fL9gIfrAYmr1u8daWB5OqHr38vDZzR2Uai0zAVq1knFT
         6tUYiJUZ5lP7Z27mifFb5If1LsSfjSXxYzxAPpqSPttBIoRPgA2Muw82as4oHJYZGEPX
         XuosqGxCW9IBM2Jqchh/R9v5MlK3/z2UKB7H1Mqevh1VEFiB6B0Y6av087H1SxvZcWqQ
         RpnYek2sSMb1Wi8Zgm5wQYWRf2nIr9bMehUFh55bHA6tFjffdCg6oIGFbAwOpg+DWEVb
         vfbKS3KG5ST88OFZGXnZnO9ra7vo19sE3y8IH0bZIsX76MidzyX7M/FYQ/ok1OTfFSXo
         ZHRQ==
X-Gm-Message-State: AAQBX9dYjB/0Lfrh8SsU/rc1CNYMc9hSx72KYP1+5Y/48j6V2C1Q3v8F
	jXWZUDw1HpW1ewKCZWSpFkBI5gvNnbUcPw==
X-Google-Smtp-Source: AKy350Z6PrZD3m91Rvx5hGElszJ9vAc0udIJKwBs4o4ZAmdubpdpAEjvuJBl4B0tO2gc6TWUCErJ7w==
X-Received: by 2002:adf:cf10:0:b0:2f7:780e:ee0a with SMTP id o16-20020adfcf10000000b002f7780eee0amr1472173wrj.64.1681491074440;
        Fri, 14 Apr 2023 09:51:14 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y14-20020adffa4e000000b002f5fbc6ffb2sm3779524wrr.23.2023.04.14.09.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 09:51:13 -0700 (PDT)
Message-ID: <c3b17357-e08d-da7e-def0-a7f9e0b95cb7@gmail.com>
Date: Fri, 14 Apr 2023 18:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Xiangsheng Hou <xiangsheng.hou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM32 DTS updates for 6.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Please have a look on the few changes to the 32 bit DT files.

Regards,
Matthias

---
The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.3-next-dts32

for you to fetch changes up to 6154a79fdcb3b80fb91c25b4528df18c538f080d:

   arm: dts: mt7623: disable home key on Bananapi BPI-R2 (2023-03-06 14:35:17 +0100)

----------------------------------------------------------------
mt7623:
Disable not exising home key

mt2701:
change node name to match DT bindings

----------------------------------------------------------------
Arınç ÜNAL (1):
       arm: dts: mt7623: disable home key on Bananapi BPI-R2

Xiangsheng Hou (1):
       arm: dts: mediatek: Fix existing NAND controller node name

  arch/arm/boot/dts/mt2701.dtsi                 | 2 +-
  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 6 ++++++
  2 files changed, 7 insertions(+), 1 deletion(-)
