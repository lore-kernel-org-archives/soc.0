Return-Path: <SRS0=Tcbz=HM=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA90C07E97
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 16:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB991C4339A; Fri,  1 Dec 2023 16:11:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67DD6C32776
	for <soc@kernel.org>; Fri,  1 Dec 2023 16:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67DD6C32776
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-332e40315bdso1624561f8f.1
        for <soc@kernel.org>; Fri, 01 Dec 2023 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447079; x=1702051879; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGa7Ijft1EBu8UVzayeo7MTZkMcFeh7xh+YN0z5QS2k=;
        b=tlwQJ9iLjyz0tL/1DX6SjnyHbf0xlWywe0wrQ8+tAZ6WnqJNseqp6FOAxH290MVzwT
         mKXWwiLAXhhpHL2D+lNcHf7gCJtnvIYry6B2+fWyX3pdEbWqINi76YR2xXkTRplsAeaP
         H8yLXYX5bbAzFVe6YkG76i+Cz5di9gc77GqR2VvQL2yDXM/4cllaa3uh/tCd1nMhQB10
         QIlV1gxIvIx0cDctoGSbSAjqmZIEbBxKiY7xEaJPsCAFdORNGqRQK1+g7wJwKBZH1BMh
         kq33T+hZlwUe1iEXxdKx8a+hXjstVdUJZx9YIsp9j/qYUNqSP4h7swrMewYf6yPE+6Ga
         /mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447079; x=1702051879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGa7Ijft1EBu8UVzayeo7MTZkMcFeh7xh+YN0z5QS2k=;
        b=AWM1w32U/P+ge3tS39OSE1Ih+j09gHK/5jRbHfrKq9pB8DIuf+5nLijtHLudS08ZKf
         J0Hvy4uK+jdQPR6Q42Pk9ukuJlJ9dE21HMvJHwJ8RbCkyBd+8TiefgSx2IZJiZvk/yza
         m2x1AqFvGwkCP0Q/Zrz+p93MCb6clqDKITTxaK2+PEtLfcYB6WC0N4qnPgVxRcgbO82A
         /O2P0GiVMxDYpiWvyQ2XBaHjkq2lpL1XeqoVeJUArPO3kLT7ViuXSroGe3cyeSfXR8/j
         mXTf6FGTVFMPZlNvRRlgyIIJ63oab1WlWlPrWQM1QrhEZo2ON/vE9O0xbTLiJeOSvO/B
         8neg==
X-Gm-Message-State: AOJu0YwegZUgVYxHWcLSa6qWdh/CWm5KjlQ+ySPpv0kWdQICn7PVNZf7
	lkIY+qmQSmRogPc0hQw0mTvfCg==
X-Google-Smtp-Source: AGHT+IGxG4p6gUCgnf4haiIEGOEJXC+oyIvA22Wsild87j4sKHlHkElsxyJGVDo3VWPWNapGJzJPQQ==
X-Received: by 2002:adf:fc84:0:b0:333:3518:c6a4 with SMTP id g4-20020adffc84000000b003333518c6a4mr336557wrr.102.1701447079286;
        Fri, 01 Dec 2023 08:11:19 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:18 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 19/20] arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
Date: Fri,  1 Dec 2023 16:09:24 +0000
Message-ID: <20231201160925.3136868-20-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial board support for the Pixel 6 phone code named Oriole. This
has been tested with a minimal busybox initramfs and boots to a shell.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |   2 +
 arch/arm64/boot/dts/exynos/google/Makefile    |   4 +
 .../boot/dts/exynos/google/gs101-oriole.dts   | 105 ++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 6e4ba69268e5..44c24a8ad9e1 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+subdir-y += google
+
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
new file mode 100644
index 000000000000..0a6d5e1fe4ee
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_EXYNOS) += \
+	gs101-oriole.dtb \
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
new file mode 100644
index 000000000000..6abd00fa337e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole Device Tree
+ *
+ * Copyright 2021-2023 Google,LLC
+ * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "gs101-pinctrl.h"
+#include "gs101.dtsi"
+
+/ {
+	model = "Oriole";
+	compatible = "google,gs101-oriole", "google,gs101";
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		/* Bootloader expects bootargs specified otherwise it crashes */
+		bootargs = "";
+		stdout-path = &serial_0;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
+
+		button-vol-down {
+			label = "KEY_VOLUMEDOWN";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-vol-up {
+			label = "KEY_VOLUMEUP";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "KEY_POWER";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+};
+
+&ext_24_5m {
+	clock-frequency = <24576000>;
+};
+
+&ext_200m {
+	clock-frequency = <200000000>;
+};
+
+&pinctrl_far_alive {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa7-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa8-1";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_gpio_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa10-1";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&serial_0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_bus>;
+};
+
+&usi_uart {
+	status = "okay";
+	samsung,clkreq-on; /* needed for UART mode */
+};
+
+&watchdog_cl0 {
+	timeout-sec = <30>;
+	status = "okay";
+};
-- 
2.43.0.rc2.451.g8631bc7472-goog

