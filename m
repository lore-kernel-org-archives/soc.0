Return-Path: <SRS0=Rarn=LN=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B7DC67861
	for <soc@archiver.kernel.org>; Mon,  8 Apr 2024 07:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6427CC43394; Mon,  8 Apr 2024 07:32:41 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0773EC433F1
	for <soc@kernel.org>; Mon,  8 Apr 2024 07:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0773EC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5199906493so381287066b.1
        for <soc@kernel.org>; Mon, 08 Apr 2024 00:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712561558; x=1713166358; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5lZnTCu1yIZyp4wxRaJCezpp5E1E4QKRQbdUUco0UI=;
        b=sRUDdltXJnDZ24azl6rEUsjCaMcE1taxlenEjWMBlIt369HmJN+gIFGx1kpRh/Pu/G
         9JzMCCYcGzvje9eI0hp+8zXqOyRqXLW2Wcglo2RN+Px8+PgGCsFUKPh3akCIVLotzx/O
         4pXQGIiNmS/s0/9siMtdCExdaQHUwoMA5Ujiy7sh/NTsM4bhTHk3m4qySA0tRfe/Mgqp
         ByeAjDlC8FE0TkeSreJA7s25oE+SOAIuY68fnIx9ttY+bauR6hd9lf+l1LExJzqBEwMC
         yRTmmd89nc7D1olwS4fvIhbRAiBLJNAs93DIUzJTuqKdcL1MvXM/fhU8DFYrEWtobTKk
         i53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712561558; x=1713166358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5lZnTCu1yIZyp4wxRaJCezpp5E1E4QKRQbdUUco0UI=;
        b=Mfj0ARQCQzw6aJFbmtO6OaP/KdAdgQ4VP3/cxy89fTzz3VwKQoqcdN4tYrBNfyQew+
         EsvVpE1LMmpD2XteZxdi5lYRU2sFq4GibJYeSiZkl3DwtNDSgcJ66UfDpak2bu9SMD0D
         C6O+cV3RGABqFTIq38udkPCYdWXxyvry/jX9/d6Q8yWFudXCUVwvJuATX2ODuivTLjDm
         yfJvCL91TeomkUNXZ/9bBNE+Mz8JgzBPGVNI7l/ysW1dhcx7a28y//5NeAtQ5QmescEJ
         239zH6FV/BOC2AFphctGoTpIhEqC8U0GvaT9nzsxnlfC0hhP1IIOtv9wphTzbyNRsXV2
         ZngQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpH0EZa/n2Z0lP1Xky9G2msnZ8ZQWkdDUAUO600ScsWaRnY1S4S5Ud2bp33+oQzJvZMS5t4Xa7WccwFqtNFw==
X-Gm-Message-State: AOJu0YyjYV2Qf1hii09E+FCrrd11s4ufOVbt7LKC9SygFPzQOeCpb+iT
	N5Krsp4YlRdzkHt5frBpA9KUP6QRt5aSt1P6FLBDr0rYlEfuYo09AVTp50pzKmDIi/wljC9tYm0
	+
X-Google-Smtp-Source: AGHT+IFF1QVy6/siFRMKi943GiaImIIZ5MMbsewRK73sOygI6BR3P7N+FRuflLtbHHMp8JHLMAivjw==
X-Received: by 2002:a17:906:b755:b0:a46:ec44:477c with SMTP id fx21-20020a170906b75500b00a46ec44477cmr5118538ejb.41.1712561558017;
        Mon, 08 Apr 2024 00:32:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id jy5-20020a170907762500b00a466af74ef2sm4061028ejc.2.2024.04.08.00.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:32:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH fixes] MAINTAINERS: Change Krzysztof Kozlowski's email address
Date: Mon,  8 Apr 2024 09:32:34 +0200
Message-Id: <20240408073234.12968-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch Krzysztof Kozlowski's to @kernel.org account.

