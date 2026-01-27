Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD0125CC6C
	for <soc@lists.linux.dev>; Tue, 27 Jan 2026 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498204; cv=none; b=GD+h2Yg/JJw0pKqi2eZPnU4bjZ9bCkUc5wI+oAlFRa/KlR2t6+aXuPZc701Z8biGN7EZUwp8AIB13TNhwTFVtJIK0sTv7bbGC2sOa3IKtC0jhk7tVaJQZHXei7KdMj4A/2Nq7cRHa3yH6JabgnaozwqmyIAZgaQCS0T670V+m+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498204; c=relaxed/simple;
	bh=Ykh8Fz1RLY13TtRNiB3eZQ4ZMvuS8WqUsQvmaOzraxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBqFcClsFSYRyh555IaGK/V0z3Xzw0i2JxFb/HQSxtWysMVkGvHqJY3PHBubotky7nwN1IdBWl9aq2AOzByCYC/QzdTrZzxg85PSG3v9Cz9rVMJqTb8mUIvVqnzmSsOV+mOVAHkwfTZx15tu0uJA7gaK+JYePG7P9c37rrT2zlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YS1Vr+Xx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YS1Vr+Xx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d52768ccso35703915ad.1
        for <soc@lists.linux.dev>; Mon, 26 Jan 2026 23:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498202; x=1770103002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45xwQOhGlZ0HbC/6cyem1kHRR0wwC12dnMsFcB83jkA=;
        b=YS1Vr+XxPX2gHCudOx6bfw5clnI142Np42Akv6DoaNh0PLv6ukqASkha+M+uwGeBiF
         km9Sz7n7MEn9pFLERX3zrcPl6YjCbamxIqOirAh5UYR8/Ghw/mLb2NBnD6osCmFNGJxh
         24j/rp90yXzALLj3MVwhIxIFp/0fyI0Pbldwahn+/20Ent33ru2QDuEN3WxRRS2nhYPK
         ty7E/2bYO/8x0a5I66Zf7h74Wz8ZB64y2YfShrF00WIPT1rYhQpTcYVt1i0z78xqXM7j
         xMi67XUb1eYqJ+yeTnt2LxQomC5rp0htzaROBFXKqt0rYMGw0fzuMm/EN9qCq5WFvqjp
         +GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498202; x=1770103002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45xwQOhGlZ0HbC/6cyem1kHRR0wwC12dnMsFcB83jkA=;
        b=R5ehcuaQv6qbf8BMAOjgS/J039C7R8GpTco0sxI34Ym3ShFJ1tdLczw+zDf0XtSRlp
         fhRiPaVsrx68B0il/sD2uSSBVOr4kA25Czd1EwKIT2a+EWAjtBqz8HfgErW3yZ6wS/Mm
         0VpfB4/WCY2bFBNbnLbVk3w8D/TqgazZ6X7P/GadJRdc0gTYhYqr/E2H5twLr3q0n2Zn
         Vx11CjPfrnsEJHEc5IEgCkUEBw8fiWaTye8vV2O/mExRmPrn2Uh0o9u/rLJDuk4c6qoR
         imH0Cgtm/tQAHNrxXDwavwzctGbh+Dq0LTTWFHyBiwVx2ryejj4pXP0hTDzE784Q9+A9
         yViA==
X-Forwarded-Encrypted: i=1; AJvYcCU1v1jWwAxYoKUbaI0mZj3hUkxJmSO1pqnAChoW3v4Q5lIfCdyJUl18yAJVMS/5DjKJIhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIeJih8cpxT2P9/TCG89s9LGrVZ19Hg/BuvaaozfLXmhdSDioj
	7jM66TC3dnu3L/XsF08JgG3VJeY7fcGskvgBz/2/rHwR21u3yDXL5gTr
