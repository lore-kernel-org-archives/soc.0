Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7301CCD98D4
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50DC1C43397; Tue, 10 Oct 2023 22:50:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42A77C116B0
	for <soc@kernel.org>; Tue, 10 Oct 2023 22:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42A77C116B0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3296b49c546so4038760f8f.3
        for <soc@kernel.org>; Tue, 10 Oct 2023 15:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978213; x=1697583013; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8B+1n8ZspvMDAO+6CGyqMp1YUiIBa+Rr/m0wXbQpt1w=;
        b=Y6piDtSkrP9j1o5YFpYLi4VWkgl8EorFsOgzy1lb0sT0jUnnvhkwHv0MmOioR56CKf
         vg76fYYC10g3gi713/CVoCAPUdXW6RR29BIHr2XDmUTCj8P4iMSUmw18uPF4xoQu0sYF
         +jk1YSOuTJK43ivd7zFd6JOwQwuPduLA/q6Ts8iUdu8N0aDAn0DUxlK3bb+FyKGCMTGa
         sD/BtW/gMfKoLLi7c0Cg3HXW3qA7C8JmzJuCT4zUUNt9GJMuQWEIMtNJSmOyVEyU5KCd
         4xZ41Df9LJFIX6QDRjqWX7Q4BKWpMoniS32VUXGyZMXL7Axyl/kaIK0U5mEZMT7PVRb7
         Mpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978213; x=1697583013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8B+1n8ZspvMDAO+6CGyqMp1YUiIBa+Rr/m0wXbQpt1w=;
        b=gQfMqHGROcQ7LMduQe7YqUyzwqxuSUEVVcCG6msNMMtqH7q4qTvEYOusMJ1LmkzsqK
         Ii9JjIWt2eNCIB5g2xmwc8XXUEE87lYebJs/d4O9wY2wkiH76Q6DI7z4LMfNg60M86P8
         rC1dAjo1f5NqQx3sJGbi2AJ2OawqWsxFkKvhSCohTLOebMU41ae3aRkjfcjPLn7HWv13
         XagvtL213RtFsvgc3zmpN632x0jcNk2n3HlzyNQRlbgQuz9eBZrShH0HzRz8F0P/LjCZ
         +esDAQ/iAQ+OahblgCY3dzgG9yUBIeTDSvSD0a8eoHkrKGml5uCYKobOrU2UVF1cgxdR
         Y0Mg==
X-Gm-Message-State: AOJu0YxOw805RjXh044B/s0lLN0wHJtB3MgIECJcNqv6JNMcEquO3CZf
	NGpsi+Lizllz+gPXGUo3a+gSpA==
X-Google-Smtp-Source: AGHT+IFNKYWmXPYya1Bjw42Oh7jD9oz26ynuGCLLvWuIaWGFX6zOsUeNHcNJv6bU1UptvL6ZW4qmrg==
X-Received: by 2002:a5d:5103:0:b0:31f:b138:5a0 with SMTP id s3-20020a5d5103000000b0031fb13805a0mr16014732wrt.48.1696978212798;
        Tue, 10 Oct 2023 15:50:12 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:50:11 -0700 (PDT)
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
	cw00.choi@samsung.com
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
Subject: [PATCH v2 18/20] arm64: dts: google: Add initial Oriole/pixel 6 board support
Date: Tue, 10 Oct 2023 23:49:26 +0100
Message-ID: <20231010224928.2296997-19-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial board support for the Pixel 6 phone code named Oriole. This
has been tested with a minimal busybox initramfs and boots to a shell.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/google/Makefile         |  4 ++
 arch/arm64/boot/dts/google/gs101-oriole.dts | 79 +++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts

diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 000000000000..5cea8ff27141
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
+	gs101-oriole.dtb \
diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dts b/arch/arm64/boot/dts/google/gs101-oriole.dts
new file mode 100644
index 000000000000..3bebca989d34
--- /dev/null
+++ b/arch/arm64/boot/dts/google/gs101-oriole.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole Device Tree
+ *
+ * Copyright 2021-2023 Google,LLC
+ */
+
+/dts-v1/;
+/plugin/;
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
+	chosen {
+		bootargs = "earlycon=exynos4210,mmio32,0x10A00000 console=ttySAC0";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_voldown &key_volup &key_power>;
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
+&pinctrl_1 {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa7-3";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa8-1";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_0 {
+	key_power: key-power-pins {
+		samsung,pins = "gpa10-1";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&watchdog_cl0 {
+	timeout-sec = <30>;
+};
-- 
2.42.0.609.gbb76f46606-goog

