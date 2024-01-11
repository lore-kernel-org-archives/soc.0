Return-Path: <SRS0=3nnK=IV=gmail.com=zajec5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482C0C4707B
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 10:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D0D2C43390; Thu, 11 Jan 2024 10:39:43 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC0BBC433F1;
	Thu, 11 Jan 2024 10:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC0BBC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2c6d6aea44so31216266b.2;
        Thu, 11 Jan 2024 02:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969580; x=1705574380; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVgpAQw5lxERHkBicfugIDRBRVx5HBt1tQZLZuFr6Ec=;
        b=IN4gm5nrLkGIwHBwScmttt6I6P8DBdWyBJl2JuPxsLmYr3crtOtlnP40hrKXMt/qGF
         hl1qmXFwS+NohJyH6qwh6ZeHoD6VHVtqirdIBb0RQJk7UocSGi4JTR0PUH3zdy5fXN2P
         kWFoSKglrt5RqBedXX8LUQlSDByUkfzApldgQkq0fJDVLi5/ck6lyMuM6E8STIyZyAML
         6ltKterDSnekf/Pv11Vjr52uLoxjuh63kh3ZyMjw3Uo5lqizXYg059yBbTEvvgY/xffi
         ZMBGzwFE2KnuzNmd28LFRf3Gq+KHE8gveL/ABwopgAsHZi2iU/Vu/oAQnapLWcBBVVdk
         LO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969580; x=1705574380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVgpAQw5lxERHkBicfugIDRBRVx5HBt1tQZLZuFr6Ec=;
        b=BxYoL31UrFOxU65FsQar9mvAlrV83ZRxtU0jCTcRpjCoF64HTAF3I8A8Alkk6ESai7
         y/yKylcgs9klDB/OVDtcZlIHOJX+qtIqwpOcOvEwKucFAQtchB/kJYnLeKi/qQLoxhy9
         P0spB9U/n6ktjMlqJXdVeXOXkZ+oBzVeqGFnhR0E/Muq3m3Tivtkr+Lg0vRpjeYtkYxE
         9oK8a06eYeGzRejLU9vN1ZfeiXH0n0qxhiYhrAOAOTZjl84M1hgnsQ5ZL+BRZ4v4veol
         1/6BkyEFqD3sLwaY6OnkDnJz98jUnMzSDOqbkg5cIsl7VrPIWgGSE/KFU3OahzTL5WBp
         INdA==
X-Gm-Message-State: AOJu0YyWjHdGhes9URqKAhZoUqcwhEvktGwkfAc+aYkW6ngtAq2rdv6o
	AQykykHpJvalVDbo4RCobmU=
X-Google-Smtp-Source: AGHT+IGCI51BT0950v+o0UYQLAUBlFB/Hr7Uxq7pBrhSwMwN7fwM/Q56+vSPKOF47X5RNjaJJco2wg==
X-Received: by 2002:a17:906:a28f:b0:a28:b170:5504 with SMTP id i15-20020a170906a28f00b00a28b1705504mr454038ejz.76.1704969579904;
        Thu, 11 Jan 2024 02:39:39 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906c20e00b00a298e2f6b3csm407179ejz.213.2024.01.11.02.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:39:39 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] arm64: dts: mediatek: Add initial MT7981B and Xiaomi AX3000T
Date: Thu, 11 Jan 2024 11:39:28 +0100
Message-Id: <20240111103928.721-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240111103928.721-1-zajec5@gmail.com>
References: <20240111103928.721-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

MT7981B (AKA MediaTek Filogic 820) is a dual-core ARM Cortex-A53 SoC.
One of market devices using this SoC is Xiaomi AX3000T.

This is initial contribution with basic SoC support. More hardware block
will get added later. Some will need their bindings (like auxadc).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
V2: Fix psci version
    Fix gic regs

 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |  15 +++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 105 ++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 0a189d5d8006..8bff11acfe1f 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
new file mode 100644
index 000000000000..a314c3e05e50
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+
+#include "mt7981b.dtsi"
+
+/ {
+	compatible = "xiaomi,ax3000t", "mediatek,mt7981b";
+	model = "Xiaomi AX3000T";
+
+	memory@40000000 {
+		reg = <0 0x40000000 0 0x10000000>;
+		device_type = "memory";
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
new file mode 100644
index 000000000000..4feff3d1c5f4
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+#include <dt-bindings/clock/mediatek,mt7981-clk.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt7981b";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	oscillator-40m {
+		compatible = "fixed-clock";
+		clock-frequency = <40000000>;
+		clock-output-names = "clkxtal";
+		#clock-cells = <0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
+			      <0 0x0c080000 0 0x200000>; /* GICR */
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		infracfg: clock-controller@10001000 {
+			compatible = "mediatek,mt7981-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		clock-controller@1001b000 {
+			compatible = "mediatek,mt7981-topckgen", "syscon";
+			reg = <0 0x1001b000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		clock-controller@1001e000 {
+			compatible = "mediatek,mt7981-apmixedsys";
+			reg = <0 0x1001e000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pwm@10048000 {
+			compatible = "mediatek,mt7981-pwm";
+			reg = <0 0x10048000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_PWM_STA>,
+				<&infracfg CLK_INFRA_PWM_HCK>,
+				<&infracfg CLK_INFRA_PWM1_CK>,
+				<&infracfg CLK_INFRA_PWM2_CK>,
+				<&infracfg CLK_INFRA_PWM3_CK>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
+			#pwm-cells = <2>;
+		};
+
+		clock-controller@15000000 {
+			compatible = "mediatek,mt7981-ethsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.35.3

