Return-Path: <SRS0=3I03=H2=pascalroeleven.nl=dev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3ADC433E0
	for <soc@archiver.kernel.org>; Wed, 24 Feb 2021 10:53:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6875664F02; Wed, 24 Feb 2021 10:53:18 +0000 (UTC)
Received: from pmg02-out1.zxcs.nl (pmg02-out1.zxcs.nl [185.104.30.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA57E64ED3
	for <soc@kernel.org>; Wed, 24 Feb 2021 10:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA57E64ED3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=pascalroeleven.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=dev@pascalroeleven.nl
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
	by pmg02.zxcs.nl (ZXCS) with ESMTP id 285EE83B1F;
	Wed, 24 Feb 2021 11:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5iH+f0B18ifcjxW9mghCrDKfJx2VEwYdRjMyyarrnlE=; b=OAMLsf6EsGYaPWvh77MF+kOiMq
	swTMcgC92IJ+vHNg6rUVTGbYypWoHMoCuWLbtBHaSJ3Wp96o+zK9N2Ml+QnVsVFyNYgrX+1hGl55u
	mjkEyBvqD5Za7HZQGe6LI4amXfQXY0Nouik+0CoeYaQpIyeVCoGZ5h55PJ5yLb0JS9OQxkALdf31y
	BTV0dqJrdjUFwdzZYffQT5DcAvXu9SJHXE/cKkTM++f6CED3k6Am/SmCmsKfnNh0TJNaxttOm8mwL
	TvunH+jUfHBYS3d0HLHFTPNyOVZ3FML+/uW5EMdTA0v57vCuCJdNGG4fovm7GhoctIv9tSmodQ22y
	mo30/jNA==;
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
	Icenowy Zheng <icenowy@aosc.io>,
	Martin Cerveny <m.cerveny@computer.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com,
	Pascal Roeleven <dev@pascalroeleven.nl>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: arm: Add Topwise A721
Date: Wed, 24 Feb 2021 11:52:39 +0100
Message-Id: <20210224105240.47754-2-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224105240.47754-1-dev@pascalroeleven.nl>
References: <20210224105240.47754-1-dev@pascalroeleven.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: dev@pascalroeleven.nl

Add the bindings for Topwise A721 tablet

Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 08607c7ec1..ac750025a2 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -802,6 +802,11 @@ properties:
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


