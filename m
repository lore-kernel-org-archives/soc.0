Return-Path: <SRS0=f+8Q=H5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1FFC35274
	for <soc@archiver.kernel.org>; Mon, 18 Dec 2023 13:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A312AC433C9; Mon, 18 Dec 2023 13:45:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 682FFC433C8
	for <soc@kernel.org>; Mon, 18 Dec 2023 13:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 682FFC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a236456fee1so67932666b.1
        for <soc@kernel.org>; Mon, 18 Dec 2023 05:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702907142; x=1703511942; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKhb1wuaASLimxbRARfMv02XJ8Pn6jccWBoKn7oICEU=;
        b=po8wRZuw6kmRDWNgpsnBNbgFOj02f1Uje88XyJZkFnD2NDIxos3frLCnrsVTv1UL90
         pw/+vUgXnRKQH+hEE1gAumddHo9smtirVaX/siRILtSlq2flnnaY9qtyFuSMvcE/16KN
         gw7njBqGVxvcBVAvEjK5V/cPElQw28x8qZl3CBBCzEsATrvDV4zpF+ZECDe8W43w3Ys1
         4MKoG1XSHJNcyBj6hyrDugQbBxXTDcXWMnf7L0PGV0EGitQTNIZDvjhJI757vYVlPK9y
         cORcfAQmk/uLKIuMkhq8/Zfkbl2P6SXOyiaedqhyBQvhZrnGhjQ7KG6LLUIAPoFf2E4H
         Z09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907142; x=1703511942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKhb1wuaASLimxbRARfMv02XJ8Pn6jccWBoKn7oICEU=;
        b=Az8OwLsNfB70ZiuQ/HAa4QyVn6/EZnsxgem9SWRx6V62S3PfpHilKUIzZzI75Qvb57
         RPoholNmhMDUOdT7BZ18/b7lUIKkDc2lmj3TEhP5rb1Ns192ngCu/fUqgu8VJGI6K9GV
         K5KDVgF1+JkV4O7u4E9Uqbpg2qba//HVlHUVBWhmWeOhdbQzLiKuLe+N0+EyruRr8MLz
         KKCqBNT2CepTLaf73f4DM3WgObpDjFJhYPE7YemsOZUQ7ru0NqlHH4teuLs+ZnR9Xc9j
         1GkHpqJiPCYqhTeQGEAwo4rmFD2kJ8xhvIOWo4bSCDmuPAYTg4YIke4EL0zqiAef2QZg
         bWHw==
X-Gm-Message-State: AOJu0YzXEYsLXmxyUOlbYcENZyIdpSI7KxooK2KkESmXwnK/Nj2sLN7d
	dUFI/k1sFPmFkuA7RbwPc/566A==
X-Google-Smtp-Source: AGHT+IFs7wt3ToRlnwY7EWDI6F7umGuxxvB8rQGh/rKbHCiv45OnY0HarLfW0BWd14nFz1qBMlhM9Q==
X-Received: by 2002:a17:907:d1b:b0:a23:614d:37c7 with SMTP id gn27-20020a1709070d1b00b00a23614d37c7mr587185ejc.141.1702907142528;
        Mon, 18 Dec 2023 05:45:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id lm11-20020a17090718cb00b00a1db76f99c8sm14345334ejc.93.2023.12.18.05.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 05:45:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Steve Sakoman <sakoman@gmail.com>,
	"Mark F . Brown" <mark.brown314@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Florian Fainelli <florian@openwrt.org>,
	Simtec Linux Team <linux@simtec.co.uk>