X-Gm-Gg: AZuq6aKIvQ8V+R4RSbzhj60f1qiAtY+wTgeL3Ofm0zo9Nw/ub+kyG/b3ITHXB8gDL0X
	8WDiAj8otb7EL2eU4AyGpZEiKam8hrX6HmldZlZQoVrHhAWX919AduSEONPEyu9BWmvd04cKSnQ
	r++iHeohKystXLZctSfLXKVMWhJrNRLK/1buPDWXTuv6yAJgTxWSgaiRyDOEdspdPsSTK+pp8C2
	e/hyV+Tn2Jba3Ivo/kWdKfyNew8O90uOkFDlPtcGnLAF9n6VL8lVCbhYcM7zq/TWOVPSR2tySH9
	6hoCfEzf7qTvuCxv+2S1o7pOZknYYj2qQg8aFENxjluB5oXBc1jBfETHmVZ+mm+Q6mPXwUw3IyM
	kjPc18OJ5AbFYUoG+Y42hqo4LGOiC16gkmqKW+Yz3E4emzUdZ4hv1y1r7Jfdd9n1OhLW1viQnXk
	5pC81vJ1m0hhFf26XN5u0OVpCGrIaMS9aQeM9TY3CvYaxDDWCBzHBZpxvy+jI=
X-Received: by 2002:a17:902:da4b:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2a870e252c5mr8717665ad.50.1769498201860;
        Mon, 26 Jan 2026 23:16:41 -0800 (PST)
