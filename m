Return-Path: <SRS0=b/uL=M3=pengutronix.de=ore@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0517AC4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 04:35:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD3A860FC3; Wed,  4 Aug 2021 04:35:02 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9934160C3F
	for <soc@kernel.org>; Wed,  4 Aug 2021 04:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9934160C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1mB8c6-0006Ov-SG; Wed, 04 Aug 2021 06:34:42 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1mB8c5-00034k-WF; Wed, 04 Aug 2021 06:34:42 +0200
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
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
Date: Wed,  4 Aug 2021 06:34:37 +0200
Message-Id: <20210804043439.11757-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804043439.11757-1-o.rempel@pengutronix.de>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Add "skov" entry for the SKOV A/S: https://www.skov.com/en/

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 62cb1d9341f5..738d4f44f0de 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1068,6 +1068,8 @@ patternProperties:
     description: Silicon Integrated Systems Corp.
   "^sitronix,.*":
     description: Sitronix Technology Corporation
+  "^skov,.*":
+    description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
   "^smartlabs,.*":
-- 
2.30.2

