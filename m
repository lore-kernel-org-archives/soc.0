Return-Path: <SRS0=i7Gr=UU=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F81BC433F5
	for <soc@archiver.kernel.org>; Sun, 10 Apr 2022 20:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DA9EC385A4; Sun, 10 Apr 2022 20:30:44 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE510C385A1
	for <soc@kernel.org>; Sun, 10 Apr 2022 20:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE510C385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id q14so17762738ljc.12
        for <soc@kernel.org>; Sun, 10 Apr 2022 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vc8qpYMnWrnbEisGyhhs8zQtGaopunQ/9w2IAx3UflU=;
        b=PRCaOLEqNXb01zaEjbvJ9VBlD3aRk1TgBhgzi6e6cAWInP0SuFHZZbSSHTF5hQtN7g
         zCzKDVK1b3PSQTKMlgWdwrcb7E9gcDd8BZrWI71BmwvUXJcPOEEHzKfW3OZ01t5m63wU
         jg6sih/dADEtaG8IUB7reLTJy2mHvobjVVBUyRfVMTnCC8U7wSDPqiw9ufSEsOfAR8tL
         5ca6u4F6NbGWqSK2G6XswMXyqOB4TyCu5OQ9LMOsBlFpmgUVdk0Kq9VFQXD3hb+Hzamw
         v2XR8UHWojxJ0xADGPdCGuaQplbO6dxiSwfX53tS1Pf9fAHkf502X48rKbXkiZNA3xRl
         w4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vc8qpYMnWrnbEisGyhhs8zQtGaopunQ/9w2IAx3UflU=;
        b=ELob4w3eh0ewXukQQ1iX27wypI9wVHSrDoBsOwo64rlpQxqw0iED4d1w+QnEi6w+MX
         trErgyk+wmJYsMpSrAKQNbyyvIV0TInK7rpeuYL+HXNiCKo+/tufI5hAw8+4XGhHTRgf
         lUU37IrraQ/vZfNc6NX1msgGZf/BbJeziqNJ6pe0SDc6xT6Z6xlEpyC1Kdd5fsbuTsFb
         Q/2ebdgI/fsTZgwaCBehbenFLVlwjyiDZ7xvsq4UNIrcjLfbY4ewIeM2RRaQURHcmKOe
         q4r82ZnP4NwrbCFNT4/DXAK5DtgYRwzRceoo5VNXIfyjWW9nyc30ggQPsWKOR+LUX0CK
         gu/w==
X-Gm-Message-State: AOAM531PISdpNrNbXrzUUX6r3RkGzOEWLPNP42QSMacM7GZAatUPuZ1g
	90iUPjZ3AIEWKhP5PfVTfgV+WA==
X-Google-Smtp-Source: ABdhPJxAE3Li7OklrNm3Df8V/aAWCBx3d7cfODsva2/BJ7QwFvdoxKZ5E7JJD4RefRGqK4fCpNHvAg==
X-Received: by 2002:a2e:b2ce:0:b0:24b:5f39:3124 with SMTP id 14-20020a2eb2ce000000b0024b5f393124mr2802068ljz.483.1649622639821;
        Sun, 10 Apr 2022 13:30:39 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id x12-20020a056512046c00b0046b846fcc12sm855758lfd.173.2022.04.10.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:30:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [PATCH] ARM: config: Update Gemini defconfig
Date: Sun, 10 Apr 2022 22:28:37 +0200
Message-Id: <20220410202837.2667333-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Gemini defconfig needs to be updated due to DSA driver
Kconfig changes in the v5.18 merge window:
CONFIG_NET_DSA_REALTEK_SMI is now behind
CONFIG_NET_DSA_REALTEK and the desired DSA switch need
to be selected explicitly with
CONFIG_NET_DSA_REALTEK_RTL8366RB.

Take this opportunity to update some other minor config
options:

- CONFIG_MARVELL_PHY moved around because of Kconfig
  changes.

- CONFIG_SENSORS_DRIVETEMP should be selected since is
  regulates the system critical alert temperature on
  some devices, which is nice if it is handled even
  if initramfs or root fails to mount.

Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Fixes: 319a70a5fea9 ("net: dsa: realtek-smi: move to subdirectory")
Fixes: 765c39a4fafe ("net: dsa: realtek: convert subdrivers into modules")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this patch directly for v5.18
---
 arch/arm/configs/gemini_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index a7acfee11ffc..a80bc8a43091 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -49,11 +49,13 @@ CONFIG_ATA=y
 CONFIG_PATA_FTIDE010=y
 CONFIG_NETDEVICES=y
 CONFIG_TUN=y
+CONFIG_NET_DSA_REALTEK=y
 CONFIG_NET_DSA_REALTEK_SMI=y
+CONFIG_NET_DSA_REALTEK_RTL8366RB=y
 CONFIG_GEMINI_ETHERNET=y
+CONFIG_MARVELL_PHY=y
 CONFIG_MDIO_BITBANG=y
 CONFIG_MDIO_GPIO=y
-CONFIG_MARVELL_PHY=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 # CONFIG_INPUT_MOUSE is not set
@@ -66,6 +68,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
+CONFIG_SENSORS_DRIVETEMP=y
 CONFIG_SENSORS_GPIO_FAN=y
 CONFIG_SENSORS_LM75=y
 CONFIG_THERMAL=y
-- 
2.35.1

