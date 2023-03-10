Return-Path: <SRS0=AuUK=7C=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B33FC6FD19
	for <soc@archiver.kernel.org>; Fri, 10 Mar 2023 23:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 474DDC433D2; Fri, 10 Mar 2023 23:14:29 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F54EC433EF
	for <soc@kernel.org>; Fri, 10 Mar 2023 23:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F54EC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id g18so6987326ljl.3
        for <soc@kernel.org>; Fri, 10 Mar 2023 15:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678490065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8sV5Vj8c5M0LcFEdFXDRpLxeJYXercqLCFNelx4QVPg=;
        b=WAVkXGn5p5DTsh3W3kZ+9bi4y8o3WCqlE5QTgUg2KQWP+HUjz8WmI+glaN0wm8rxDD
         d1mdjtl5lx+ZWNQVT/g06fgAmX/47YbVEhNflXWCU7BGIRWnLR2man9jOlGga6bzK9+K
         1gmVbmHuOT5uXc3OKAMlLsVrddb4cmlcvgaZYVXEJhC+NUgbBYNHIKlU2v7kLU5QkirB
         COjnR2SfaoabaX94m18zfa0uG2cEQhsEooE2rlbPsz90eOTgFHg4Eh2/khjFWWBWz9A1
         q5UwGrr5vKOtO2krpeX8H8fmSfBwQKdvcWeawHJVOAjuV/2SEhg4S8gGC8yhz12TuYWx
         ad4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678490065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sV5Vj8c5M0LcFEdFXDRpLxeJYXercqLCFNelx4QVPg=;
        b=ecfUZmhm5WoejvEcQigV/7R6jLDQK83ivsTEOosg/iET+LUhL8Qpy70N2M/0do+iKP
         vJCmV9sH5IigImiBgoPVk+xgHf8MxkAMbHip4vcTuyB17zBzYnrvlNt0r4aFy1vzi7Mq
         s7D+JECM9pQCe8TqibwkRJp857m0iMePIpRjCGJslgaZ23s4AdarY2kwPYNcH14mK8K6
         7hux5T1ZD0U77KvKF8BA5E1wNXcOFmtxED11H2wYjXyEd9jbGEbe0NQGEjAY70WatZQv
         N8/x6SO/lcIzZpuR3FXZ9y8DnTwZh9pclobASGdapE27ifgbSZC98G7fALyMkhuTMJAD
         X79A==
X-Gm-Message-State: AO0yUKVmIJVyK3zQXdoRtkNTnyqMQxqanrVXcVEMxGlVCFanxLOa8yfL
	m5/rACmdiYTDGCzdl+xwqQJ8Sil2ld7nEQtauHg=
X-Google-Smtp-Source: AK7set/HFjcff4MDnzMfBjiuTxnUU4iNPd7O827r00e/rdsHiW4vrA9HZdWXIBnbYTVXSPtX3aEV0w==
X-Received: by 2002:a2e:93c6:0:b0:295:a33f:5349 with SMTP id p6-20020a2e93c6000000b00295a33f5349mr7880984ljh.26.1678490065265;
        Fri, 10 Mar 2023 15:14:25 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id d1-20020a2eb041000000b00295a583a20bsm144169ljl.74.2023.03.10.15.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 15:14:24 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ixp4xx: use "okay" for status
Date: Sat, 11 Mar 2023 00:14:20 +0100
Message-Id: <20230310231420.583121-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

"okay" over "ok" is preferred for status property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20230127101832.93789-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly to the appropriate
branch for v6.4, I do not plan to send more IXP4xx changes
right now.
---
 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts        | 6 +++---
 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts      | 6 +++---
 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts    | 2 +-
 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts     | 6 +++---
 arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts      | 6 +++---
 arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts  | 6 +++---
 arch/arm/boot/dts/intel-ixp42x-goramo-multilink.dts  | 6 +++---
 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts    | 4 ++--
 arch/arm/boot/dts/intel-ixp42x-ixdp425.dts           | 4 ++--
 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts          | 6 +++---
 arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts     | 4 ++--
 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts    | 6 +++---
 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v1.dts   | 4 ++--
 arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts  | 2 +-
 arch/arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts  | 6 +++---
 arch/arm/boot/dts/intel-ixp43x-kixrp435.dts          | 4 ++--
 arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi | 2 +-
 17 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts b/arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts
