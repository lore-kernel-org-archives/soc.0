Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D84DC433DB
	for <soc@archiver.kernel.org>; Wed, 30 Dec 2020 15:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5802B21D1B; Wed, 30 Dec 2020 15:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88273207A6;
	Wed, 30 Dec 2020 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609341615;
	bh=9cD3rzF+jliZQDFnmk4M4xcu9Ory+11lC0lM2Tsu4OU=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=n8HRhucWlzEZzObZp3nGR1mAY/JHQd7aLrF14pJ7/oiivyyYJ677VyO5q4+OiWhQC
	 L3XcVXJrptNxwFLCHhlZPd4vb1daIRZWEeSb8auZwclBoYpA2tMwDt9QzbigIlUwc3
	 eSTAY8W6FbmcDJv9p4EJXv6ldbAELZ2hMV865adDCsXTRrRMZEbXy/UkBTuKoh+Mek
	 SnM3ZE+QTy0WsI2liqOTWkLzdG0eL7SlPnaNCZst65ERvsQ1NdDm2z55dFVS2FQaYZ
	 sFs3/pbbPa1/clfMNaBDIIdjXxvG4tsgCLq2H2zjAw3JZbOIizE0TaMgO9YsUjIfV6
	 K5m4zDkI0RjDw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jamie Iles <jamie@jamieiles.com>,
	Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: picoxcell: fix missing interrupt-parent properties
Date: Wed, 30 Dec 2020 16:20:05 +0100
Message-Id: <20201230152010.3914962-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

dtc points out that the interrupts for some devices are not parsable:

picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent

There are two VIC instances, so it's not clear which one needs to be
used. I found the BSP sources that reference VIC0, so use that:

https://github.com/r1mikey/meta-picoxcell/blob/master/recipes-kernel/linux/linux-picochip-3.0/0001-picoxcell-support-for-Picochip-picoXcell-SoC.patch

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
index c4c6c7e9e37b..5898879a3038 100644
--- a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
+++ b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
@@ -45,18 +45,21 @@ paxi {
 		emac: gem@30000 {
 			compatible = "cadence,gem";
 			reg = <0x30000 0x10000>;
+			interrupt-parent = <&vic0>;
 			interrupts = <31>;
 		};
 
 		dmac1: dmac@40000 {
 			compatible = "snps,dw-dmac";
 			reg = <0x40000 0x10000>;
+			interrupt-parent = <&vic0>;
 			interrupts = <25>;
 		};
 
 		dmac2: dmac@50000 {
 			compatible = "snps,dw-dmac";
 			reg = <0x50000 0x10000>;
+			interrupt-parent = <&vic0>;
 			interrupts = <26>;
 		};
 
@@ -233,6 +236,7 @@ ebi@50000000 {
 		axi2pico@c0000000 {
 			compatible = "picochip,axi2pico-pc3x2";
 			reg = <0xc0000000 0x10000>;
+			interrupt-parent = <&vic0>;
 			interrupts = <13 14 15 16 17 18 19 20 21>;
 		};
 	};
-- 
2.29.2

