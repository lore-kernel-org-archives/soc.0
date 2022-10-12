Return-Path: <SRS0=py1U=2N=icenowy.me=uwu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E91C43219
	for <soc@archiver.kernel.org>; Wed, 12 Oct 2022 05:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83BCEC433B5; Wed, 12 Oct 2022 05:57:27 +0000 (UTC)
Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61F2DC433D6;
	Wed, 12 Oct 2022 05:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61F2DC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1665554236; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fHZjzfmamhzrEnIDA9zpP0ppKM0+OaQXHewct/+lOmhAHZoZ79l7hEpaEboNs1bezjqa0dB7Axx/ImS+mXq8XXIWo9UWk2tAW0kAqxx4yOOtZplU56aKZCTGxbq21J9iQRXHXjEAmGOX69Fhx4xLzzGhFNOy1R2XXE/ITLY+kSI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665554236; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=4dCk0OX6Iak7UTI77SNseqMA7iIhg+6t2NIsg5fBNN0=; 
	b=GyLE0D7xHAgrE3JS/2oHy4cQyPjIOmEPxb3fXASraWTkq1C8BLDm6HtJE814JVjeQfLr5ttL5byUIPUo3c1UpI+HZdD++ydEcv1PKBv/7ANGj/LhIkBERcVE66xRIWGAbwjHT/ZcIciUBL1j7uEv8iZHGnSQmuiqOoU4/WJyL2I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665554236;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=4dCk0OX6Iak7UTI77SNseqMA7iIhg+6t2NIsg5fBNN0=;
	b=RHmjJBkN/G1HYnAdzGWni3NlRgmZvZVMXXMjqESaQy+Jau64ZRRilUpptM6+DCqE
	ry97za2dB7xE1mXgi60wHhwECyWM6YRfmT5m2apRwpBMjSWGfsH2kFJaWHSi77GP/dU
	+0Ta4PNDUwq2CRoA3GSJYMtmLKd2VomgdHGX/rJw=
Received: from edelgard.fodlan.icenowy.me (112.94.102.144 [112.94.102.144]) by mx.zohomail.com
	with SMTPS id 1665554235117218.30983413595652; Tue, 11 Oct 2022 22:57:15 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 07/10] ARM: suniv: f1c100s: enable USB on Lichee Pi Nano
Date: Wed, 12 Oct 2022 13:55:59 +0800
Message-Id: <20221012055602.1544944-8-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221012055602.1544944-1-uwu@icenowy.me>
References: <20221012055602.1544944-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Lichee Pi Nano has a Micro-USB connector, with its D+, D- pins connected
to the USB pins of the SoC and ID pin connected to PE2 GPIO.

Enable the USB functionality.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes since v1.

 .../arm/boot/dts/suniv-f1c100s-licheepi-nano.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
index 04e59b8381cb..1935d8c8855b 100644
--- a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
+++ b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 #include "suniv-f1c100s.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "Lichee Pi Nano";
 	compatible = "licheepi,licheepi-nano", "allwinner,suniv-f1c100s";
@@ -50,8 +52,22 @@ flash@0 {
 	};
 };
 
+&otg_sram {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pe_pins>;
 	status = "okay";
 };
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpio = <&pio 4 2 GPIO_ACTIVE_HIGH>; /* PE2 */
+	status = "okay";
+};
-- 
2.37.1

