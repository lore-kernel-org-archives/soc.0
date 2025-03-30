Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293F1C84A0
	for <soc@lists.linux.dev>; Sun, 30 Mar 2025 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743336865; cv=none; b=b0JpTbFef5K2KpYe/rjFm1hJ1RIE1pmaUtY1RnN6FAUIJMYpYehh+abaw9dfFmyf051+PnPvs+KFxfbmmJB1wqX7ZnmlbNvhRu/FxldO/jyaITvPFiBrTUfXxM9y26dcCS/kjDBPa+qUU7biVnGIAqQXjw25QXBuccGllybBumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743336865; c=relaxed/simple;
	bh=Tp76RQjto65tfqk1KyRlucatGzLAwZC/R4ekvX3GXAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uttDLWXSHx27yhscms3oD/lnnWk3bGkQNh7If7jFJm/ZX/4/QrOksPu508J1ny1gfmSJwBDs/Mbuc3V38AkbwRpavF2vL0QGqlw285UZdNNgXH0epDCrZ71KSu1MRcGYgm/+RjmMfPyymGE66/rVyBI146lCA93Knhyh7VbzE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P0jmemQv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P0jmemQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=hB5oz3jt9HbdApNy+Qkzl5HYzNK/wz7/ltME20GJbd8=; b=P0jmem
	QvkAvu44ptj/pm3Don9b1FORQV3KgeTTbD5npI8/e/aq3yOpwCF+WYf8vHl1HWMD
	PTOel7EVWiUQ3OsNFvAmH3XkJ/KRsIkRTXtma4nO8wTWwnUg3hKoGXzxKL0m8x/N
	HURH2w4NY0pFw8MoSvkjfJINcfN/8AriOJZbTzbEin2eXg5nVTwmplVNVQA/2Ni6
	giUDRyoXk6HLqVR9VGfcTtInonNb67eEbRgoBJc7MINhueSIwSheV4kRZG7gMayB
	Lsx5NRTIM5CMb6Z4Hta9FhoWgarZV0+9nVd2xtMzhISLzRAPo5+4HhBBcQqS92pI
	TojpG3w8Hoha5XmA==
Received: (qmail 855832 invoked from network); 30 Mar 2025 14:14:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:19 +0200
X-UD-Smtp-Session: l3s3148p1@2UIwPo4x7WBtKjBa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	soc@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: st: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:26 +0200
Message-ID: <20250330121326.9069-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They should be named "usb@".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/st/spear1310-evb.dts | 8 ++++----
 arch/arm/boot/dts/st/spear1340-evb.dts | 8 ++++----
 arch/arm/boot/dts/st/spear13xx.dtsi    | 8 ++++----
 arch/arm/boot/dts/st/spear300-evb.dts  | 6 +++---
 arch/arm/boot/dts/st/spear310-evb.dts  | 6 +++---
 arch/arm/boot/dts/st/spear320-evb.dts  | 6 +++---
 arch/arm/boot/dts/st/spear320-hmi.dts  | 6 +++---
 arch/arm/boot/dts/st/spear3xx.dtsi     | 6 +++---
 arch/arm/boot/dts/st/spear600.dtsi     | 8 ++++----
 9 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
index ad216571ba57..089bd7db55c7 100644
--- a/arch/arm/boot/dts/st/spear1310-evb.dts
+++ b/arch/arm/boot/dts/st/spear1310-evb.dts
@@ -205,19 +205,19 @@ partition@390000 {
 			};
 		};
 
