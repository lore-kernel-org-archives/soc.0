Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9195C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 23:26:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8604560FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 23:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8604560FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vADukE1vGyo6fPvWdSQqeM3A0BwocmKQ5zLLvua1XVA=; b=wtmpxAfovoBEMx
	C6rkGMQ8OZUWXKJICDYCjhRBhlZVos5aIhj288jHleWXywykPaJWYlg5dP33ro/NgYLblJB4XwMP6
	ZMPaVOKcp2YuTXLk2jjsP69AUHEUB/Q/k9Zl/JBcmmDMnz24OGMu8EjZNiDR7UEXqI7ii9IQ50rYD
	hlazrvPQ5rqTTNAsC3vJWhSdX5e8XVLRAEn0pDAuIvdZ/rDL1JoAfAkiBX5cCeGIfVFUkOaTzoVg+
	S22lOhQ/+vc/O7Y+Bf15IJZfdgjcEczQnJQzY3gU+MIDbGnA+igV0nwlJVuGJhtKFIdplRwptX7i+
	bf6tu0RD7BcliUB/0cnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1memrA-00Em0z-Kf; Sun, 24 Oct 2021 23:24:48 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1memr6-00Elzy-Ha
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 23:24:46 +0000
Received: by mail-lj1-x230.google.com with SMTP id d13so4949674ljg.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 16:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cqZJPlRae/8VilYheb4qvDmsox1aCUwaav5jcRgvUdc=;
 b=Ow8f+4HQKAPUkPRGR/Kv/wc1DrT/MYfeNrkzsbDoaOSVMKKHqNGunRMTL65/+D9Cel
 Rs5oGy1imC5bQwt+QtfFCfppwEXGRDqSH5upHRvr7qLoe6Sm+w6hfp6IW4qedDFPTAT2
 NzDAZTi/GO55iIm4ETnE72pzU+YVrNARpirhfMlbhIyn+LDUnZ5+bzwTCvKRDoNL7sUD
 d5qjKQ0sXvSayKWVLN1IAJxfYnHPjlJPk7/we5leQXoXxCdtl5dK3YeA/jKhv8rQBnZo
 eZbSdwsuvqC1ACpgUPuhKfONurRP/AtNCfzM4jFee/RwVqLCWXB4S+aspTTcInLGojoK
 0dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cqZJPlRae/8VilYheb4qvDmsox1aCUwaav5jcRgvUdc=;
 b=rjDfuHNfXbIa9JxdRoLGEfhdpyQ9a1wfFn4S2hwRAPEd67BTVi7sz8oQV0dAc3n3Sm
 LDkC8ofgx1TDdLq0d3uXKIcfvu3CHjbGeJNE+zZih7/SzuYEPneZ4yxKHhqgM93N3cAr
 +T6hKYEsm4d+WOvVnNEzvX5pgaxa0o792IHhV1/Azu6+xhuGnyQJe18CFRGJRdtFfxRx
 ufMBXFl/9rWVRIs39i2c4Z3YJNciYUfCACQ4eLRaJzjCinVL7EgJTMM/PfkzpQ0UKE4w
 hMiW7OTtb5flkOSm5CM3G2wKSB3EKTtsiOlcmT2Cl1X6B5t7GmuAJa9L3tEMqZx9UXWn
 O8Cw==
X-Gm-Message-State: AOAM530PWtEYowg0PvLI+7tP4CgFzW9AuAyYE5sUqC9FpjvILQcJnns1
 nc+u7vyKIiN5+8VC4TDjReZSxH/E0yXuJw==
X-Google-Smtp-Source: ABdhPJxpwUHjwJwO6s+JCPrNM4AqkRUWdm1i5hO+M/wuqwVKVz+FoBBaSqBJtvRZZxL5zq/OBDHkBw==
X-Received: by 2002:a05:651c:1024:: with SMTP id
 w4mr15284299ljm.17.1635117882610; 
 Sun, 24 Oct 2021 16:24:42 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id j7sm777157lfe.0.2021.10.24.16.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 16:24:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: arm: Update ICST clock nodes 'reg' and node names
Date: Mon, 25 Oct 2021 01:22:39 +0200
Message-ID: <20211024232239.211822-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_162444_628677_486B5E6A 
X-CRM114-Status: GOOD (  15.25  )
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
Message-ID: <20211024232239.SkJbXMVl7vzUa1mVYYY2t_1mF38SBL6tJlTHpFBhiAY@z>

