Return-Path: <SRS0=6mjM=OO=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BEFC433EF
	for <soc@archiver.kernel.org>; Fri, 24 Sep 2021 08:58:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1CA9E61261; Fri, 24 Sep 2021 08:58:44 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC8226124C;
	Fri, 24 Sep 2021 08:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC8226124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FBO3wvEQlAhNVXUCOTOLI4o07m4dLW9qRIn8f/7Mv6E=; b=YSbx19fbZqBE5cBu/8OeKuhpeS
	QCh1ACycQRrcShtRNUhIszDOK/2GZfATJqdjIvsp9MvTnd00t+wZiSYt8jTdx/72p8N56XRhhb5RD
	9l9rREZDnKpOpBMscv7f/VFqFRpkKL6vepnKhgtCD143CDeej7J5ecKuWsOEPNohzNNY=;
Received: from p200300ccff0ce8001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0c:e800:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1mTh2R-00024f-Cb; Fri, 24 Sep 2021 10:58:35 +0200
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1mTh2Q-00Ak4L-Uq; Fri, 24 Sep 2021 10:58:34 +0200
From: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
To: robh+dt@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	krzk@kernel.org,
	leoyang.li@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: arm: fsl: Add E70K02 based ebook readers
Date: Fri, 24 Sep 2021 10:58:29 +0200
Message-Id: <20210924085832.2560317-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210924085832.2560317-1-andreas@kemnade.info>
References: <20210924085832.2560317-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Kobo Libra H2O and Tolino Vision 5.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 60f4862ba15e..0c71dd336cab 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -494,6 +494,7 @@ properties:
               - fsl,imx6sl-evk            # i.MX6 SoloLite EVK Board
               - kobo,tolino-shine2hd
               - kobo,tolino-shine3
+              - kobo,tolino-vision5
               - revotics,imx6sl-warp      # Revotics WaRP Board
           - const: fsl,imx6sl
 
@@ -502,6 +503,7 @@ properties:
           - enum:
               - fsl,imx6sll-evk
               - kobo,clarahd
+              - kobo,librah2o
           - const: fsl,imx6sll
 
       - description: i.MX6SX based Boards
-- 
2.30.2

