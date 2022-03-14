Return-Path: <SRS0=kJ9B=TZ=nbd.name=nbd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35893C35278
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 08:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 209CCC340EC; Mon, 14 Mar 2022 08:44:33 +0000 (UTC)
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C08BC34101;
	Mon, 14 Mar 2022 08:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C08BC34101
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=nbd.name
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UPZIGRUhEgeZEuYwXHCw/OeVuq+IZh/TeJF0FMiXACE=; b=BV/vKH253XxeLkp6IbqfcpZ1rl
	40Y+NeW2y/S4VNuyNVdBVdeWBqWWEU3aNH9RNLxoAQSEhilcJFIMm93Yf3s/AlJvTSBaHIyEw/4M+
	VPsvmgRTWsSTXWDlTjXkUiFATMRhQKsvoqJ8JRIZl1WkcL7dssNb0G5EH7ZOuxMFtp/0=;
Received: from p200300daa7204f006c015a90d6b6c4d6.dip0.t-ipconnect.de ([2003:da:a720:4f00:6c01:5a90:d6b6:c4d6] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1nTgJS-0002UN-Of; Mon, 14 Mar 2022 09:44:22 +0100
From: Felix Fietkau <nbd@nbd.name>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 6/6] ARM: dts: Add PCIe support for Airoha EN7523
Date: Mon, 14 Mar 2022 09:44:08 +0100
Message-Id: <20220314084409.84394-7-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314084409.84394-1-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This uses the MediaTek MT7622 PCIe driver, since the PCIe IP block is nearly
identical to the one in MT7622

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm/boot/dts/en7523-evb.dts |  8 +++++
 arch/arm/boot/dts/en7523.dtsi    | 58 ++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
index a8d8bb0419a0..f23a25cce119 100644
--- a/arch/arm/boot/dts/en7523-evb.dts
+++ b/arch/arm/boot/dts/en7523-evb.dts
@@ -33,3 +33,11 @@ &gpio0 {
 &gpio1 {
 	status = "okay";
 };
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
index 2e705b87b6c1..7f839331a777 100644
--- a/arch/arm/boot/dts/en7523.dtsi
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -143,4 +143,62 @@ gpio1: gpio@1fbf0270 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	pcie0: pcie@1fa91000 {
+		compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";
+		device_type = "pci";
+		reg = <0x1fa91000 0x1000>;
+		reg-names = "port0";
+		linux,pci-domain = <0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "pcie_irq";
+		clocks = <&scu EN7523_CLK_PCIE>;
+		clock-names = "sys_ck0";
+		bus-range = <0x00 0xff>;
+		ranges = <0x82000000 0 0x20000000  0x20000000  0 0x8000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+				<0 0 0 2 &pcie_intc0 1>,
+				<0 0 0 3 &pcie_intc0 2>,
+				<0 0 0 4 &pcie_intc0 3>;
+		pcie_intc0: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+	};
+
+	pcie1: pcie@1fa92000 {
+		compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";
+		device_type = "pci";
+		reg = <0x1fa92000 0x1000>;
+		reg-names = "port1";
+		linux,pci-domain = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "pcie_irq";
+		clocks = <&scu EN7523_CLK_PCIE>;
+		clock-names = "sys_ck1";
+		bus-range = <0x00 0xff>;
+		ranges = <0x82000000 0 0x28000000  0x28000000  0 0x8000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+				<0 0 0 2 &pcie_intc1 1>,
+				<0 0 0 3 &pcie_intc1 2>,
+				<0 0 0 4 &pcie_intc1 3>;
+		pcie_intc1: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+	};
 };
-- 
2.35.1

