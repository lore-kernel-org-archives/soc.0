Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FFCC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 23:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE2460C40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 23:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CE2460C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2tR2KON9gXL3IAosd2OneCdxX/mPpU1mv7paXJBcvHw=; b=3C+I5TDta/y59L
	RtBveWMlOaCJ9BEhkGxicL6JZh6VNbWGvScpP4geaegt6IVAlOyvR7NxaN8BXkMG41/G+NLdsSy/7
	DMrVhvnS/0q+BaFj0K6c1sMEQR52UjzD7WpbJpR3iK5DiqLWiZlHl3H9m4XvvrLvIVPvairWPiJob
	lXSdCE7WwSBC4U4Qe5TTAT/njiIFXHMewdov1oZF25BLLDeZl/jJQ/1oMJTl1Gaw/TFDIqMaRDKfK
	Fh+pPUCs08hpn7pewlMV/o9LwK9hKlUg2wNDE0SSgMYcm+BbraYefrnE1ueoETro5WHKLiI8mqdR2
	DAhYYuvQgTPs4hhMCP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1memoj-00ElX8-Lf; Sun, 24 Oct 2021 23:22:17 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1memoe-00ElVz-He
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 23:22:15 +0000
Received: by mail-lj1-x236.google.com with SMTP id o26so9894073ljj.2
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 16:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kwhGcO2aWDLIgUXC3aaYGBdEKorrZOF3VTL/NPT8U1Q=;
 b=ekucUWNS7FHunkZwHXztrIR/5paX9WI1OpgPJpysvZ94f4mvZ69/C/KpTwFsz/haZA
 VGIKA5AybUyzSVzwEkbEXrco4OqqlKpZhF4o0cupjr0DQ0ujuqCn2KLYVz2RIkLg7HIA
 3EPOtRa8K+iraGk34wBNi+5niBLa/H8GBvBJCupDXFOoQXeCwN2tzxt230r0UBxwZET7
 sm/bX4v3t631YjBys8Z5aS34teYStzfFwyELziRcm3RYPGK1N0CNd10Exp90e/7k1hiX
 F/H9cdzmrMQAd5fKPDKIaggG+1MOquahvFovXrXY38pAsauCmsxZwycNNHItG2CFJN1r
 mc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kwhGcO2aWDLIgUXC3aaYGBdEKorrZOF3VTL/NPT8U1Q=;
 b=REnQV9bT8p+OC3+mYcj1rZyvoK8bdFot4Zt+ZHNmdB+p0MKjJg4skqNPay0Ekn52mP
 ww8m74SVBh/ctx/+rUAUgTSKwbbYym5wG6YU2+gsQs3RBlXKB0UpC4RXsIvzP/NbGXoE
 NANF4SMwsBnA993hubTqLXv1yiPBFaGsXGCQmxP0vueXBkhb92SrLrWZQSFteicx+9Vq
 knxwefXcJ82qqp3fOZff1VEjeKuPdglC6iwE6lttRUxFwICugPLFFXTuHXyRo/5vzRCy
 +X10XMmCulLX65PkafmIZ+rTKHaTzoVZKW1gJrHTj0CUrb7AYzqoviD7f0mt8D2VuMaK
 rSLg==
X-Gm-Message-State: AOAM533AJM5og3aG++1s6XHSB/xWbdmZb5HtO96RCyshAKOpjscljW8W
 W5ciUflFl1n9oJDioOVBYZ4Jbg==
X-Google-Smtp-Source: ABdhPJxHI+L45003Moz+tCODpMSeebuUdN97LXXutpQVzEHfabnshyMsuZR90bjTvTdU5jaZsmkRBA==
X-Received: by 2002:a2e:8155:: with SMTP id t21mr15195975ljg.433.1635117730801; 
 Sun, 24 Oct 2021 16:22:10 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id s11sm1493222ljp.60.2021.10.24.16.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 16:22:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH] ARM: dts: arm: Update register-bit-led nodes 'reg' and node
 names
