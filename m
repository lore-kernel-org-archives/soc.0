Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E435F184
	for <soc@lists.linux.dev>; Sun, 26 Apr 2026 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204513; cv=none; b=GyuVjjP+/JWBkbtDqVZYYryeNQAyGXipiTlGdRUFeLMTDmYTPdinBB/nZF4LraNWKAt6+NOHHqpnDGdhqGV3cTwmH+S5tspwKtiYu9w1+wl168mkxJwBkL7v0HSXLyhb7CW26noL21O2kNJqGUlmExl9W6Sg+1DGtCGaj3OKQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204513; c=relaxed/simple;
	bh=7LiDLxjelI1MRSngPzWRBkqRNsscbkTyc8tG8Vfm5PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V12l6SV11ZJ8WUMyP5GzQzhz5sWpsAO46abz+g3ZEZiTaUhpgNI+S6lHf+tMGePDrz98labuiWvgXT+yWPftdwUUtGBu2ngnTdE3KB2AbI3KMHgyo4sFi7Ex1iff8lKwiQrcyB62gZ6SQiEARJkaAoSm6jhm8/ASQ01fpoOx6oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aafItNfW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aafItNfW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48896199cbaso91627705e9.1
        for <soc@lists.linux.dev>; Sun, 26 Apr 2026 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204510; x=1777809310; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mK1m9udRxQHj0zYCLQVzg/V9Z3Gw4DlTQK/hyL0gOMA=;
        b=aafItNfWfgyAohYOD75BnyfrobTofjv7jcCJtITETbV7Mpa0m0gVZ1kPiyrylJ9bf7
         xCnYGGOnsZ0E7rqMUkbUdZZQkcKaFeToyv6SBzOSHecG0oUTZ9KFc+zt1c7E86cQn/0l
         FPpTmDJHF7evEXg/HV+cZSQ2sJrpFPwIv0of7USs244UmyAPnyh4dlJMGiWz78Ac8eVa
         JpmhQsyYpcXxZt1VKX+7PDwwsMFD733ok+dtxWbalupdue+joWjneCaKPv/iOG9O9V6b
         8Z2JfnwXpPXaarJaaLtrCEggY7jQ5DSHic/k9GoYpuscYVvUWKxauNxLzrfVOEvrqIhY
         64Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204510; x=1777809310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mK1m9udRxQHj0zYCLQVzg/V9Z3Gw4DlTQK/hyL0gOMA=;
        b=KANQvTzucphCk4UFwGKNVcIEgnp2Ul6s6pwfnrAw8dloYNy3pdM7c625geQn24F36Q
         BLd14oFdWnMvVeGsFMyImX3bOeMnYnNMi+LkRag7XMh+0Ym4tOAh8rkui6EBnEPUtkev
         jZkxiOfGe2bit+JUXqxG3l51vNH0lGix11YHT87YxizcKWisxmJBmOYK+1IWsKdKsbiS
         QGEaaj+duPMzZsWS6bswrCq0yWZ7GSZCYJUJGwA0/Gh3gb+ymPKX85oLmuMPyPAeLTYC
         S/IHvABhx7s/nHin0vWcOuK9DuVeLeykveW+IHM/kr0pIjgJrSr9GvpvDl1faoGPKidX
         9Ufg==
X-Forwarded-Encrypted: i=1; AFNElJ8/tFMrzWA5vlXgLTTl1wEr0N7fx14PNelSHK3Ab30zvWJbqZjjyu2F//uqON5yDb24pgs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywey47Lei68eRgN7DZsmfpFhcWESNU3I83hwIKR/pEPL+XQ281b
	dcxTzPkf2Kkc/Kr6YqZRKAwVvOFXJmvudkiESUQcOInSJCPB/yV/F1pF1T+GGlsIZfc=
