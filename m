Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE22C433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:19:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BEBA764ED1; Wed, 10 Feb 2021 17:19:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A55364ED0;
	Wed, 10 Feb 2021 17:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977555;
	bh=VaP/gtqxTTgKJgXiF8fsfowksuSdaGGB0215tutRTlA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQteUaEp2fuhlCLYNQZPq+920j5n+JbTYuyUB1U6azDKxC29A8thXyGcuBK7X1k3v
	 eKzOQJo71jtTs5KflUPiCtTSou1XjuRGdqf4UCA+itqBUn17KDUAl0y07g/0Fc38pT
	 h+W8HYncDawA0E53rQ57Jgpjq/aoZg/7wu8EuMhSYU+YadpgGrX18snfigjhpoKcIl
	 LVjFHKRn9HKSHX4biuLaOdbQDqaJk8Hk61DRe5R6TFtaCko1IuacWLN38lRKTc9lNA
	 sSjCMIBrRwXV2l8XvA8DfehSyNvfiN0jSH6RR0v7KtLHT2wOLm9mGekO0A6xNK1o+4
	 Uq2XS4KpnKAnQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 07/11] arm64: dts: intel: socfpga_agilex: move usbphy out of soc node
Date: Wed, 10 Feb 2021 18:18:19 +0100
Message-Id: <20210210171823.333802-7-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usual usb-nop-xceiv USB phy node should be under root node, to fix
dtc warning:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:472.21-476.5:
        Warning (simple_bus_reg): /soc/usbphy@0: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 750237b9c5c1..20ae9f80febd 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -124,6 +124,11 @@ timer {
 			     <1 10 0xf08>;
 	};
 
+	usbphy0: usbphy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -469,11 +474,6 @@ uart1: serial1@ffc02100 {
 			status = "disabled";
 		};
 
-		usbphy0: usbphy@0 {
-			#phy-cells = <0>;
-			compatible = "usb-nop-xceiv";
-		};
-
 		usb0: usb@ffb00000 {
 			compatible = "snps,dwc2";
 			reg = <0xffb00000 0x40000>;
-- 
2.25.1

