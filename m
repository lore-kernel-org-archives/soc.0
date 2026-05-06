Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717B33F582
	for <soc@lists.linux.dev>; Wed,  6 May 2026 19:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096062; cv=none; b=AP58gIPsz93gyBEBtBfgDBAWcFwtPtKJUmM6H8XuXvVHITyhslKwzJjUNLldN/Kou4P2MoQRA2NdFRSSmOnAowuZFTGHisw3hGmXxkyVLKh+9VXyq4/yRrKplLfGvKKtjgvQgRmVd5w+PBdqiJ3KjDY3z0lCHckWXnXj+F9sjNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096062; c=relaxed/simple;
	bh=ZEiGjns9U3m5yLy5ZGIrzh9lkgRuFhlASuJcbgwcHG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWz1dGtSuq3uvqeHFgCumda4SBtBfjpbn+SWGEsTh7fZOkdBL4etM9uEBQjgWr+zmTWv5lwYqK6CPKY9lk32ciEAmLYmsngW5LDRzDr90ex4AzJ154UESSE1a6NMPhe/p+5qlF95clACS1QpDzchre8XsTXasBgaMvICacJksKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ov12XYfO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ov12XYfO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44e1860558fso62040f8f.0
        for <soc@lists.linux.dev>; Wed, 06 May 2026 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096056; x=1778700856; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TwfVpezC0RgzGnR+5kZnlGfJY7eOd+0GsSEocGvqOw=;
        b=ov12XYfOsNVPlOS1lbtOXSbO5uHqHqna2ngPGFrPqf8hIqYeYXyq8DOdDZhzSXVR3B
         2sNH+o7Wk8OnHtFCjnX8QasDsjRb7wIrC7duu7f2pI5Gaeke3ZyaL5P00uuittmHT7A+
         /1KIUieQNTR5+OVwaBhxbYirjlDeq3UqDzXKKDqFBYFiEw5tL3RZhwSIc29VQKPmx+cL
         lP5g1NDeWQS4uPA0E4EO5pFJnBVNnYvVKBaWdSvI5pKO+lm0i91b5PGcYinOGK5gJvNi
         6RPa87LQSXuKfdTZLVPblkTVRMYywdOblh2znhxvKVAZse99v9gKOkOUFQX/JyPQR7sd
         l4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096056; x=1778700856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2TwfVpezC0RgzGnR+5kZnlGfJY7eOd+0GsSEocGvqOw=;
        b=UJ98oDzyVPgLPr/gXe+jgnaLtE5pNKP0C1x0HMxAW9CCpTUf5klOEKY/u5PnQcq/Th
         3oAW8TGD0NwrK4tdjD8dVvD0NcqWXcaB5OW+eSs0G3+C5iJqP6eyLQq2nLbhdzzGgN1w
         TQTql/OJ5E5BRHhnFeGt21d2ZDSgrB1lUtwEbE2QIDCvb8m0FpU+do9wsvaaB3yx2VfT
         W8X7K3feHg2F2ueb19so4wlV7QcWFiobuKlZdzEy0xLeaGZkyNbnbF4lgv+vP7QiDzGs
         Stfi/ft7KYOk85KTY2BQw4Ora2WMedW8z63ty2xUIn34tJLBYXDTrjSYzKfdYDgV+hWc
         o0NQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XK8Kj9ZozmZnm6MnHSyQ/teZmqbVzpoIFJd+4WQv5KYe/4Uvx1ENMWKDpsvc+TpF1aa0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO7TFnJPENc44tfCEFkEhIylnOjs/ZDEMJsh05lqjclw+lC9LR
	bTsEog08KsgHOqf2moB/70y8Pp3BeLYqfXyK53HvUXn3rvjoyEvK62Wt
X-Gm-Gg: AeBDievEMag43b7A3Brf7fM7AYor3xHAsmQLX9nSc3g2txphfHnwiP9+JpdemuFfpSV
	VClOlCeK8KXOH9CZ+hWtW0BjIEbei0mq4Exeg3qFONzRfzJE4y7yWICv2mVDQc5AVVA9JxmfdU3
	yRfKMZ/1lcSo9whdzGZCGvSLTugiynZhk/U+NSXkCOmTOeEipeD5rkCLMN5Wnk+HARFXU5QOjOZ
	9YG0nsGeCA/4tXIk1f/ZAjAqouhohCCh2wITLCQxZbmJTvmETqiGiasSLsAvAMJzp+8MBkIOnxw
	mSn3Y6RgJPKmpkvgnCpb4jD06P8ETjLhwDXhhVi/SBbanbqHeCl3pVXJww7pqm+R9w1eF2sRwfF
	hUqXpjs43RUmr0kepLDExeVtMjLC8sp7v/w8O+El6ZtyeN2SBagKS1a0VMgOfSd9sR/Nr3BASb4
	/szGLH2rLx8GQ96pNHCekGykMeuCmDs8gR/rFh0xxdyvNjXZrMSVPhEA==
X-Received: by 2002:a5d:64c5:0:b0:44f:e969:7c15 with SMTP id ffacd0b85a97d-4515b057230mr7847306f8f.3.1778096055787;
        Wed, 06 May 2026 12:34:15 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:22 +0300
Subject: [PATCH v8 5/6] ARM: dts: zte: Add D-Link DWR-932M support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-5-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6258;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ZEiGjns9U3m5yLy5ZGIrzh9lkgRuFhlASuJcbgwcHG4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eW50hKxRO8dpnpiZhOIbme+bBLcMDB5Z4pD
 68aGL1N/RKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKIRg//QILi13hbd/g+oKBM9CrIz48opa08edK
 eynSCWwkLGmgS0HgG6qHvJHqMAGYp3qgiBrR7Wb1K17qn8I1V7F4e3hl1BzJ7jQtLLa3PRIoTvd
 yWSoRrGB5QX/KQbgXKz3LjRHO30p322S8gcOGHS79wXkyFFBCgd9gr7yq1+gNoYglYFBVKqnTXJ
 XD2yydPl3CISqTCmUyb8Bt/79mnxTfkglyOTspUgtozjhv0x3lS66eWDjaoX9YLvjhfibt8SYi9
 N/fSYr+g5fcDBAxnXF6uBu2vW2UxJmW0QVfqXv3MJ6OBd/hsiNQMtdMioJbqVJbevov0FbAK7HS
 kVrVUhAdP/RPhnvFI55A3JaeB16WwJeEOAWQRouZSH3qJ0vD+g37bSEy1J67COB5Kof74fVlbyW
 ImeSc3RtCP9qoCfM3KAEjtjUoil35Fk0+YZosLVlSewLq8+qnZIcXJPo1JmAFs7AOq4vZbGnGvb
 gqHA2ICt53ecx1Y+5kcj0Ix688OBSKK87ubS/SZhT7ScpMOB6cBJ4Ki8mdS5qqpuC6AAHWdtbP8
 +CX2LqOLBFI9tYUM5/KMto2NldJJyJt3qQlmvbOpKQ6BnOr5uYEtQNP8uuW9cqwKbQ42WYAIrKf
 gjifXCvmPDvLmvGSNKUdoL8evzHo48fiC1xHdyZ9aoHfihznv82o=
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

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changes in
v8: Remove redundant label, use "arm,pl011" for uart0 and 2 too.
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
index 697287d1b372..b0b774aace55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3776,6 +3776,7 @@ ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/arch/arm/zte/
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
index 000000000000..a16c30a164bb
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
+	uartclk: uartclk-26000000 {
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
+			compatible = "arm,pl011", "arm,primecell";
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
+			compatible = "arm,pl011", "arm,primecell";
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

