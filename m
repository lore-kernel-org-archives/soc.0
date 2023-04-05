Return-Path: <SRS0=wLy3=74=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B28C7619A
	for <soc@archiver.kernel.org>; Wed,  5 Apr 2023 10:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88D1BC4339C; Wed,  5 Apr 2023 10:54:46 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E3A9C433D2
	for <soc@kernel.org>; Wed,  5 Apr 2023 10:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E3A9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id s20so16536017ljp.7
        for <soc@kernel.org>; Wed, 05 Apr 2023 03:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680692083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0cznnhTPpQMbH+lAMlGobnnFvaG/lObo41EpMwr2yI=;
        b=Nxk3ndMtvvs87R6zf1iDq+Zh+5ovX2un1fXZDCPIKeIb3qt7Gr+GD3Cup3oj03vfcq
         zeaM4Zkma3vSyW9+cSYnPYChTsEGzbVB8bOkRZW57DVYmRnYYrwpvtPj76+oSvHsTzot
         0XQTWAIrGRd9fNLBi6B5Q2rbdTu9ZoCVVDWr/P0/CgMb6YGynh7B56xGtJkIsDQv8YmH
         n54hmYhDcWppve2h1BcprTOhZKUtmqMM8T2iPY4kKL2BCefwY7s4HTkdfjnhEhT2dKaj
         1hRZnzLh03udMUmVuD41Tscfh8pRwGhPvVrDDRBNvtrGSYcyoGxiTsakt1LS4s7/8ala
         vgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680692083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0cznnhTPpQMbH+lAMlGobnnFvaG/lObo41EpMwr2yI=;
        b=yLAikGoOj75/Evx5oWggsp+c1qGJbux8hZGPJtI4/Rpg+zW/cPDCh2B5PJ6m1gvqfe
         VZ947tQdAmyRNV0PCxdSJUumUkOWoaIf4r0QxD3w/LsETdzX/9/cr9wz+DgUctKF9LKH
         eRoLRPSRLEBWmlpnRAX33ggjDTcF3bPHIA+NhWmvr5HhLsrXD7hCfeCpqVlwl0cQlaLC
         S53Y1AAxqg730X8ydC74qHCMatULjuj+g/Iog0s6I7Uo1xWFjsIlEysFzcuCBpe33ZXm
         C/djg9J2ponABVO81qhDtnPkY6N+SW340OrejHH9eNoa9QyKMR3Rdun6pz7GCpn6IXJo
         YdTw==
X-Gm-Message-State: AAQBX9fdloQ36KB0JG5uqUcgrOVFXK9NxSyk6IaObNn5aK9kmNnyCyCP
	79q71bC/NneAzucB8Kq9af1D9u2hc4RIt2ohZsU=
X-Google-Smtp-Source: AKy350Y39MAcVHw9jhn6K29YXftEgm9FAfBrhpFnVaLtgc+eREK3oxylLIcRBWgbEHQyUntRYiwxvw==
X-Received: by 2002:a2e:b165:0:b0:29f:3e2e:fbd0 with SMTP id a5-20020a2eb165000000b0029f3e2efbd0mr577375ljm.15.1680692083286;
        Wed, 05 Apr 2023 03:54:43 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id k4-20020a2e9204000000b00295a36fedadsm2798945ljg.26.2023.04.05.03.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:54:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: configs: Update U8500 defconfig
Date: Wed,  5 Apr 2023 12:54:39 +0200
Message-Id: <20230405105439.1739575-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the U8500 defconfig accordingly:

- Add the NFC modules used by some U8500-based systems.

- Switch out the now deleted UX500 crypto drivers to the
  STM32 drivers that we have augmented to work with
  UX500.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this directly wherever you
want config changes to go for current or next.
---
 arch/arm/configs/u8500_defconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 3bdc217667a6..0f55815eecb3 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -38,6 +38,10 @@ CONFIG_CFG80211_DEBUGFS=y
 CONFIG_MAC80211=y
 CONFIG_MAC80211_LEDS=y
 CONFIG_CAIF=y
+CONFIG_NFC=m
+CONFIG_NFC_HCI=m
+CONFIG_NFC_SHDLC=m
+CONFIG_NFC_PN544_I2C=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_GNSS=y
@@ -180,10 +184,8 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-CONFIG_CRYPTO_DEV_UX500=y
-CONFIG_CRYPTO_DEV_UX500_CRYP=y
-CONFIG_CRYPTO_DEV_UX500_HASH=y
-CONFIG_CRYPTO_DEV_UX500_DEBUG=y
+CONFIG_CRYPTO_DEV_STM32_HASH=y
+CONFIG_CRYPTO_DEV_STM32_CRYP=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
-- 
2.39.2