-		ehci@e4800000 {
+		usb@e4800000 {
 			status = "okay";
 		};
 
-		ehci@e5800000 {
+		usb@e5800000 {
 			status = "okay";
 		};
 
-		ohci@e4000000 {
+		usb@e4000000 {
 			status = "okay";
 		};
 
-		ohci@e5000000 {
+		usb@e5000000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index 9b515b21a633..d24146c3c9e8 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -203,7 +203,7 @@ partition@390000 {
 			};
 		};
 
-		ehci@e4800000 {
+		usb@e4800000 {
 			status = "okay";
 		};
 
@@ -221,7 +221,7 @@ button@1 {
 			};
 		};
 
-		ehci@e5800000 {
+		usb@e5800000 {
 			status = "okay";
 		};
 
@@ -238,11 +238,11 @@ incodec: dir-hifi {
 			status = "okay";
 		};
 
-		ohci@e4000000 {
+		usb@e4000000 {
 			status = "okay";
 		};
 
-		ohci@e5000000 {
+		usb@e5000000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 3b6897084e26..76749992394d 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -174,7 +174,7 @@ smi: flash@ea000000 {
 			status = "disabled";
 		};
 
-		ehci@e4800000 {
+		usb@e4800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe4800000 0x1000>;
 			interrupts = <0 64 0x4>;
@@ -182,7 +182,7 @@ ehci@e4800000 {
 			status = "disabled";
 		};
 
-		ehci@e5800000 {
+		usb@e5800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe5800000 0x1000>;
 			interrupts = <0 66 0x4>;
@@ -190,7 +190,7 @@ ehci@e5800000 {
 			status = "disabled";
 		};
 
-		ohci@e4000000 {
+		usb@e4000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe4000000 0x1000>;
 			interrupts = <0 65 0x4>;
@@ -198,7 +198,7 @@ ohci@e4000000 {
 			status = "disabled";
 		};
 
-		ohci@e5000000 {
+		usb@e5000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe5000000 0x1000>;
 			interrupts = <0 67 0x4>;
diff --git a/arch/arm/boot/dts/st/spear300-evb.dts b/arch/arm/boot/dts/st/spear300-evb.dts
index 303ef29fb805..7d4e6412d558 100644
--- a/arch/arm/boot/dts/st/spear300-evb.dts
+++ b/arch/arm/boot/dts/st/spear300-evb.dts
@@ -119,15 +119,15 @@ spi0: spi@d0100000 {
 			status = "okay";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			status = "okay";
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			status = "okay";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear310-evb.dts b/arch/arm/boot/dts/st/spear310-evb.dts
index ea0b53036f7b..459182210825 100644
--- a/arch/arm/boot/dts/st/spear310-evb.dts
+++ b/arch/arm/boot/dts/st/spear310-evb.dts
@@ -133,15 +133,15 @@ spi0: spi@d0100000 {
 			status = "okay";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			status = "okay";
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			status = "okay";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear320-evb.dts b/arch/arm/boot/dts/st/spear320-evb.dts
index 3c026d021c92..6ac53d993cf3 100644
--- a/arch/arm/boot/dts/st/spear320-evb.dts
+++ b/arch/arm/boot/dts/st/spear320-evb.dts
@@ -142,15 +142,15 @@ spi2: spi@a6000000 {
 			status = "okay";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			status = "okay";
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			status = "okay";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear320-hmi.dts b/arch/arm/boot/dts/st/spear320-hmi.dts
index 721e5ee7b680..8010918e5257 100644
--- a/arch/arm/boot/dts/st/spear320-hmi.dts
+++ b/arch/arm/boot/dts/st/spear320-hmi.dts
@@ -92,7 +92,7 @@ dma@fc400000 {
 			status = "okay";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			status = "okay";
 		};
 
@@ -147,11 +147,11 @@ button@2 {
 			};
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			status = "okay";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear3xx.dtsi b/arch/arm/boot/dts/st/spear3xx.dtsi
index cc88ebe7a60c..f54bb80ba28a 100644
--- a/arch/arm/boot/dts/st/spear3xx.dtsi
+++ b/arch/arm/boot/dts/st/spear3xx.dtsi
@@ -73,21 +73,21 @@ spi0: spi@d0100000 {
 			status = "disabled";
 		};
 
-		ehci@e1800000 {
+		usb@e1800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe1800000 0x1000>;
 			interrupts = <26>;
 			status = "disabled";
 		};
 
-		ohci@e1900000 {
+		usb@e1900000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe1900000 0x1000>;
 			interrupts = <25>;
 			status = "disabled";
 		};
 
-		ohci@e2100000 {
+		usb@e2100000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe2100000 0x1000>;
 			interrupts = <27>;
diff --git a/arch/arm/boot/dts/st/spear600.dtsi b/arch/arm/boot/dts/st/spear600.dtsi
index 6b67c0ceaed9..9a93367445ca 100644
--- a/arch/arm/boot/dts/st/spear600.dtsi
+++ b/arch/arm/boot/dts/st/spear600.dtsi
@@ -91,7 +91,7 @@ smi: flash@fc000000 {
 			status = "disabled";
 		};
 
-		ehci_usb0: ehci@e1800000 {
+		ehci_usb0: usb@e1800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe1800000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -99,7 +99,7 @@ ehci_usb0: ehci@e1800000 {
 			status = "disabled";
 		};
 
-		ehci_usb1: ehci@e2000000 {
+		ehci_usb1: usb@e2000000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe2000000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -107,7 +107,7 @@ ehci_usb1: ehci@e2000000 {
 			status = "disabled";
 		};
 
-		ohci_usb0: ohci@e1900000 {
+		ohci_usb0: usb@e1900000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe1900000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -115,7 +115,7 @@ ohci_usb0: ohci@e1900000 {
 			status = "disabled";
 		};
 
-		ohci_usb1: ohci@e2100000 {
+		ohci_usb1: usb@e2100000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe2100000 0x1000>;
 			interrupt-parent = <&vic1>;
-- 
2.47.2

