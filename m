Return-Path: <SRS0=wi9A=35=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D522AC4167B
	for <soc@archiver.kernel.org>; Tue, 29 Nov 2022 19:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A64AAC43470; Tue, 29 Nov 2022 19:18:04 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7194AC433C1;
	Tue, 29 Nov 2022 19:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7194AC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id c2so10579086qko.1;
        Tue, 29 Nov 2022 11:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JS96QcwzmWNu5pTaMkdCSoIPiEcBofvIJIS7XfX9f4=;
        b=f0xUITEbhdr9+eGQUzPf6HVUZcz02gPIq1SJCoe/AvwaU7lRETbxgh58y0q/CnrQSF
         l4uecDhZSWlSab+OOz3KnECio2ISZzRVQgA+/YOcC9pCXJk9Og1oLwPAHXINyIr4csHN
         1W9kqENcLJk+M+4A9qFyx7LG3yh21punZ0pp1lqIJfaMAV+tFUl50KuiIL/x2VnVDwL3
         ydzyhxv8Zcwf7EjFDsQDMBENGO/mYPIMdjDZ2T0MyxE9O6iIgA+X51MMOWkrvPUUVeUd
         /9Ke/91OgT14jhSzB4b5rdvH6Le95DuYXz94U5X/Gj0n2VWjhLhepLH3T5mE+IsqxAYM
         g5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JS96QcwzmWNu5pTaMkdCSoIPiEcBofvIJIS7XfX9f4=;
        b=Yvv1h10xXW+eKz9vsr+So++rUPYNTzjJ/YhyobCHNmP1NHbGvNp9jR5qjIH9NMuVkU
         qOz4ZMFHokQvnAGLaoRqqDjh3HQp0h6GAqKsndRWmxPhfspr3OPwe0kl4nymdCI5apBL
         +li5n8cJwZV67zpXRRPTRubFiQ2OicQqVk8nEOW/+38r5hz/PmDhXLEpwtfFv7dj9vOR
         DmIABBYHg2vsUAtxlhYU0pNkV3mII+fd+5i4Pfvxh+/YjpJ+gxMZr4Rp90Xmq+MfTz9y
         th1Z/htwjYquxk+BBDqRBCY0w6IS3QtHJAyOV2yK8FW6qrkNzaQDjV/iqEDayvvZvAjb
         jXlg==
X-Gm-Message-State: ANoB5plOOP2xcd7ebpySilbOZIjUCgmvwhT0InYWs7ZI4fEIm/6ccA2E
	9U/8pfson5bHaG/QvsPqw8pzH69DNVg=
X-Google-Smtp-Source: AA0mqf4LKEblaMo/iFEsDbuj/MtMaTG29Aq/J19Leof/xK2RqgCbg/J/H+CwL9AYicdQf++IDgvPsg==
X-Received: by 2002:a05:620a:2047:b0:6ee:9e6d:9e6b with SMTP id d7-20020a05620a204700b006ee9e6d9e6bmr51742390qka.743.1669749481797;
        Tue, 29 Nov 2022 11:18:01 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y18-20020a05620a25d200b006eeb3165565sm11230709qko.80.2022.11.29.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 11:18:01 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 6.2
Date: Tue, 29 Nov 2022 11:17:54 -0800
Message-Id: <20221129191755.542584-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129191755.542584-1-f.fainelli@gmail.com>
References: <20221129191755.542584-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.2/devicetree-arm64

for you to fetch changes up to e567e58d6819adc002c57b81e16b88da24d3b4aa:

  arm64: dts: Update cache properties for broadcom (2022-11-28 15:37:41 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.2, please pull the following:

- Rafal describes the timer/watchdog block for the BCM4908 and BCM6858
  SoCs

- Krzysztof corrects invalid "reg" properties for the memory nodes that
  were off by one digit

- Pierre updates a number of cache Device Tree node properties to be
  schema compliant

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: broadcom: trim addresses to 8 digits

Pierre Gondois (1):
      arm64: dts: Update cache properties for broadcom

Rafał Miłecki (2):
      arm64: dts: broadcom: bcmbca: bcm4908: add TWD block timer
      arm64: dts: broadcom: bcmbca: bcm6858: add TWD block

 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi    |  6 ++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi    |  1 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi   |  1 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi   |  1 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi    |  1 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi    |  1 +
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi    | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts |  2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts |  2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi    |  1 +
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi |  4 ++++
 11 files changed, 38 insertions(+), 2 deletions(-)
