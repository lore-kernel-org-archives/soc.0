Return-Path: <SRS0=pZ4E=HS=pascalroeleven.nl=dev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1ADC433DB
	for <soc@archiver.kernel.org>; Tue, 16 Feb 2021 17:09:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 229F764E13; Tue, 16 Feb 2021 17:09:29 +0000 (UTC)
X-Greylist: delayed 531 seconds by postgrey-1.34 at mail.kernel.org; Tue, 16 Feb 2021 17:09:28 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94936614A7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=pascalroeleven.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=dev@pascalroeleven.nl
Received: from pmg02-out1.zxcs.nl (pmg02-out1.zxcs.nl [185.104.30.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94936614A7
	for <soc@kernel.org>; Tue, 16 Feb 2021 17:09:28 +0000 (UTC)
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
	by pmg02.zxcs.nl (ZXCS) with ESMTP id 06BC082B80;
	Tue, 16 Feb 2021 18:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WNwlUaMzO0voeQD0k+em6Iu2mD8MNkshIay47M4C/oU=; b=IxpIQRANR3/jUHdvYw+oTbJDqn
	r46QrivL4TqhZL+J9kuLW+FUkGrZRQ/iQ4WZGkIBxMma/1tV+KZ4F+vbWG3reGT4y+Cc1jNap6E5/
	ODxaYqZ7INmrdnR1EnTV+C9Ou7WoglX92Mwa/T9gfqTii+mKM/ZjbuOR7DqqF90QeNnk635SdHEqW
	vxUzZSCXHPKDVLYNcaVPmQ25D3qdYhF2faoMgQXuJYZivzLmp3Rl7CvzYBghEd5KAXDGsByxZM57v
	E73lfz9OYpBMiVj2pUdxStDvsDctA9Cli6s0ftHIDVjgNsOKzOKNWWQ9Jx6AsZaKlmaK5P/8xToSR
	u1KBI/tg==;
From: Pascal Roeleven <dev@pascalroeleven.nl>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Martin Cerveny <m.cerveny@computer.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com,
	Pascal Roeleven <dev@pascalroeleven.nl>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v3 1/2] dt-bindings: arm: Add Topwise A721
Date: Tue, 16 Feb 2021 17:59:53 +0100
Message-ID: <20210216165954.43135-2-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210216165954.43135-1-dev@pascalroeleven.nl>
References: <20210216165954.43135-1-dev@pascalroeleven.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: dev@pascalroeleven.nl
Message-ID: <20210216165953.MUfl7Rlias7Q2QY8NYUaTMrJpX0NBDHEHBBaTMSwP_c@z>

Add the bindings for Topwise A721 tablet

Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 6db32fbf81..8833a9c925 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -787,6 +787,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Topwise A721 Tablet
+        items:
+          - const: topwise,a721
+          - const: allwinner,sun4i-a10
+
       - description: Utoo P66
         items:
           - const: utoo,p66
-- 
2.27.0