From: Rob Herring <robh@kernel.org>

Add a 'reg' entry for ICST clock nodes on the Arm Ltd platforms. The 'reg'
entry is the VCO register address. With this, the node name can be updated
to use a generic node name, 'clock-controller', and a unit-address.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this directly for v5.16.
---
 arch/arm/boot/dts/arm-realview-eb.dtsi    | 15 ++++++++++-----
 arch/arm/boot/dts/arm-realview-pb1176.dts | 15 ++++++++++-----
 arch/arm/boot/dts/arm-realview-pb11mp.dts | 21 ++++++++++++++-------
 arch/arm/boot/dts/arm-realview-pbx.dtsi   | 15 ++++++++++-----
 arch/arm/boot/dts/integratorap-im-pd1.dts |  9 +++++++--
 arch/arm/boot/dts/integratorap.dts        | 15 +++++++++++----
 arch/arm/boot/dts/integratorcp.dts        |  9 ++++++---
 7 files changed, 68 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index 04e8a27ba1eb..53ff3c9cd0ed 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -258,36 +258,41 @@ led@08.7 {
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: clock-controller@c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x0C>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk1: osc1@10 {
+			oscclk1: clock-controller@10 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x10 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x10>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk2: osc2@14 {
+			oscclk2: clock-controller@14 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x14 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x14>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk3: osc3@18 {
+			oscclk3: clock-controller@18 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x18 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x18>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk4: osc4@1c {
+			oscclk4: clock-controller@1c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x1c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x1c>;
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index 366687fb1ee3..c140593e64ab 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -276,36 +276,41 @@ led@08.7 {
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: clock-controller@c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x0C>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk1: osc1@10 {
+			oscclk1: clock-controller@10 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x10 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x10>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk2: osc2@14 {
+			oscclk2: clock-controller@14 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x14 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x14>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk3: osc3@18 {
+			oscclk3: clock-controller@18 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x18 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x18>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk4: osc4@1c {
+			oscclk4: clock-controller@1c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x1c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x1c>;
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 228a51a38f95..6edd3a2f3b46 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -367,50 +367,57 @@ led@08.7 {
 				default-state = "off";
 			};
 
-			oscclk0: osc0@0c {
+			oscclk0: clock-controller@c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x0C>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk1: osc1@10 {
+			oscclk1: clock-controller@10 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x10 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x10>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk2: osc2@14 {
+			oscclk2: clock-controller@14 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x14 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x14>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk3: osc3@18 {
+			oscclk3: clock-controller@18 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x18 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x18>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk4: osc4@1c {
+			oscclk4: clock-controller@1c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x1c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x1c>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk5: osc5@d4 {
+			oscclk5: clock-controller@d4 {
 				compatible = "arm,syscon-icst307";
+				reg = <0xd4 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0xd4>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk6: osc6@d8 {
+			oscclk6: clock-controller@d8 {
 				compatible = "arm,syscon-icst307";
+				reg = <0xd8 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0xd8>;
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index ccf6f756b6ed..5edfffe76c70 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -280,36 +280,41 @@ led@08.7 {
 				label = "versatile:7";
 				default-state = "off";
 			};
-			oscclk0: osc0@0c {
+			oscclk0: clock-controller@c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x0c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x0C>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk1: osc1@10 {
+			oscclk1: clock-controller@10 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x10 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x10>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk2: osc2@14 {
+			oscclk2: clock-controller@14 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x14 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x14>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk3: osc3@18 {
+			oscclk3: clock-controller@18 {
 				compatible = "arm,syscon-icst307";
+				reg = <0x18 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x18>;
 				clocks = <&xtal24mhz>;
 			};
-			oscclk4: osc4@1c {
+			oscclk4: clock-controller@1c {
 				compatible = "arm,syscon-icst307";
+				reg = <0x1c 0x04>;
 				#clock-cells = <0>;
 				lock-offset = <0x20>;
 				vco-offset = <0x1c>;
diff --git a/arch/arm/boot/dts/integratorap-im-pd1.dts b/arch/arm/boot/dts/integratorap-im-pd1.dts
index 0614f82b808e..d47bfb66d069 100644
--- a/arch/arm/boot/dts/integratorap-im-pd1.dts
+++ b/arch/arm/boot/dts/integratorap-im-pd1.dts
@@ -28,9 +28,13 @@ &lm0 {
 	syscon@0 {
 		compatible = "arm,im-pd1-syscon", "syscon";
 		reg = <0x00000000 0x1000>;
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-		vco1: vco1-clock {
+		vco1: clock-controller@0 {
 			compatible = "arm,impd1-vco1";
+			reg = <0x00 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x08>;
 			vco-offset = <0x00>;
@@ -38,8 +42,9 @@ vco1: vco1-clock {
 			clock-output-names = "IM-PD1-VCO1";
 		};
 
-		vco2: vco2-clock {
+		vco2: clock-controller@4 {
 			compatible = "arm,impd1-vco2";
+			reg = <0x04 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x08>;
 			vco-offset = <0x04>;
diff --git a/arch/arm/boot/dts/integratorap.dts b/arch/arm/boot/dts/integratorap.dts
index 67d1f9b24a52..9b652cc27b14 100644
--- a/arch/arm/boot/dts/integratorap.dts
+++ b/arch/arm/boot/dts/integratorap.dts
@@ -88,8 +88,9 @@ cm24mhz: cm24mhz@24M {
 		};
 
 		/* Oscillator on the core module, clocks the CPU core */
-		cmosc: cmosc@24M {
+		cmosc: clock-controller@8 {
 			compatible = "arm,syscon-icst525-integratorap-cm";
+			reg = <0x08 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x08>;
@@ -97,8 +98,9 @@ cmosc: cmosc@24M {
 		};
 
 		/* Auxilary oscillator on the core module, 32.369MHz at boot */
-		auxosc: auxosc@24M {
+		auxosc: clock-controller@1c {
 			compatible = "arm,syscon-icst525";
+			reg = <0x1c 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x1c>;
@@ -109,13 +111,17 @@ auxosc: auxosc@24M {
 	syscon {
 		compatible = "arm,integrator-ap-syscon", "syscon";
 		reg = <0x11000000 0x100>;
+		ranges = <0x0 0x11000000 0x100>;
+		#size-cells = <1>;
+		#address-cells = <1>;
 
 		/*
 		 * SYSCLK clocks PCIv3 bridge, system controller and the
 		 * logic modules.
 		 */
-		sysclk: apsys@24M {
+		sysclk: clock-controller@4 {
 			compatible = "arm,syscon-icst525-integratorap-sys";
+			reg = <0x04 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x1c>;
 			vco-offset = <0x04>;
@@ -123,8 +129,9 @@ sysclk: apsys@24M {
 		};
 
 		/* One-bit control for the PCI bus clock (33 or 25 MHz) */
-		pciclk: pciclk@24M {
+		pciclk: clock-controller@4,8 {
 			compatible = "arm,syscon-icst525-integratorap-pci";
+			reg = <0x04 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x1c>;
 			vco-offset = <0x04>;
diff --git a/arch/arm/boot/dts/integratorcp.dts b/arch/arm/boot/dts/integratorcp.dts
index 01fa229e1bd0..38fc7e81bdb6 100644
--- a/arch/arm/boot/dts/integratorcp.dts
+++ b/arch/arm/boot/dts/integratorcp.dts
@@ -92,8 +92,9 @@ cm24mhz: cm24mhz@24M {
 		};
 
 		/* Oscillator on the core module, clocks the CPU core */
-		cmcore: cmosc@24M {
+		cmcore: clock-controller@8 {
 			compatible = "arm,syscon-icst525-integratorcp-cm-core";
+			reg = <0x08 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x08>;
@@ -101,8 +102,9 @@ cmcore: cmosc@24M {
 		};
 
 		/* Oscillator on the core module, clocks the memory bus */
-		cmmem: cmosc@24M {
+		cmmem: clock-controller@8,12 {
 			compatible = "arm,syscon-icst525-integratorcp-cm-mem";
+			reg = <0x08 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x08>;
@@ -110,8 +112,9 @@ cmmem: cmosc@24M {
 		};
 
 		/* Auxilary oscillator on the core module, clocks the CLCD */
-		auxosc: auxosc@24M {
+		auxosc: clock-controller@1c {
 			compatible = "arm,syscon-icst525";
+			reg = <0x1c 0x04>;
 			#clock-cells = <0>;
 			lock-offset = <0x14>;
 			vco-offset = <0x1c>;
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
