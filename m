Return-Path: <SRS0=YJRe=LN=armlinux.org.uk=rmk+soc=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42705C2B9F4
	for <soc@archiver.kernel.org>; Sat, 19 Jun 2021 15:55:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F02F66117A; Sat, 19 Jun 2021 15:55:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6559561159
	for <soc@kernel.org>; Sat, 19 Jun 2021 15:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6559561159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rmk+soc=kernel.org@armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vittaj5sOJEfeo9ZvwVSPJoRPela2MzSdhI9sYKDpDw=; b=LOzY/HAZuDZ79V+3Y0FTbFTEvL
	ZAqsCDY+GGpM5uAMihmeg24GGspkgSKVu+9K4Khdb4KWFQ/BJ24+zSnTkUgWy8HEEio9VaQJBmT42
	De0RFYybhZg2fFYi28HHqyjKRsWFx8BniJiczrSDnqgSPfyEaTiIDWmPyKm3cbI6zJ7Mo8JnJoeXJ
	bh/TO4CsKnY4oBHlgFs0d56Fnzil1gouicQQPkJSb3+/XtFdjyr0Zfkzl/yhiyC01XziYwu3e1XvZ
	Mzu2waXFK9rRzzvv9ypLnknARwxDSz+w9kmeZsnLf65VJu8+dv4wyo/1Ijh9K1AUpWqJTMfLdL5Gy
	F4jgAvIw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56500 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ludJe-0002ao-Kq; Sat, 19 Jun 2021 16:55:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ludJe-0001rQ-8c; Sat, 19 Jun 2021 16:55:26 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,Olof Johansson <olof@lixom.net>,soc@kernel.org,Rob Herring <robh+dt@kernel.org>,Sascha Hauer <s.hauer@pengutronix.de>,Pengutronix Kernel Team <kernel@pengutronix.de>,Fabio Estevam <festevam@gmail.com>,NXP Linux Team <linux-imx@nxp.com>,linux-arm-kernel@lists.infradead.org,devicetree@vger.kernel.org,Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add SolidSense boards
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ludJe-0001rQ-8c@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Sat, 19 Jun 2021 16:55:26 +0100

Add SolidRun SolidSense boards.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 297c87f45db8..24b6d75c11ad 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -223,6 +223,7 @@ title: Freescale i.MX Platforms Device Tree Bindings
               - solidrun,cubox-i/q        # SolidRun Cubox-i Dual/Quad
               - solidrun,hummingboard/q
               - solidrun,hummingboard2/q
+              - solidrun,solidsense/q     # SolidRun SolidSense Dual/Quad
               - tbs,imx6q-tbs2910         # TBS2910 Matrix ARM mini PC
               - technexion,imx6q-pico-dwarf   # TechNexion i.MX6Q Pico-Dwarf
               - technexion,imx6q-pico-hobbit  # TechNexion i.MX6Q Pico-Hobbit
@@ -379,6 +380,7 @@ title: Freescale i.MX Platforms Device Tree Bindings
               - solidrun,cubox-i/dl            # SolidRun Cubox-i Solo/DualLite
               - solidrun,hummingboard/dl
               - solidrun,hummingboard2/dl      # SolidRun HummingBoard2 Solo/DualLite
+              - solidrun,solidsense/dl         # SolidRun SolidSense Solo/DualLite
               - technexion,imx6dl-pico-dwarf   # TechNexion i.MX6DL Pico-Dwarf
               - technexion,imx6dl-pico-hobbit  # TechNexion i.MX6DL Pico-Hobbit
               - technexion,imx6dl-pico-nymph   # TechNexion i.MX6DL Pico-Nymph
-- 
2.20.1

