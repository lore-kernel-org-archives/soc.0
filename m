Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A724E4D9
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 22:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225409; cv=none; b=tRxU9Z35ouBt6fDAJlqSSqkwAARK3ty+mdD8SdSRSTrR9U2a/FqAWA/zWVk7JH5WD9t9sztOPhr3UGIFKeSYZWl4fxexFwq+7Pa2PbDuBF8s8dUzLUHYDJ1aYiSkbKfKz+hzCdbXXwdytYQOGy2eQUFY48K+8IZKNf8+ueRQqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225409; c=relaxed/simple;
	bh=36wD/NQDjc3/awdDMS/pWjfJpFkfTtHE330A1WWvTgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8tfRXiKn2rMQGi0f8McB+VuCrvZNWpfS1S2fA8wp5MNA4p55HQ30bC5laLdm8VcQLHpDC9AwC9a3TDmJ88+EUAdvJ+vzVMZQFomaN8vTu2joihT+QQj9iR9Tiyk0H81ex3OrmO2pCjvdHT/bw4GY/wS/LDOv0u/eRaAV936FUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aw9cSCzm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aw9cSCzm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43937cf2131so14605155e9.2
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225406; x=1739830206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J36P/705noaRfrv1RgfEgcaXBGl51BJjTj6/wIyO+Bk=;
        b=Aw9cSCzmJXBm7MWgOmWQU0ZZIFkZ4Wkjl/Ws3X/CtC3ahjqNGu9C2XYpCLZQZhQw02
         +HU14YIS2tjMZ4c+7YZovAGG3XaXtN4+2iABcA5y2iZmZFHujYs0K/H44Vh2kFlQNGHm
         5AgTkP03xBk3BW9Iu2kwXCLs5vb1dzKpiM2adJ6Vm5jmTZjIpzSxoQ75sKEeamiz8sLd
         S5BYNOwWVazenE74a/tU+4dl3I8atJetiMZ+NTBGokmhhXqTqd44WnhCTmwTtThsTxW0
         +i0eUW4wwDxQaE4UK5M3oTp1vhFzaQEJMopEHGp/z6gGiR5eEYJ7iCLTiGuF+VhbpOuw
         Lgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225406; x=1739830206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J36P/705noaRfrv1RgfEgcaXBGl51BJjTj6/wIyO+Bk=;
        b=NJviDiHj2h2KP11Neu4hjvOcC0Z+eRR5tSw+vWNkOPaD5o+LWFueO2SPlASw1DsUgw
         v71RGLtQH3Nq2CuTG2/j45cloSk6SeOl9lPuSHwqIVgY9Sgp/Nqv0ntG4lB3EbTYAmt5
         DdSm0v9+mEWcuamR7WD1bn3u7B6c40/zI8Igz2mRmQpEDHCKyQT28yWP0INX40/24Mwl
         BXHO+/g0yjYCqo+s1mh6ICOz5sNP06F0vtjzL/XTRsIrYMGNjJKziccSMiGNuebw6Qfq
         YPN2aeWgHhx1dS0ssR/lGbGyjxlCgMzO8pO0i7UU5n9rlHOxmff05H3Fj2xEev2hMMym
         UMsg==
X-Gm-Message-State: AOJu0Yy+ipG+ObCJXi+lu8E81UA89VXFIT58V9UeKIuAuINyNSUhodWD
	meSuySzkfYc3RL+kYG07KGB6tpYARcIAMcu8z4yCp+50drjhH7EycapAtRkM
X-Gm-Gg: ASbGncvUdEfmA5tmkWxpHZtSo2GBWRKXJdx2BLbInLa7wgX6nNeLqRnOyv6SDylAMcz
	Or9P3xUbIZy+sKnMKDVshDETgX/CyHVWf1rgMzsZhfUId2h43DS5cosXssLPHB9cNCytakR1mhn
	ufg1okNSc/ODH0+fXd83lHGjPr1FinBKD094Y1Ebhz90RRirGcnp/DdoW3cSUZUDW0+AxaCfiGG
	T9uDyoSYUqiY9uUw+OnET0Uy8rD1pwR/PWM6wpnyA9O3RI29TSHgY8iP68V1V6+D1jfm93yfomS
	3BO2TiqLOYP0GukUUkUgJQlodq0b
X-Google-Smtp-Source: AGHT+IHBDwcw5Xs+bILjkSfD8+rtXz+yAOQWjKW4OdKB8dlh8ebuM1gV/rgcmvZDg9zfJqcclIe0vw==
X-Received: by 2002:a05:6000:1862:b0:38d:de34:32ed with SMTP id ffacd0b85a97d-38de41be586mr1051887f8f.34.1739225405394;
        Mon, 10 Feb 2025 14:10:05 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:05 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 3/7] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Mon, 10 Feb 2025 23:09:43 +0100
Message-ID: <20250210220951.1248533-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- relocated "memory" node according to DT coding style;
- moved GIC node into "soc";
- referring "soc" by label;

 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..98c8d300347c
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv18xx.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x20000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+		clock-frequency = <25000000>;
+	};
+};
+
+&soc {
+	gic: interrupt-controller@1f01000 {
+		compatible = "arm,cortex-a15-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0x01f01000 0x1000>,
+		      <0x01f02000 0x2000>;
+	};
+
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,sg2000-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
+};
+
+&clk {
+	compatible = "sophgo,sg2000-clk";
+};
-- 
2.48.1