Link: https://lore.kernel.org/r/20240329174823.74918-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa3b947fb080..9463c84a6824 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2708,7 +2708,7 @@ F:	sound/soc/rockchip/
 N:	rockchip
 
 ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
@@ -5558,7 +5558,7 @@ F:	drivers/cpuidle/cpuidle-big_little.c
 CPUIDLE DRIVER - ARM EXYNOS
 M:	Daniel Lezcano <daniel.lezcano@linaro.org>
 M:	Kukjin Kim <kgene@kernel.org>
-R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+R:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -9002,7 +9002,7 @@ F:	drivers/i2c/muxes/i2c-mux-gpio.c
 F:	include/linux/platform_data/i2c-mux-gpio.h
 
 GENERIC GPIO RESET DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 S:	Maintained
 F:	drivers/reset/reset-gpio.c
 
@@ -13290,7 +13290,7 @@ F:	drivers/iio/adc/max11205.c
 
 MAXIM MAX17040 FAMILY FUEL GAUGE DRIVERS
 R:	Iskren Chernev <iskren.chernev@gmail.com>
-R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+R:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Matheus Castello <matheus@castello.eng.br>
 L:	linux-pm@vger.kernel.org
@@ -13300,7 +13300,7 @@ F:	drivers/power/supply/max17040_battery.c
 
 MAXIM MAX17042 FAMILY FUEL GAUGE DRIVERS
 R:	Hans de Goede <hdegoede@redhat.com>
-R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+R:	Krzysztof Kozlowski <krzk@kernel.org>
 R:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
 R:	Purism Kernel Team <kernel@puri.sm>
@@ -13358,7 +13358,7 @@ F:	Documentation/devicetree/bindings/power/supply/maxim,max77976.yaml
 F:	drivers/power/supply/max77976_charger.c
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
@@ -13369,7 +13369,7 @@ F:	drivers/power/supply/max77693_charger.c
 
 MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
@@ -14151,7 +14151,7 @@ F:	mm/mm_init.c
 F:	tools/testing/memblock/
 
 MEMORY CONTROLLER DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 B:	mailto:krzysztof.kozlowski@linaro.org
@@ -15532,7 +15532,7 @@ F:	include/uapi/linux/nexthop.h
 F:	net/ipv4/nexthop.c
 
 NFC SUBSYSTEM
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/
@@ -15908,7 +15908,7 @@ F:	Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml
 F:	drivers/regulator/pf8x00-regulator.c
 
 NXP PTN5150A CC LOGIC AND EXTCON DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -16519,7 +16519,7 @@ K:	of_overlay_remove
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 M:	Rob Herring <robh@kernel.org>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
+M:	Krzysztof Kozlowski <krzk+dt@kernel.org>
 M:	Conor Dooley <conor+dt@kernel.org>
 L:	devicetree@vger.kernel.org
 S:	Maintained
@@ -17477,7 +17477,7 @@ F:	Documentation/devicetree/bindings/pinctrl/renesas,*
 F:	drivers/pinctrl/renesas/
 
 PIN CONTROLLER - SAMSUNG
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -19414,7 +19414,7 @@ F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -19449,7 +19449,7 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -19475,7 +19475,7 @@ F:	drivers/media/platform/samsung/s3c-camif/
 F:	include/media/drv-intf/s3c_camif.h
 
 SAMSUNG S3FWRN5 NFC DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
 F:	drivers/nfc/s3fwrn5
@@ -19496,7 +19496,7 @@ S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -19518,7 +19518,7 @@ F:	Documentation/devicetree/bindings/media/samsung,fimc.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
 SAMSUNG SOC CLOCK DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
@@ -19550,7 +19550,7 @@ F:	drivers/net/ethernet/samsung/sxgbe/
 
 SAMSUNG THERMAL DRIVER
 M:	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -23738,7 +23738,7 @@ S:	Orphan
 F:	drivers/mmc/host/vub300.c
 
 W1 DALLAS'S 1-WIRE BUS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/w1/
 F:	Documentation/w1/
-- 
2.34.1