X-Gm-Gg: AeBDievoKDzLbW1AaRWf2P9ccOOFN4i5bTxlgbuvTX6kiCEdT0HyPW4V0YgKhbbnNHA
	BE3MjKHXIsIg6ySmLhVYuv05xcbfqsdtu8fo1vH5CY93CCCQucTzplztssGGwWOotDiuX782PEz
	DREZVUDqec7QSFodMj6AJCu4KWxb5dO8Q3O2nNharYWif58ResWg9tmtKm4o9Oo33pRzYJ45XQK
	Y+u0KUhxKX4y3anvCfJMySoIABVdJxeHvfOetupnve6XfQzTN4rGi4IEr2ztBA/ESxdtXgwAjrI
	lLu7zcRGH2m9+4Y/zOxyYI/xWHo7SegH9Lbyj/xzM/ZVcMOfRk82oRlzljHeRFLU1QFsomsyzqa
	weXh1OaFOP3kJ+rLO8Dc9KaB916p/gjcifLfinO0EkZQLPOm94J7AMu4W274GkwQ5S0lIKVFcQ4
	IhZa5dNClUaNGvbkbCp9iRjxgppOnDwW6wA91UUaGW
X-Received: by 2002:a05:600c:859a:b0:48a:53ea:13eb with SMTP id 5b1f17b1804b1-48a53ea15bdmr253731785e9.5.1777204510297;
        Sun, 26 Apr 2026 04:55:10 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:55:09 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:18 +0300
Subject: [PATCH v6 5/6] ARM: dts: zte: Add D-Link DWR-932M support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-5-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6135;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7LiDLxjelI1MRSngPzWRBkqRNsscbkTyc8tG8Vfm5PA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+nKYBbeora7Iw1jJsBhhrBdnEGMJVLLNgi
 Xxnlq1LNJqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLBsg/+O2LB3GiEIlG1JYzfdE08ZV0GYD5wKhr
 cB8qmfTKMNwyrAw1yUAOwFk8JfmU62lcbQdxgTtkbaiZwJxqPwhMjjSMayynCsmJcLyQwknDS+z
 r9mXjmAFAkGLGG5J+zzT4i2JLUt4TLXwaSZlRr5j5ra1YsOI53UmwDGDul6OJO33CuEhZG8lHqd
 UrY2uASSJjNeOT/nV6JnDgaM4iyhDIsVwJwK6C33NFpvRK5lL2uQwdrv+0eDKTjz3uenF9JlCac
 0xb/c2PCh3IZ+QpqLIDvQUwfYQ7qQS28ZWSkihoBvWpsAA7vQL0h+C1I31Fl6C2q5WnxUXWXGa7
 ijc3gRpLTMYpGmvKT3lutAGO1CXJOAA5a1L9D0aU+Dk8f14fSziX01UbyMZXVAfAOAK4fl5Qguy
 TNoCaYd+QxpgAwqYa79gx1Zuc4iDgWL48Ry5WpHwUIn3yDfIilv/8ngmmV/ii339Q0NJJApHVUU
 XPlqPihFrc58y+hLNYwQyViTj2rWPwC5saGa35+f4jGIoDkCkS8QMarbNJl2QsLHtYsy+EYpxK5
 HmHGupZEzxp2a+sUCZ7sPzIDqfHjlEFBWc2Ffyf2Edgpym92XhuxQlIxPgOqdnsAWjEsTVr4MY5
 cm181MA+QxqYrU0wz0yjPr5sQeaAe1b4A1roCx+l53Tu6ik4gRiA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This adds base DT definition for zx297520v3 and one board that consumes it.

The stock kernel does not use the armv7 timer, but it seems to work
fine. The board has other board-specific timers that would need a driver
and I see no reason to bother with them since the arm standard timer
works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes in
v6: Squash board + timer + uart patches into one
v5: Prepend the SoC name in the device specific DTS filename.
v4:
  Declare all uarts
  Remove the UART aliases for now. I can revisit this when I get my
  hands on a board that exposes two UARTs.
---
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 +++++++++++++++++++++
 5 files changed, 130 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e707176c2114..6f51ba1c5ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3775,6 +3775,7 @@ F:	drivers/video/fbdev/wmt_ge_rops.*
 ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..f052cfbd636c
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	zx297520v3-dlink-dwr932m.dtb
diff --git a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
new file mode 100644
index 000000000000..1700f46aba86
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "dlink,dwr932m", "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..ca65797ed926
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
+	 * been added.
+	 */
+	uartclk: uartclk: uartclk-26000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <26000000>;
+		interrupt-parent = <&gic>;
+		/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+		 * arm timer at all. Since this is a single CPU system I don't think it
+		 * really matters that the offset is random though.
+		 */
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+
+		uart0: serial@131000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x00131000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@140d000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x0140d000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+	};
+};

-- 
2.53.0