Subject: [PATCH] ARM: MAINTAINERS: drop empty entries for removed boards
Date: Mon, 18 Dec 2023 14:45:32 +0100
Message-Id: <20231218134532.50599-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop empty and redundant maintainer entries for boards which were
removed to fix `scripts/get_maintainer.pl --self-test=sections` errors
like:

  ./MAINTAINERS:2021: warning: section without file pattern	ARM/CIRRUS LOGIC EDB9315A MACHINE SUPPORT

Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Steve Sakoman <sakoman@gmail.com>
Cc: Mark F. Brown <mark.brown314@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Florian Fainelli <florian@openwrt.org>
Cc: Simtec Linux Team <linux@simtec.co.uk>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 42 ------------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d26c5311fb1..cdf1575dc851 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2018,11 +2018,6 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 N:	clps711x
 
-ARM/CIRRUS LOGIC EDB9315A MACHINE SUPPORT
-M:	Lennert Buytenhek <kernel@wantstofly.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
 ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE
 M:	Hartley Sweeten <hsweeten@visionengravers.com>
 M:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
@@ -2171,11 +2166,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
 F:	arch/arm/boot/dts/nxp/vf/
 F:	arch/arm/mach-imx/*vf610*
 
-ARM/GUMSTIX MACHINE SUPPORT
-M:	Steve Sakoman <sakoman@gmail.com>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
 ARM/HISILICON SOC SUPPORT
 M:	Wei Xu <xuwei5@hisilicon.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -2254,11 +2244,6 @@ F:	Documentation/devicetree/bindings/arm/intel,keembay.yaml
 F:	arch/arm64/boot/dts/intel/keembay-evm.dts
 F:	arch/arm64/boot/dts/intel/keembay-soc.dtsi
 
-ARM/INTEL XSC3 (MANZANO) ARM CORE
-M:	Lennert Buytenhek <kernel@wantstofly.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
 ARM/LG1K ARCHITECTURE
 M:	Chanho Min <chanho.min@lge.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -2840,11 +2825,6 @@ F:	arch/arm/boot/dts/synaptics/
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
 
-ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
-M:	Lennert Buytenhek <kernel@wantstofly.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
 ARM/TEGRA HDMI CEC SUBSYSTEM SUPPORT
 M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-tegra@vger.kernel.org
@@ -2861,11 +2841,6 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	arch/arm64/boot/dts/tesla/
 
-ARM/TETON BGA MACHINE SUPPORT
-M:	"Mark F. Brown" <mark.brown314@gmail.com>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
 ARM/TEXAS INSTRUMENT AEMIF/EMIF DRIVERS
 M:	Santosh Shilimkar <ssantosh@kernel.org>
 L:	linux-kernel@vger.kernel.org
@@ -17674,14 +17649,6 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-pxa.c
 
-PXA MMCI DRIVER
-S:	Orphan
-
-PXA RTC DRIVER
-M:	Robert Jarzmik <robert.jarzmik@free.fr>
-L:	linux-rtc@vger.kernel.org
-S:	Maintained
-
 PXA2xx/PXA3xx SUPPORT
 M:	Daniel Mack <daniel@zonque.org>
 M:	Haojian Zhuang <haojian.zhuang@gmail.com>
@@ -18320,10 +18287,6 @@ F:	drivers/media/i2c/max9271.c
 F:	drivers/media/i2c/max9271.h
 F:	drivers/media/i2c/rdacm21.c
 
-RDC R-321X SoC
-M:	Florian Fainelli <florian@openwrt.org>
-S:	Maintained
-
 RDC R6040 FAST ETHERNET DRIVER
 M:	Florian Fainelli <f.fainelli@gmail.com>
 L:	netdev@vger.kernel.org
@@ -19930,11 +19893,6 @@ F:	Documentation/devicetree/bindings/display/simple-framebuffer.yaml
 F:	drivers/video/fbdev/simplefb.c
 F:	include/linux/platform_data/simplefb.h
 
-SIMTEC EB110ATX (Chalice CATS)
-M:	Simtec Linux Team <linux@simtec.co.uk>
-S:	Supported
-W:	http://www.simtec.co.uk/products/EB110ATX/
-
 SIOX
 M:	Thorsten Scherer <t.scherer@eckelmann.de>
 M:	Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
-- 
2.34.1

