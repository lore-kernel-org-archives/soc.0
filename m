Return-Path: <SRS0=Ikse=JJ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A174C433ED
	for <soc@archiver.kernel.org>; Mon, 12 Apr 2021 13:47:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 08E386128B; Mon, 12 Apr 2021 13:47:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F042610CB
	for <soc@kernel.org>; Mon, 12 Apr 2021 13:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F042610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f52.google.com with SMTP id z13so4430554lfd.9
        for <soc@kernel.org>; Mon, 12 Apr 2021 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0HhOgkxi6adNvPMTz1qTbyoEcmMMeYlubTaxaYt4Nn4=;
        b=raMszZJ8T7hmemwqKuhKAF6ZtVOm6r/BoUcHXk31NqmCjMhNwGksjJWkRUJXmwFDXZ
         X24ZHF8Db6QzZ3RNRFsdMobECXS1pIKolOjH28ObDpkAQ+tYSP/asLGMzZr2mlRYPjzF
         T3OwW8T9YAEdE1qQi8M+IzSUyFG5pw8+1ANIizo+yIBrWBkEU+Lm0U8Em4fTHuTSXK60
         Ewc2Q+9/mcMSmJB9HGJiiTwNkNyH45K6JjJzDXgiNevF0wEF4sBQXzzAu6Ejeg0i4pv0
         Zi6R/sFzUsdo7Dx8q8m7ScYG+nTnOMTrGc6hA9yjkmJkN3v2ty72Ufq4TZ1ZIVFOE8Tz
         b3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0HhOgkxi6adNvPMTz1qTbyoEcmMMeYlubTaxaYt4Nn4=;
        b=BsCHdmXcEcRJKhvGUyMA+qLSgiUcE6sQTbOHap/M7chIemYVDfMGpWg/gZPKq95N8b
         GaUvdyo0m6VfbbVx9TVeCL68jyQHExBO5IQFejRJ9Hxk3DwMKY0srDjVigPbsOGtUt26
         v3dvYBF9ojXBiu2nxq/m91ZBm59Guo8gmOSS82WUTT21rnrgLLB7hfhIyLxBcZh1m30e
         f/7tYE1doi1QKorb/a34aSIUz6YblaxqaXokNy++7ojL6JD00+gz2kZHGJbYY9LUXJzA
         U8Jsw472bU52J7xoPGnNH3n68DqCZvvAxENTF0NCmc/FfRTU0cAQJaJ0NR2eY4k2n5wF
         Up0Q==
X-Gm-Message-State: AOAM531SI39Nyy/oaFD1v7xzhT4cqvkRbAq4VrDV+tRA4HDs/NLSnOVm
	iWNJNdyMFXJ3AqMsQGGP7Uj8Dg==
X-Google-Smtp-Source: ABdhPJzWZRbQIk98M35U0N56Q8aGHZD2Y9tXG3Xz6Rb7MUonQ+rnEETPgNjyFI0Ps1ERMwFq9jbb2w==
X-Received: by 2002:a19:c509:: with SMTP id w9mr4985351lfe.484.1618235229003;
        Mon, 12 Apr 2021 06:47:09 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id f20sm2433719lfk.207.2021.04.12.06.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:47:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: defconfig: gemini: Update defconfig
Date: Mon, 12 Apr 2021 15:47:00 +0200
Message-Id: <20210412134700.1977619-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the Gemini defconfig: some moved options, added som
WLAN drivers existing on the supported platforms and enabled
the drivetemp sensor which is used on the NAS devices.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: apply this wherever defconfigs go.
---
 arch/arm/configs/gemini_defconfig | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index d2d5f1cf815f..4d5409689e68 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -16,6 +16,7 @@ CONFIG_CMDLINE="console=ttyS0,115200n8"
 CONFIG_KEXEC=y
 CONFIG_PM=y
 CONFIG_PARTITION_ADVANCED=y
+CONFIG_IOSCHED_BFQ=y
 CONFIG_BINFMT_MISC=y
 CONFIG_CMA=y
 CONFIG_NET=y
@@ -51,9 +52,27 @@ CONFIG_NETDEVICES=y
 CONFIG_TUN=y
 CONFIG_NET_DSA_REALTEK_SMI=y
 CONFIG_GEMINI_ETHERNET=y
+CONFIG_MARVELL_PHY=y
 CONFIG_MDIO_BITBANG=y
 CONFIG_MDIO_GPIO=y
-CONFIG_MARVELL_PHY=y
+# CONFIG_USB_NET_DRIVERS is not set
+# CONFIG_WLAN_VENDOR_ADMTEK is not set
+# CONFIG_WLAN_VENDOR_ATH is not set
+# CONFIG_WLAN_VENDOR_ATMEL is not set
+# CONFIG_WLAN_VENDOR_BROADCOM is not set
+# CONFIG_WLAN_VENDOR_CISCO is not set
+# CONFIG_WLAN_VENDOR_INTEL is not set
+# CONFIG_WLAN_VENDOR_INTERSIL is not set
+# CONFIG_WLAN_VENDOR_MARVELL is not set
+# CONFIG_WLAN_VENDOR_MEDIATEK is not set
+CONFIG_RT2X00=y
+CONFIG_RT61PCI=y
+CONFIG_RT2800PCI=y
+# CONFIG_WLAN_VENDOR_REALTEK is not set
+# CONFIG_WLAN_VENDOR_RSI is not set
+# CONFIG_WLAN_VENDOR_ST is not set
+# CONFIG_WLAN_VENDOR_TI is not set
+# CONFIG_WLAN_VENDOR_ZYDAS is not set
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 # CONFIG_INPUT_MOUSE is not set
@@ -67,6 +86,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
+CONFIG_SENSORS_DRIVETEMP=y
 CONFIG_SENSORS_GPIO_FAN=y
 CONFIG_SENSORS_LM75=y
 CONFIG_THERMAL=y
@@ -98,5 +118,4 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_ROMFS_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_FS=y
-- 
2.29.2

