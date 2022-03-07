Return-Path: <SRS0=jEOm=TS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3466C433EF
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 19:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6B93C340EF; Mon,  7 Mar 2022 19:48:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 116B6C340EB;
	Mon,  7 Mar 2022 19:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 116B6C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d187so15220764pfa.10;
        Mon, 07 Mar 2022 11:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9z4cvvb8ehlsx7Q3mBQnFLdOXY4GeBxj2CZ7PJJnLGA=;
        b=R4mlG1TyEm2hkM4YUU7tu/KUoWoINDgTg/5Z6AM2tb4lhZ3hIvxepH3fmyZ8apiXHP
         rp8e9BCQFhMJKPJm/4Q2O03uAiGUM/Yy/9e8ynCdgf/Lrup0rf07QqTbEv9xSSrZzCmZ
         Bz32drX72Ii/ELJ2bvOziTTRlk65T6A0tNAyrgRE2NmaFRNGRHUNq//L27R/i0fJiL1B
         rkXohyBsQr20+MbIJMhQA9EnnVw8qcq955KXeQ0xQff3enlLFl6/knxpx1Auk/eDe8kL
         XLeUNYGcx9hEqZLkrNXM514HKg5ZXe80HAgUv1gabtppDCRr8Z09K8Hmgt1aq5UYWKWQ
         TfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9z4cvvb8ehlsx7Q3mBQnFLdOXY4GeBxj2CZ7PJJnLGA=;
        b=RHNfJ4vEoWaYnM61AU4yToY1gAdSHkQ+8ZEuKTtGLqzXgORoYYpu5ta8dI+lwtoq8U
         SX4UI4Xta3aQHpxqa+dDHu/gA6wjNIjwz+e4PmqzMvdTxrCVXZ4ZD98A0aXaOxnr6xi6
         d5BdUIUXD6g2kOhR3kVQ86Pc37wir1yvhANVFxjtP+J/z6yUvdrGc1hQi2aW49CZ8L+P
         sURc0mNmXgxdbFTAeHNVbFrC2Xh03wsFmO9V4DBDxPUKbKnNUe6Ow6o+souM34CfNX66
         JmUZnPPIvRvKVLFGFDt6v8V40ucERgFvGn6h4VHuGdNNHaIP5HpZR3ybwvRn81b0+7RX
         8O4Q==
X-Gm-Message-State: AOAM5304mcjCpaALJdDsNb1cEWIbVnwyvLSO5SlFswFnHLqgZ+hrRFyg
	u3i+8XtIbrOKoFnzqylunnbQ9ZvQgI8=
X-Google-Smtp-Source: ABdhPJwVxTFVKU15AjfnndQfyQodFE5wp8XiFIUqFqlxveWUgm44DD1C7dbjbcfsuPrXx0KjWc0ang==
X-Received: by 2002:a63:cd49:0:b0:373:5fbb:c790 with SMTP id a9-20020a63cd49000000b003735fbbc790mr10979091pgj.206.1646682501116;
        Mon, 07 Mar 2022 11:48:21 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s20-20020a056a00179400b004f709998d13sm4060092pfg.10.2022.03.07.11.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 11:48:20 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 5.18
Date: Mon,  7 Mar 2022 11:48:14 -0800
Message-Id: <20220307194817.3754107-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.18/defconfig-arm64

for you to fetch changes up to d20e1df5c38f98dc6a0e7726fe6cf02e1d91d687:

  arm64: defconfig: Enable additional Broadcom STB drivers (2022-01-31 16:12:00 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based defconfig updates for
5.18, please pull the following:

- Florian enables Broadcom STB drivers for NAND, SATA, Ethernet switch,
USB PHY and host controllers, watchdog, PWM and Ethernet controller

----------------------------------------------------------------
Florian Fainelli (1):
      arm64: defconfig: Enable additional Broadcom STB drivers

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)