Received: from cn1dhc-k02 (125-227-180-151.hinet-ip.hinet.net. [125.227.180.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb063esm106160505ad.85.2026.01.26.23.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:16:41 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	james.tai@realtek.com,
	soc@lists.linux.dev
Cc: afaerber@suse.de,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cy.huang@realtek.com,
	stanley_chang@realtek.com,
	eleanor.lin@realtek.com
Subject: [PATCH RESEND v3 2/2] arm64: dts: realtek: Add Kent SoC and EVB device trees
Date: Tue, 27 Jan 2026 15:14:01 +0800
Message-ID: <20260127071530.25426-3-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260127071530.25426-1-eleanor15x@gmail.com>
References: <20260127071530.25426-1-eleanor15x@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu-Chun Lin <eleanor.lin@realtek.com>

Add Device Tree hierarchy for Realtek Kent SoC family:

- kent.dtsi: base SoC layer
- rtd<variant>.dtsi: SoC variant layer
- rtd<variant>-<board>.dtsi: board layer
- rtd<variant>-<board>-<config>.dts: board configuration layer

Include RTD1501s Phantom EVB (8GB), RTD1861B Krypton EVB (8GB), and
RTD1920s Smallville EVB (4GB).

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 arch/arm64/boot/dts/realtek/Makefile          |   7 +-
 arch/arm64/boot/dts/realtek/kent.dtsi         | 166 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1501s-phantom-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1501s-phantom.dtsi    | 118 +++++++++++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1861b-krypton-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1861b-krypton.dtsi    |  72 ++++++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi      |  12 ++
 .../dts/realtek/rtd1920s-smallville-4gb.dts   |  23 +++
 .../boot/dts/realtek/rtd1920s-smallville.dtsi | 128 ++++++++++++++
 11 files changed, 596 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi

diff --git a/arch/arm64/boot/dts/realtek/Makefile b/arch/arm64/boot/dts/realtek/Makefile
index ef8d8fcbaa05..60a37d5a948c 100644
--- a/arch/arm64/boot/dts/realtek/Makefile
+++ b/arch/arm64/boot/dts/realtek/Makefile
@@ -1,15 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1293-ds418j.dtb
-
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-mele-v9.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-probox2-ava.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-xnano-x5.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-zidoo-x9s.dtb
-
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1296-ds418.dtb
-
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1395-bpi-m4.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1395-lionskin.dtb
-
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1501s-phantom-8gb.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1619-mjolnir.dtb
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1861b-krypton-8gb.dtb
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1920s-smallville-4gb.dtb
diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
new file mode 100644
index 000000000000..e659bb252759
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek Kent SoC family
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI  9 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+			dynamic-power-coefficient = <454>;
+			#cooling-cells = <2>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_1>;
+			dynamic-power-coefficient = <454>;
+			#cooling-cells = <2>;
+
+			l2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x200>;
+			enable-method = "psci";
+			next-level-cache = <&l2_2>;
+			dynamic-power-coefficient = <454>;
+			#cooling-cells = <2>;
+
+			l2_2: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x300>;
+			enable-method = "psci";
+			next-level-cache = <&l2_3>;
+			dynamic-power-coefficient = <454>;
+			#cooling-cells = <2>;
+
+			l2_3: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <256>;
+				cache-size = <0x40000>;
+				cache-unified;
+				next-level-cache = <&l3>;
+			};
+		};
+
+		l3: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-size = <0x200000>;
+			cache-unified;
+		};
+	};
+
+	psci: psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x40000>, /* boot code */
+			 <0x98000000 0x0 0x98000000 0xef0000>, /* rbus */
+			 <0xa0000000 0x0 0xa0000000 0x10000000>, /* PCIE */
+			 <0xff000000 0x0 0xff000000 0x200000>; /* GIC */
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		rbus: bus@98000000 {
+			compatible = "simple-bus";
+			ranges = <0x0 0x98000000 0xef0000>,
+				 <0xa0000000 0xa0000000 0x10000000>; /* PCIE */
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			uart0: serial@7800 {
+				compatible = "snps,dw-apb-uart";
+				reg = <0x7800 0x100>;
+				clock-frequency = <432000000>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+				reg-io-width = <4>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+		};
+
+		gic: interrupt-controller@ff100000 {
+			compatible = "arm,gic-v3";
+			reg = <0xff100000 0x10000>,
+			      <0xff140000 0x80000>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#interrupt-cells = <3>;
+			#size-cells = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1501.dtsi b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
new file mode 100644
index 000000000000..65f7ede3df73
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1501 SoC
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+#include "kent.dtsi"
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
new file mode 100644
index 000000000000..09e544acfd34
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1501S Phantom EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd1501s-phantom.dtsi"
+
+/ {
+	compatible = "realtek,phantom", "realtek,rtd1501s";
+	model = "Realtek Phantom EVB Chromium (8GB)";
+
+	memory@40000 {
+		device_type = "memory";
+		reg = <0x0 0x50000 0x0 0x7ffb0000>,
+		      <0x0 0x8a100000 0x0 0xdef0000>,
+		      <0x0 0x98700000 0x0 0x7900000>,
+		      <0x0 0xa0600000 0x0 0x5ea00000>,
+		      <0x1 0x0 0x0 0xa0000000>,
+		      <0x1 0xa0600000 0x0 0x5fa00000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi b/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
new file mode 100644
index 000000000000..bcfb96799671
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1501S Phantom EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/thermal/thermal.h>
+#include "rtd1501.dtsi"
+
+/ {
+	chosen {
+		stdout-path = "serial0:460800n8";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alignment = <0x0 0x400000>;
+			alloc-ranges = <0x0 0x0 0x0 0x20000000>;
+			size = <0x0 0x2000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	cpu_opps: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp800: opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <830000 830000 1100000>;
+		};
+
+		opp900: opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <850000 850000 1100000>;
+		};
+
+		opp1000: opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <870000 870000 1100000>;
+		};
+
+		opp1100: opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <890000 890000 1100000>;
+		};
+
+		opp1200: opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <910000 910000 1100000>;
+		};
+
+		opp1300: opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <930000 930000 1100000>;
+		};
+
+		opp1400: opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <950000 950000 1100000>;
+		};
+
+		opp1500: opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <970000 970000 1100000>;
+		};
+
+		opp1600: opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <990000 990000 1100000>;
+			opp-suspend;
+		};
+
+		opp1700: opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <1010000 1010000 1100000>;
+		};
+
+		opp1800: opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1030000 1030000 1100000>;
+		};
+
+		opp1900: opp-1900000000 {
+			opp-hz = /bits/ 64 <1900000000>;
+			opp-microvolt = <1050000 1050000 1100000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1861.dtsi b/arch/arm64/boot/dts/realtek/rtd1861.dtsi
new file mode 100644
index 000000000000..44c3de8f1f48
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1861.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1861 SoC
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+#include "kent.dtsi"
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
new file mode 100644
index 000000000000..9c23d901c49c
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1861B Krypton EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd1861b-krypton.dtsi"
+
+/ {
+	compatible = "realtek,krypton", "realtek,rtd1861b";
+	model = "Realtek Krypton EVB (8GB)";
+
+	memory@40000 {
+		device_type = "memory";
+		reg = <0x0 0x50000 0x0 0x7ffb0000>,
+		      <0x0 0x8a100000 0x0 0xdef0000>,
+		      <0x0 0x98700000 0x0 0x7900000>,
+		      <0x0 0xa0600000 0x0 0x5ea00000>,
+		      <0x1 0x0 0x0 0xa0000000>,
+		      <0x1 0xa0600000 0x0 0x5fa00000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi b/arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
new file mode 100644
index 000000000000..b500f4d2c502
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1861B Krypton EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd1861.dtsi"
+
+/ {
+	chosen {
+		stdout-path = "serial0:460800n8";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alignment = <0x0 0x400000>;
+			alloc-ranges = <0x0 0x0 0x0 0x20000000>;
+			size = <0x0 0x2000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	cpu_opps: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp1200: opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <900000>;
+		};
+
+		opp1600: opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <1000000>;
+			opp-suspend;
+		};
+
+		opp1800: opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1050000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1920.dtsi b/arch/arm64/boot/dts/realtek/rtd1920.dtsi
new file mode 100644
index 000000000000..becf546216e9
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1920.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1920 SoC
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+#include "kent.dtsi"
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts b/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
new file mode 100644
index 000000000000..9fd6976e0d9b
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1920S Smallville EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd1920s-smallville.dtsi"
+
+/ {
+	compatible = "realtek,smallville", "realtek,rtd1920s";
+	model = "Realtek Smallville EVB (4GB)";
+
+	memory@40000 {
+		device_type = "memory";
+		reg = <0x0 0x50000 0x0 0x7ffb0000>,
+		      <0x0 0x8a100000 0x0 0xdef0000>,
+		      <0x0 0x98700000 0x0 0x7900000>,
+		      <0x0 0xa1000000 0x0 0x5e000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi b/arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi
new file mode 100644
index 000000000000..3db8fcea6447
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realtek RTD1920S Smallville EVB
+ *
+ * Copyright (c) 2024 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/thermal/thermal.h>
+#include "rtd1920.dtsi"
+
+/ {
+	chosen {
+		stdout-path = "serial0:460800n8";
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		protected_mem: protected-mem@50000 {
+			reg = <0x0 0x50000 0x0 0xbf0000>;
+			no-map;
+		};
+
+		metadata: metadata@c40000 {
+			reg = <0x0 0xc40000 0x0 0x3c4000>;
+			no-map;
+		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alignment = <0x0 0x400000>;
+			alloc-ranges = <0x0 0x0 0x0 0x20000000>;
+			size = <0x0 0x2000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	cpu_opps: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp800: opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <830000 830000 1100000>;
+		};
+
+		opp900: opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <850000 850000 1100000>;
+		};
+
+		opp1000: opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <870000 870000 1100000>;
+		};
+
+		opp1100: opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			opp-microvolt = <890000 890000 1100000>;
+		};
+
+		opp1200: opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <910000 910000 1100000>;
+		};
+
+		opp1300: opp-1300000000 {
+			opp-hz = /bits/ 64 <1300000000>;
+			opp-microvolt = <930000 930000 1100000>;
+		};
+
+		opp1400: opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <950000 950000 1100000>;
+		};
+
+		opp1500: opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <970000 970000 1100000>;
+		};
+
+		opp1600: opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <990000 990000 1100000>;
+			opp-suspend;
+		};
+
+		opp1700: opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <1010000 1010000 1100000>;
+		};
+
+		opp1800: opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1030000 1030000 1100000>;
+		};
+
+		opp1900: opp-1900000000 {
+			opp-hz = /bits/ 64 <1900000000>;
+			opp-microvolt = <1050000 1050000 1100000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu_opps>;
+	#cooling-cells = <2>;
+};
-- 
2.34.1

