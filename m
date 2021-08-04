Return-Path: <SRS0=b/uL=M3=pengutronix.de=ore@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33521C4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 04:34:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0607260F25; Wed,  4 Aug 2021 04:34:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBC660C3F
	for <soc@kernel.org>; Wed,  4 Aug 2021 04:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BBC660C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1mB8c6-0006Ow-SG; Wed, 04 Aug 2021 06:34:42 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1mB8c6-00034u-ES; Wed, 04 Aug 2021 06:34:42 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 2/3] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards
Date: Wed,  4 Aug 2021 06:34:38 +0200
Message-Id: <20210804043439.11757-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804043439.11757-1-o.rempel@pengutronix.de>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index e2097011c4b0..600dfe984ab3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -221,6 +221,9 @@ properties:
               - prt,prti6q                # Protonic PRTI6Q board
               - prt,prtwd2                # Protonic WD2 board
               - rex,imx6q-rex-pro         # Rex Pro i.MX6 Quad Board
+              - skov,imx6q-skov-revc-lt2  # SKOV IMX6 CPU QuadCore lt2
+              - skov,imx6q-skov-revc-lt6  # SKOV IMX6 CPU QuadCore lt6
+              - skov,imx6q-skov-reve-mi1010ait-1cp1 # SKOV IMX6 CPU QuadCore mi1010ait-1cp1
               - solidrun,cubox-i/q        # SolidRun Cubox-i Dual/Quad
               - solidrun,hummingboard/q
               - solidrun,hummingboard2/q
@@ -378,6 +381,8 @@ properties:
               - prt,prtvt7                # Protonic VT7 board
               - rex,imx6dl-rex-basic      # Rex Basic i.MX6 Dual Lite Board
               - riot,imx6s-riotboard      # RIoTboard i.MX6S
+              - skov,imx6dl-skov-revc-lt2 # SKOV IMX6 CPU SoloCore lt2
+              - skov,imx6dl-skov-revc-lt6 # SKOV IMX6 CPU SoloCore lt6
               - solidrun,cubox-i/dl            # SolidRun Cubox-i Solo/DualLite
               - solidrun,hummingboard/dl
               - solidrun,hummingboard2/dl      # SolidRun HummingBoard2 Solo/DualLite
-- 
2.30.2

