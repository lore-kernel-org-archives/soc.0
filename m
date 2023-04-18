Return-Path: <SRS0=EwYq=AJ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2CDC77B75
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 08:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EDDAC4339C; Tue, 18 Apr 2023 08:24:34 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DA6BC433D2
	for <soc@kernel.org>; Tue, 18 Apr 2023 08:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DA6BC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id a29so30169408ljq.0
        for <soc@kernel.org>; Tue, 18 Apr 2023 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681806271; x=1684398271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5oKAYbsVysV5zF+myMqONTAUveV47CceODODEhedGw=;
        b=m4wzO69pEfKu7T0+rQGvC3iCdIJ2TbgAj3MrJ9AV9vo31A8GWp5k72165geLAgWIaE
         sqey/HiUxQgSQvpbseV4ZgUoc/BBrhtdKlE2Es0Jz+0O2Es4jbrVK5GqI7Md87JDoflc
         fePDEmrSjbGi09U+auo3jGTxmcbYP8NZ7WwF0mbFbnN2PLzBIM5jg25ecUsMoLb2h0wa
         +wgk2PAjL+yT3x1O+Qamb/deFdQZAKEoibUiUz6/XSjh5ooviRCbwa9WF9mTEX7gtgOJ
         dlKwcDgxWXv36/PrGUermMVEud1Tu7B1ZxAiQq0jpeD7ovcbNxn/jzSQO7Y7n34S3k30
         37cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681806271; x=1684398271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5oKAYbsVysV5zF+myMqONTAUveV47CceODODEhedGw=;
        b=cC1ABltnbR2E/4XZtKzmqR6jir/yLD6qyJSHWjlk5thPCKQGQ2MyAsM9R3kx1Sd48N
         Su5NcKkqipzwhA/KGq/QiLj7lIETjFePFijR5sJotD/6jrStpC+kQSEAZ1PsJA/c5V9t
         dtc1We8DowZqh7njYhvg+sqpJEw48pRIAKoseUYPQGPRTJEVaqM2emdT69jGnafNWzZS
         /U7E8g39j1C2txfgr7OVR4X8ASRniPxpvrUNKLPM+abm18rXTjzLz9HbddDjN5B3LaBR
         gyM2aH7Q3O+gwnGP0trHNzmbZ86fUzEC+mqsRfEqedKgEfYgmkZg4A2FgHECkk6S2h4N
         UZYQ==
X-Gm-Message-State: AAQBX9el1syO5ryziC9ZyfAOlQkep3Rswp2KYmsCYKPWAWg23qOgSpMF
	XHFxSWQNl2XnbriGJLDesCgDbQ==
X-Google-Smtp-Source: AKy350YDINGQqPxYh26iUVoQUoVgEARu2cswDZaKR4lBSw3TAPwZIFiGLbEi8J5lk+iZclfe4G055Q==
X-Received: by 2002:a2e:3a13:0:b0:2a8:ca1c:12b with SMTP id h19-20020a2e3a13000000b002a8ca1c012bmr451070lja.17.1681806271118;
        Tue, 18 Apr 2023 01:24:31 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id g6-20020a2e9e46000000b00295a96a0f6csm2409222ljk.102.2023.04.18.01.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 01:24:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: config: Update Vexpress defconfig
Date: Tue, 18 Apr 2023 10:24:27 +0200
Message-Id: <20230418082427.186677-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Versatile Express should conform to standard contemporary
kernel features: add NO_HZ_FULL and HIGH_RES_TIMERS. Also add
the AFS flash partitions as these are used on the platform.

The removed SCHED_DEBUG is due to Kconfig changes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this to the appropriate branch when
appropriate, for this or the next kernel cycle.
---
 arch/arm/configs/vexpress_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index ac3fd7523698..96ad442089bd 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -1,5 +1,7 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_FULL=y
+CONFIG_HIGH_RES_TIMERS=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
@@ -42,6 +44,7 @@ CONFIG_NET_9P_VIRTIO=y
 CONFIG_DEVTMPFS=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_AFS_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
@@ -137,5 +140,4 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DETECT_HUNG_TASK=y
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_DEBUG_USER=y
-- 
2.34.1