Date: Mon, 25 Oct 2021 01:20:03 +0200
Message-ID: <20211024232003.211484-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_162212_631315_DAE4C54E 
X-CRM114-Status: GOOD (  13.70  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211024232003.G9QD2t_xf6Vq0k5yLddtJkGMRWFC404l_8s9FzzPV6Y@z>

From: Rob Herring <robh@kernel.org>

Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
The 'reg' entry is the LED control register address. With this, the node
name can be updated to use a generic node name, 'led', and a
unit-address.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for v5.16.
---
 arch/arm/boot/dts/arm-realview-eb.dtsi        | 27 +++++++++++++------
 arch/arm/boot/dts/arm-realview-pb1176.dts     | 27 +++++++++++++------
 arch/arm/boot/dts/arm-realview-pb11mp.dts     | 27 +++++++++++++------
 arch/arm/boot/dts/arm-realview-pbx.dtsi       | 27 +++++++++++++------
 arch/arm/boot/dts/integrator.dtsi             | 23 +++++++++++-----
 arch/arm/boot/dts/mps2.dtsi                   | 10 +++++--
 arch/arm/boot/dts/versatile-ab-ib2.dts        |  6 ++++-
 arch/arm/boot/dts/versatile-ab.dts            | 27 +++++++++++++------
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 27 +++++++++++++------
 9 files changed, 144 insertions(+), 57 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index 04e8a27ba1eb..56441ef08a55 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -198,61 +198,72 @@ fpga {
 		syscon: syscon@10000000 {
 			compatible = "arm,realview-eb-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
+			ranges = <0x0 0x10000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@08.0 {
+			led@8,0 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x01>;
 				label = "versatile:0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8,1 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8,2 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8,3 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8,4 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8,5 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8,6 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8,7 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index 366687fb1ee3..df71ee27294d 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -216,61 +216,72 @@ soc {
 		syscon: syscon@10000000 {
 			compatible = "arm,realview-pb1176-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
+			ranges = <0x0 0x10000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@08.0 {
+			led@8,0 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x01>;
 				label = "versatile:0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8,1 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8,2 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8,3 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8,4 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8,5 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8,6 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8,7 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 228a51a38f95..54d4cbd10bdf 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -303,64 +303,75 @@ soc {
 		pb11mp_syscon: syscon@10000000 {
 			compatible = "arm,realview-pb11mp-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
+			ranges = <0x0 0x10000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@08.0 {
+			led@8,0 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x01>;
 				label = "versatile:0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8,1 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8,2 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8,3 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				linux,default-trigger = "cpu1";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8,4 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				linux,default-trigger = "cpu2";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8,5 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				linux,default-trigger = "cpu3";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8,6 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8,7 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index ccf6f756b6ed..9366fecc699b 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -220,61 +220,72 @@ soc: soc {
 		syscon: syscon@10000000 {
 			compatible = "arm,realview-pbx-syscon", "syscon", "simple-mfd";
 			reg = <0x10000000 0x1000>;
+			ranges = <0x0 0x10000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@08.0 {
+			led@8,0 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x01>;
 				label = "versatile:0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@08.1 {
+			led@8,1 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
 				default-state = "off";
 			};
-			led@08.2 {
+			led@8,2 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
 				default-state = "off";
 			};
-			led@08.3 {
+			led@8,3 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
 				default-state = "off";
 			};
-			led@08.4 {
+			led@8,4 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
 				default-state = "off";
 			};
-			led@08.5 {
+			led@8,5 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
 				default-state = "off";
 			};
-			led@08.6 {
+			led@8,6 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
 				default-state = "off";
 			};
-			led@08.7 {
+			led@8,7 {
 				compatible = "register-bit-led";
+				reg = <0x08 0x04>;
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
diff --git a/arch/arm/boot/dts/integrator.dtsi b/arch/arm/boot/dts/integrator.dtsi
index 602f74d2c758..ad868cfebc94 100644
--- a/arch/arm/boot/dts/integrator.dtsi
+++ b/arch/arm/boot/dts/integrator.dtsi
@@ -15,10 +15,14 @@ memory {
 	core-module@10000000 {
 		compatible = "arm,core-module-integrator", "syscon", "simple-mfd";
 		reg = <0x10000000 0x200>;
+		ranges = <0x0 0x10000000 0x200>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
 		/* Use core module LED to indicate CPU load */
-		led@c.0 {
+		led@c,0 {
 			compatible = "register-bit-led";
+			reg = <0x0c 0x04>;
 			offset = <0x0c>;
 			mask = <0x01>;
 			label = "integrator:core_module";
@@ -104,35 +108,42 @@ kmi@19000000 {
 			interrupts = <4>;
 		};
 
-		syscon {
+		syscon@1a000000 {
 			/* Debug registers mapped as syscon */
 			compatible = "syscon", "simple-mfd";
 			reg = <0x1a000000 0x10>;
+			ranges = <0x0 0x1a000000 0x10>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-			led@4.0 {
+			led@4,0 {
 				compatible = "register-bit-led";
+				reg = <0x04 0x04>;
 				offset = <0x04>;
 				mask = <0x01>;
 				label = "integrator:green0";
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@4.1 {
+			led@4,1 {
 				compatible = "register-bit-led";
+				reg = <0x04 0x04>;
 				offset = <0x04>;
 				mask = <0x02>;
 				label = "integrator:yellow";
 				default-state = "off";
 			};
-			led@4.2 {
+			led@4,2 {
 				compatible = "register-bit-led";
+				reg = <0x04 0x04>;
 				offset = <0x04>;
 				mask = <0x04>;
 				label = "integrator:red";
 				default-state = "off";
 			};
-			led@4.3 {
+			led@4,3 {
 				compatible = "register-bit-led";
+				reg = <0x04 0x04>;
 				offset = <0x04>;
 				mask = <0x08>;
 				label = "integrator:green1";
diff --git a/arch/arm/boot/dts/mps2.dtsi b/arch/arm/boot/dts/mps2.dtsi
index 37f5023f529c..b99577d411b1 100644
--- a/arch/arm/boot/dts/mps2.dtsi
+++ b/arch/arm/boot/dts/mps2.dtsi
@@ -216,8 +216,13 @@ fpgaio@8000 {
 			compatible = "syscon", "simple-mfd";
 			reg = <0x8000 0x10>;
 
-			led0 {
+			ranges = <0x0 0x8000 0x10>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			led@0,0 {
 				compatible = "register-bit-led";
+				reg = <0x00 0x04>;
 				offset = <0x0>;
 				mask = <0x01>;
 				label = "userled:0";
@@ -225,8 +230,9 @@ led0 {
 				default-state = "on";
 			};
 
-			led1 {
+			led@0,1 {
 				compatible = "register-bit-led";
+				reg = <0x00 0x04>;
 				offset = <0x0>;
 				mask = <0x02>;
 				label = "userled:1";
diff --git a/arch/arm/boot/dts/versatile-ab-ib2.dts b/arch/arm/boot/dts/versatile-ab-ib2.dts
index c577ff4bb4be..7ebb0dfd0467 100644
--- a/arch/arm/boot/dts/versatile-ab-ib2.dts
+++ b/arch/arm/boot/dts/versatile-ab-ib2.dts
@@ -13,9 +13,13 @@ / {
 	syscon@27000000 {
 		compatible = "arm,versatile-ib2-syscon", "syscon", "simple-mfd";
 		reg = <0x27000000 0x4>;
+		ranges = <0x0 0x27000000 0x4>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-		led@00.4 {
+		led@0,4 {
 			compatible = "register-bit-led";
+			reg = <0x00 0x04>;
 			offset = <0x00>;
 			mask = <0x10>;
 			label = "versatile-ib2:0";
diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index 151c0220047d..79f7cc241282 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -70,61 +70,72 @@ vga_con_in: endpoint {
 	core-module@10000000 {
 		compatible = "arm,core-module-versatile", "syscon", "simple-mfd";
 		reg = <0x10000000 0x200>;
+		ranges = <0x0 0x10000000 0x200>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-		led@08.0 {
+		led@8,0 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x01>;
 			label = "versatile:0";
 			linux,default-trigger = "heartbeat";
 			default-state = "on";
 		};
-		led@08.1 {
+		led@8,1 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x02>;
 			label = "versatile:1";
 			linux,default-trigger = "mmc0";
 			default-state = "off";
 		};
-		led@08.2 {
+		led@8,2 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x04>;
 			label = "versatile:2";
 			linux,default-trigger = "cpu0";
 			default-state = "off";
 		};
-		led@08.3 {
+		led@8,3 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x08>;
 			label = "versatile:3";
 			default-state = "off";
 		};
-		led@08.4 {
+		led@8,4 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x10>;
 			label = "versatile:4";
 			default-state = "off";
 		};
-		led@08.5 {
+		led@8,5 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x20>;
 			label = "versatile:5";
 			default-state = "off";
 		};
-		led@08.6 {
+		led@8,6 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x40>;
 			label = "versatile:6";
 			default-state = "off";
 		};
-		led@08.7 {
+		led@8,7 {
 			compatible = "register-bit-led";
+			reg = <0x08 0x04>;
 			offset = <0x08>;
 			mask = <0x80>;
 			label = "versatile:7";
diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index 40d95c58b55e..f7afb8faf5de 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -153,64 +153,75 @@ v2m_sysctl: sysctl@20000 {
 				apbregs@10000 {
 					compatible = "syscon", "simple-mfd";
 					reg = <0x010000 0x1000>;
+					ranges = <0x0 0x10000 0x1000>;
+					#address-cells = <1>;
+					#size-cells = <1>;
 
-					led0 {
+					led@8,0 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x01>;
 						label = "vexpress:0";
 						linux,default-trigger = "heartbeat";
 						default-state = "on";
 					};
-					led1 {
+					led@8,1 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x02>;
 						label = "vexpress:1";
 						linux,default-trigger = "mmc0";
 						default-state = "off";
 					};
-					led2 {
+					led@8,2 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x04>;
 						label = "vexpress:2";
 						linux,default-trigger = "cpu0";
 						default-state = "off";
 					};
-					led3 {
+					led@8,3 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x08>;
 						label = "vexpress:3";
 						linux,default-trigger = "cpu1";
 						default-state = "off";
 					};
-					led4 {
+					led@8,4 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x10>;
 						label = "vexpress:4";
 						linux,default-trigger = "cpu2";
 						default-state = "off";
 					};
-					led5 {
+					led@8,5 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x20>;
 						label = "vexpress:5";
 						linux,default-trigger = "cpu3";
 						default-state = "off";
 					};
-					led6 {
+					led@8,6 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x40>;
 						label = "vexpress:6";
 						default-state = "off";
 					};
-					led7 {
+					led@8,7 {
 						compatible = "register-bit-led";
+						reg = <0x08 0x04>;
 						offset = <0x08>;
 						mask = <0x80>;
 						label = "vexpress:7";
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
