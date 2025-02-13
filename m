Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2701F245022
	for <soc@lists.linux.dev>; Thu, 13 Feb 2025 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470942; cv=none; b=j6ACCC5kx4L4/DymY9kX/5pa/uDN7ACMWu4bjnVmfSUjhNU9Z6tF32XKyAUwfJ1dt2HQ31EwuaxYUY4JS58ZzMaoHos+bNP68IdueU0Zr5M7rtwPZKTApyvYLzF3knpISqO5eXuEeN7S1lP4um6KkJNv9G2LKenp18pOzITeWQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470942; c=relaxed/simple;
	bh=ZbogGnUyLo0ojfyQJ8VfJpq6IKIV960LhBdBwM98lOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sm6H2mZAk4ClO1l/j8rzojsChJJqNkc+wzds7jz85iyeShGlF+KTZ48mWHq0+9DlTNLRfqymxWoKRC+71RRqn5+DNT9LnVNObQE9t0+/LOa1+9pguRzfuZ8nWfIcAHEhw7yOIF7dArmPJzRBIwifpzX1Ubf9wn5YucpShgALd2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqCBajV+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqCBajV+"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so2201559a12.0
        for <soc@lists.linux.dev>; Thu, 13 Feb 2025 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470938; x=1740075738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rniZbZT42cTz1JQWgzCA6pN/tKGxiseo1y9AAMtwRAw=;
        b=dqCBajV+aIysjOgWUJJXjNyr8R9Mym9HrJL5/kMn/jT5AHrtxP3CAaBR55dbzsL+3f
         e6+VZtJ0JKrsEBN5yvr1J8GNxQdJ5fnynJRh5LyLeaIF4Uo+7x4OLTYuOjSMT83qjcM/
         ccdAFSFDOQObhTj49etRgaW/qpJ614awsgoo90GnppRsTvT+dBCCcDS4qHKuvQmJG13+
         fRqtAR5Iux6ZWP74E4GXgrh1YUmn3VHBwd+XIL1iS6ximJhEtjFoTfCyENZlZ3l5858c
         y+xrWufHDFpdfliv+3qEjJZYaLcgSdM86ii5xKDs07iCN8+cCdECX8lhkRzXTRT2KhP+
         dBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470938; x=1740075738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rniZbZT42cTz1JQWgzCA6pN/tKGxiseo1y9AAMtwRAw=;
        b=GBEgSMA4T59rVIfrZ2+ciN1hWKuRewnc24G0l0TVOqT99NhD1cyp0JPB1RLO6HPQ9k
         kQOzFtA0Yyo3bdhX8WTFbUa7Ul9PT8iVeWpTDsNsGiP63jVTY/7+KR8Knmnbe0HPVNqo
         PIsIY0pe37VankYo5gdKyUUp3dKaWmmqbloRn7XOPjceyGhrsDBuTQA0fIwsO3wlwKIj
         Be4K8ICfbO4bnpHJNByHqOne79TGaOokFBmptDHWeKr0snRjQHAmyGxBUUXyDVKfKhkD
         oTCMKpDF/1bkJSEEYGUVxi9gztSG0Oht046E+JPm/836MPTF4UqX8HnAA3JyVpPTmUUn
         6eIw==
X-Gm-Message-State: AOJu0Yx5Q/uhUN2e+J0Hxd3YI/j3QHcXGfaEglblu7VPVZpXwoFmb23h
	9UpiWj9tGAfRT2o3eXYyRShggtGppGpGtEIsF2vROxBSBHbqD6RqqzHzpS/Z
X-Gm-Gg: ASbGnctfCEX1BEa9odV3dnbSi7gy/DMz34LpgJvlfUGH4iodt6tQdppq5rQ71N9iMcC
	DiIFOf7aQs/1YzWhnXRrS4nJj9m836JY0nXeJqgU/n7u485P6GxSfxNiu2OVGy63U3YhBzfnReV
	IrT9K0ZiBwFlyY17uvA4Z7ykgkr52KGFyYfFGFSTaBNRvOlZoH3jJy1YxAwshPooTkF3susLZd2
	8XQsW7zbQbXFLliH55UOyokaXxvR/GtPpzPqdsPk+bMOMGOcU/RrndzOyGqzcmlcCEv3941qe7k
	WVIhd6s5Jmq15f3QfzsY0AbT6kLb
X-Google-Smtp-Source: AGHT+IG14L6TdSqETaLgX75QTQs9yCsm1539oykljYLZ36UNUJDCWIIy/ccFKlFu4aXniv6qdFMP7A==
X-Received: by 2002:a05:6402:1f13:b0:5dc:db58:a1c6 with SMTP id 4fb4d7f45d1cf-5decba3555dmr3843296a12.1.1739470938037;
        Thu, 13 Feb 2025 10:22:18 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:17 -0800 (PST)
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
Subject: [PATCH v4 3/7] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Thu, 13 Feb 2025 19:22:04 +0100
Message-ID: <20250213182210.2098718-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
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
v4:
v3:
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