index bd4230d7dac9..765ab36e6f0c 100644
--- a/arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts
@@ -56,7 +56,7 @@ partitions {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from Coyote PCI boardfile.
@@ -80,7 +80,7 @@ pci@c0000000 {
 
 		/* EthB */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
@@ -102,7 +102,7 @@ phy5: ethernet-phy@5 {
 
 		/* EthC */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts b/arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts
index 92b987bc3f99..6f5b4e4eb1cc 100644
--- a/arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts
@@ -112,7 +112,7 @@ watchdog@5,0 {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from Vulcan PCI boardfile.
@@ -137,7 +137,7 @@ pci@c0000000 {
 
 		/* EthB */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
@@ -159,7 +159,7 @@ phy1: ethernet-phy@1 {
 
 		/* EthC */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts b/arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts
index 5ab09fb10dae..b9d46eb06507 100644
--- a/arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts
@@ -122,7 +122,7 @@ partitions {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from DSM-G600 PCI boardfile (dsmg600-pci.c)
diff --git a/arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts b/arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts
index b740403b05a9..5a5e16cc7335 100644
--- a/arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts
@@ -159,7 +159,7 @@ led@0,5 {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Written based on the FSG-3 PCI boardfile.
@@ -187,7 +187,7 @@ pci@c0000000 {
 
 		/* EthB */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
@@ -209,7 +209,7 @@ phy5: ethernet-phy@5 {
 
 		/* EthC */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts b/arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts
index b7cbc90e1c18..4d70f6afd13a 100644
--- a/arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts
@@ -53,7 +53,7 @@ partitions {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from Gateway 7001 PCI boardfile (gateway7001-pci.c)
@@ -74,7 +74,7 @@ pci@c0000000 {
 		};
 
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
@@ -91,7 +91,7 @@ phy1: ethernet-phy@1 {
 		};
 
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts b/arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts
index a5943f51e8c2..97e3f25bb210 100644
--- a/arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts
@@ -108,7 +108,7 @@ ide@1,0 {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from Avila PCI boardfile.
@@ -142,7 +142,7 @@ pci@c0000000 {
 
 		/* EthB */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
@@ -164,7 +164,7 @@ phy1: ethernet-phy@1 {
 
 		/* EthC */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-goramo-multilink.dts b/arch/arm/boot/dts/intel-ixp42x-goramo-multilink.dts
index f80388b17a9e..9ec0169bacf8 100644
--- a/arch/arm/boot/dts/intel-ixp42x-goramo-multilink.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-goramo-multilink.dts
@@ -82,7 +82,7 @@ partitions {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * The device has 4 slots (IDSEL) with one dedicated IRQ per slot.
@@ -148,7 +148,7 @@ hss@1 {
 
 		/* EthB */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 32>;
 			phy-mode = "rgmii";
@@ -170,7 +170,7 @@ phy1: ethernet-phy@1 {
 
 		/* EthC */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 33>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts b/arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts
index cbc87b344f6a..8da6823e1dbe 100644
--- a/arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts
@@ -109,7 +109,7 @@ partitions {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from NAS 100D PCI boardfile (nas100d-pci.c)
@@ -129,7 +129,7 @@ pci@c0000000 {
 		};
 
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-ixdp425.dts b/arch/arm/boot/dts/intel-ixp42x-ixdp425.dts
index beaadda4685f..194945748dc3 100644
--- a/arch/arm/boot/dts/intel-ixp42x-ixdp425.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-ixdp425.dts
@@ -40,7 +40,7 @@ partitions {
 
 		/* EthB */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
@@ -62,7 +62,7 @@ phy1: ethernet-phy@1 {
 
 		/* EthC */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts b/arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts
index f17cab12a64b..7011fea6205b 100644
--- a/arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts
@@ -61,7 +61,7 @@ partitions {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from IXDPG425 PCI boardfile.
@@ -95,7 +95,7 @@ pci@c0000000 {
 
 		/* EthB */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
@@ -117,7 +117,7 @@ phy5: ethernet-phy@5 {
 
 		/* EthC */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts b/arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts
index 547098069814..39a1dd17e88b 100644
--- a/arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts
@@ -118,7 +118,7 @@ partitions {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from NSLU2 PCI boardfile, INT A, B, C swizzled D constant
@@ -145,7 +145,7 @@ pci@c0000000 {
 		};
 
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts b/arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts
index 5e7e31b74b04..4aba9e0214a0 100644
--- a/arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts
@@ -117,7 +117,7 @@ partition@240000 {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * We have up to 2 slots (IDSEL) with 2 swizzled IRQs.
@@ -141,7 +141,7 @@ pci@c0000000 {
 		 * Do we need a new binding and property for this?
 		 */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
@@ -165,7 +165,7 @@ phy5: ethernet-phy@5 {
 
 		/* EthC - connected to KS8995 switch port 5 */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-netgear-wg302v1.dts b/arch/arm/boot/dts/intel-ixp42x-netgear-wg302v1.dts
index df2ca6d95ee5..19d56e9aec9d 100644
--- a/arch/arm/boot/dts/intel-ixp42x-netgear-wg302v1.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-netgear-wg302v1.dts
@@ -54,7 +54,7 @@ partitions {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from WG302 v2 PCI boardfile (wg302v2-pci.c)
@@ -77,7 +77,7 @@ pci@c0000000 {
 		};
 
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts b/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
index b444003c10e1..c550c421b659 100644
--- a/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
+++ b/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
@@ -79,7 +79,7 @@ partition@fff000 {
 
 		/* LAN port */
 		ethernet@c8009000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 3>;
 			queue-txready = <&qmgr 20>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts b/arch/arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts
index cf4010d60187..1db849515f9e 100644
--- a/arch/arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts
+++ b/arch/arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts
@@ -121,7 +121,7 @@ ide@3,0 {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * In the boardfile for the Cambria from OpenWRT the interrupts
@@ -167,7 +167,7 @@ pci@c0000000 {
 		};
 
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
@@ -188,7 +188,7 @@ phy2: ethernet-phy@2 {
 		};
 
 		ethernet@c800c000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 2>;
 			queue-txready = <&qmgr 19>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp43x-kixrp435.dts b/arch/arm/boot/dts/intel-ixp43x-kixrp435.dts
index 3d7cfa1a5ed4..4703a8b24765 100644
--- a/arch/arm/boot/dts/intel-ixp43x-kixrp435.dts
+++ b/arch/arm/boot/dts/intel-ixp43x-kixrp435.dts
@@ -36,7 +36,7 @@ partitions {
 
 		/* CHECKME: ethernet set-up taken from Gateworks Cambria */
 		ethernet@c800a000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 4>;
 			queue-txready = <&qmgr 21>;
 			phy-mode = "rgmii";
@@ -57,7 +57,7 @@ phy2: ethernet-phy@2 {
 		};
 
 		ethernet@c800c000 {
-			status = "ok";
+			status = "okay";
 			queue-rx = <&qmgr 2>;
 			queue-txready = <&qmgr 19>;
 			phy-mode = "rgmii";
diff --git a/arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi b/arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi
index 146352ba848b..31c0a69771c4 100644
--- a/arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi
+++ b/arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi
@@ -99,7 +99,7 @@ fs@800000 {
 		};
 
 		pci@c0000000 {
-			status = "ok";
+			status = "okay";
 
 			/*
 			 * Taken from IXDP425 PCI boardfile.
-- 
2.39.1

