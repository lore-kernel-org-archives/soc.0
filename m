Return-Path: <SRS0=64cw=CD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72756EB64DB
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5547CC433CA; Thu, 15 Jun 2023 16:25:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62B96C433C0;
	Thu, 15 Jun 2023 16:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62B96C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f8cc04c287so20488505e9.0;
        Thu, 15 Jun 2023 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686846348; x=1689438348;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDOalCuclznsr/D3lGJ0twcmXcI7+hAv9EFDQT7mOUI=;
        b=Y8YLYCDkaqkNtSiV7jfJyBQW4RG8C7PVYlBzN7/tUhSZ4eADI+V3szVvoihCxxpjuV
         /J52wa0KPB5+ec42GHfQEycFcpsDIuvBq6Sgc6M9Q60vAYWy08TMM9FTRZpSJkszLSF4
         2dfloxc3fFmoBjkJpldQs6eANw5gGDtW3agvDPbE2+gNyo2dyqeKHNBhQBdwq3UqHY6w
         O7pctmc36WRxaoFZIf5eOwgecF9WVHwdtsEqbL9Au4FevXvEqyLj4Og7SWhxgp6A2/M7
         b/HvVC7xePeRWA7gbytIdjSMdQQUnUx+kjBRDwX4HM++VineK03hxreMQOpsM/AX/EC9
         RcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686846348; x=1689438348;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDOalCuclznsr/D3lGJ0twcmXcI7+hAv9EFDQT7mOUI=;
        b=JUDxfvYBomFetcU9MGJE8yd77LKt3dsR8UnFp8iaIxyXuzIAaCB+eKLPbQl3XjDdKf
         NSpjkwVm8E7jvD6Z6cwoEdVzkV/MEMSTPDeVPeqWCumErpiBRTx8OcbiBOVnjd3mwyB0
         A5rS5qMvQLTgyAZCEnc3Zeph4u+wyVrhMQqfH0X9qEoxQIwKW7EE3XgdY7MWJQ2uOe9S
         9eISKX6B0Uf+bmYzziLNJriQ1JQcPMhiTmtEdooktdHlb4sm+C+UrfnMYMXUQj8e/Feq
         94qUJwolMIT3TKonXYEsEITsNpNpG0/KvYt5fbqaxN+2FkzrvedLZ8LEEhPJNXvSkd+z
         jHDg==
X-Gm-Message-State: AC+VfDyskyeZ44Ey7doYdt4uGEHBNNGQjFegmR4CjGZRnaTCPV6697lq
	kxWNyqgZ25fznKA8dncSLUFtMgKzig8=
X-Google-Smtp-Source: ACHHUZ7GJK+aeTcN/8t0StjabM49vYiGAShiYkE6VnqBiPA0H0DDFZDfT7v+2+YgN527xCp5nf+oHA==
X-Received: by 2002:a7b:c8da:0:b0:3f7:e8fc:678d with SMTP id f26-20020a7bc8da000000b003f7e8fc678dmr13464162wml.13.1686846348187;
        Thu, 15 Jun 2023 09:25:48 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d4e0d000000b002fb60c7995esm21401865wrt.8.2023.06.15.09.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 09:25:46 -0700 (PDT)
Message-ID: <92e336ca-bbbb-6d6c-297a-13deaae4138b@gmail.com>
Date: Thu, 15 Jun 2023 18:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US, ca-ES, es-ES
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek: Updates for v6.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Please have a look on the defconfig changes for v6.5.

Regards,
Matthias

---

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.4-next-defconfig

for you to fetch changes up to b17f3a3ef5ee29e35ea8726cfa7e60169fe11d0e:

   arm64: defconfig: enable Mediatek PMIC key (2023-05-29 14:12:37 +0200)

----------------------------------------------------------------
- Enable mt6357 PMIC needed for mt8365 EVK
- Enable device for power button on several PMICs

----------------------------------------------------------------
Alexandre Mergnat (2):
       arm64: defconfig: enable MT6357 regulator
       arm64: defconfig: enable Mediatek PMIC key

  arch/arm64/configs/defconfig | 2 ++
  1 file changed, 2 insertions(+)
