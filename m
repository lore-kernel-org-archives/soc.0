Return-Path: <SRS0=r8q2=LT=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF7CC48BC2
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 09:50:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 454F16141A; Fri, 25 Jun 2021 09:50:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A3E9613EF;
	Fri, 25 Jun 2021 09:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A3E9613EF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wr1-f52.google.com with SMTP id e22so9921059wrc.1;
        Fri, 25 Jun 2021 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tdUCHqRzdFtehbyvHCRDKCOPbwJWc6IwAT6o0KnmvLg=;
        b=tUTLj0FbnacbfWjcteBXZIfOW1nLEyUP2ymLGbUaY2/7919nOiPDiOhRn2q1Gc+N1R
         AhZ6514wjkYCh0Gvmq6UqhxAgPjfJ+9zPLSfW5GtALZ2zLku60twetXFmVLRF2PRlXhY
         +FbbsiSUgqEL/Btva3VMWzEuYrSKF9eKvJR6dbu1m/JX9NiIrb1TsTCbUr06Tm6X+7Cd
         p5g2cM5Elnc4WnNfymzJwANLTTDDl9HP8GYPty+SMX4WQ9M3a8qwqYAGb8XV9SWgeUjy
         Zp0w45ICKlFkg0CQQUD8J81H/gocYxiFdWUTszclvWKwgk0V9iv7ldsNj8ccPunSz3a7
         1T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tdUCHqRzdFtehbyvHCRDKCOPbwJWc6IwAT6o0KnmvLg=;
        b=VqwGTlIWgx52a8YsAsxc0leUguGJMf19NnXMjX7aQh3GRIlmpgfkUUh1V9j2Do+CMC
         bCayBzME0++n4tK7u0q4kW9Ea0KX9qeupj3x76nHVW6qiVbDVPAq/aa/pOj6mZbqkR5B
         VcTiJsWhK5RVGDz6jPMK0tfH+6Z9ydn1S3f5V+W7H5+BLQJASp0vETn6hrG3zAdbGRdO
         VSh/V6QGZpERlXA8b5D7U9Kf5ytonQMmHKKZJKBlaPY/fyVZ9Wyj7X5IqPMV+myDj1mc
         Cct/21qmuQqvZmHhMXnHd8aJFYlyKiXdfvj8BapaqIHKvoxny+lYHd5g/grjrcXElQ/S
         doGw==
X-Gm-Message-State: AOAM53042Y3T567qu/9tlMyCWdsdIDCU2Rq0gITEaBKFcoO8bI+INnPt
	OFJz95MJVUd5vdcX/Iqh2Y0=
X-Google-Smtp-Source: ABdhPJygxZLOUgHoMMTywCCzWthTblrzHmYki7VT1Uh7Jd6na+mD+hdws7WW2oc83gCgJLgWnqJwYA==
X-Received: by 2002:a05:6000:128b:: with SMTP id f11mr10063618wrx.171.1624614631872;
        Fri, 25 Jun 2021 02:50:31 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id n4sm5662060wrw.21.2021.06.25.02.50.31
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 25 Jun 2021 02:50:31 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] ARM: dts: NSP: Add common bindings for MX64/MX65
Date: Fri, 25 Jun 2021 10:49:48 +0100
Message-Id: <20210625095000.3358973-2-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210625095000.3358973-1-mnhagan88@gmail.com>
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These bindings are required for all Meraki MX64/MX65 devices. These
common bindings include memory (2GB), PWM LEDs, AMAC, I2C (AT24), NAND
partitions, EHCI, OHCI and pinctrl.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi

diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
new file mode 100644
index 000000000000..b2336bd0e19b
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Common Bindings for Cisco Meraki MX64 (Kingpin) and MX65 (Alamo) devices.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm-nsp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x60000000 0x80000000>;
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-1 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_RED>;
+			pwms = <&pwm 1 50000>;
+			max-brightness = <255>;
+		};
+
+		led-2 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			pwms = <&pwm 2 50000>;
+			max-brightness = <255>;
+		};
+
+		led-3 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_BLUE>;
+			pwms = <&pwm 3 50000>;
+			max-brightness = <255>;
+		};
+	};
+};
+
+&amac2 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	at24@50 {
+		compatible = "atmel,24c64";
+		pagesize = <32>;
+		reg = <0x50>;
+	};
+};
+
+&L2 {
+	arm,io-coherent;
+	prefetch-data = <1>;
+	prefetch-instr = <1>;
+};
+
+&nand {
+	nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-on-flash-bbt;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		nand-ecc-strength = <24>;
+		nand-ecc-step-size = <1024>;
+
+		brcm,nand-oob-sector-size = <27>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0 0x80000>;
+			read-only;
+		};
+
+		partition@80000 {
+			label = "shmoo";
+			reg = <0x80000 0x80000>;
+			read-only;
+		};
+
+		partition@100000 {
+			label = "bootkernel1";
+			reg = <0x100000 0x300000>;
+		};
+
+		partition@400000 {
+			label = "nvram";
+			reg = <0x400000 0x100000>;
+		};
+
+		partition@500000 {
+			label = "bootkernel2";
+			reg = <0x500000 0x300000>;
+		};
+
+		partition@800000 {
+			label = "ubi";
+			reg = <0x800000 0x3f700000>;
+		};
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_leds>;
+
+	pwm_leds: pwm_leds {
+		function = "pwm";
+		groups = "pwm1_grp", "pwm2_grp", "pwm3_grp";
+	};
+};
+
+&pwm {
+	status = "okay";
+	#pwm-cells = <2>;
+};
+
+&uart0 {
+	clock-frequency = <62500000>;
+	status = "okay";
+};
-- 
2.26.3

