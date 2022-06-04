Return-Path: <SRS0=zXxM=WL=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28B1C433EF
	for <soc@archiver.kernel.org>; Sat,  4 Jun 2022 13:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9FDDC34114; Sat,  4 Jun 2022 13:56:21 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E67D0C385B8;
	Sat,  4 Jun 2022 13:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E67D0C385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BmBmUf2v9Q9hYXdfwnJjZQULdKw68XYCi/mBaSZxjyM=; b=muBE82ZCLw9ZgRWspJFLn0MdF9
	/gZZe6vnsJp7iH3nTDkt1WB4AcB1dGpIkDe48Ct0S1Er5ux6fYce8fo2aOJoe5xz5M64vnFNfD9rw
	1LO/k+yAJjdHXTFxD+/Lc2h5dXkCKA10rt4t0zJafL6YYJxEY6mVxsfztO4J4EjlO8sI=;
Received: from p200300ccff3313001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff33:1300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1nxUGA-0007bO-Rj; Sat, 04 Jun 2022 15:56:11 +0200
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1nxUGA-002NzD-8V; Sat, 04 Jun 2022 15:56:10 +0200
From: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	l.stach@pengutronix.de,
	marcel.ziswiler@toradex.com,
	alexander.stein@ew.tq-group.com,
	tharvey@gateworks.com,
	linux@rempel-privat.de,
	matthias.schiffer@ew.tq-group.com,
	cniedermaier@dh-electronics.com,
	sebastian.reichel@collabora.com,
	leoyang.li@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nicolecrivain@gmail.com
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add compatible string for Kobo Aura 2
Date: Sat,  4 Jun 2022 15:52:59 +0200
Message-Id: <20220604135300.568754-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220604135300.568754-1-andreas@kemnade.info>
References: <20220604135300.568754-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a compatible string for the Kobo Aura 2 eBook reader.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 08bdd30e511c..c8c1c6e54543 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -523,6 +523,7 @@ properties:
         items:
           - enum:
               - fsl,imx6sl-evk            # i.MX6 SoloLite EVK Board
+              - kobo,aura2
               - kobo,tolino-shine2hd
               - kobo,tolino-shine3
               - kobo,tolino-vision5
-- 
2.30.2

