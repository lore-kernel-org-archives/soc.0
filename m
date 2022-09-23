Return-Path: <SRS0=Vr61=Z2=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA4BC07E9D
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 22:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45DE8C433D6; Fri, 23 Sep 2022 22:11:31 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8C7CC433C1;
	Fri, 23 Sep 2022 22:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8C7CC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pS74WwurnFXgea5j4m9IeYCBGZWvGqaiJv/a7MKUJMY=; b=xr5wCoH0pl7kGbvh5DTkn3+BAm
	7UJXu2Pk0zMIJpTo4Rx4N68cyDd0KL6GANsHz/oC9z/qcDTs5UuiGV23ePrT1WUw90FmllLtHjEvS
	dIksjRKuFcQui+3+8PyI67cHHvJS+5UsIHBbR2HK4NHBnFqVfc7emdd9KJFoN679twkcroSF4/IoK
	VPcgDwx8JIsCk6YRE+2omEVMWJPkOn1qMoqaOmVKuZ6NYDgekxXtr5OC9h1v27mbJO6BV1Q24ocdc
	Pol/tDiRrp9GynMXfasBpaMcc5tH5D5RATnDnDFtk1HoTyIuobNbXDXNlSF5KVSrKuPvc9e7Mp1kC
	9txuyn9A==;
Received: from p200300ccff0974001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff09:7400:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1obqtD-0004K6-Ef; Sat, 24 Sep 2022 00:11:19 +0200
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1obqtC-0070or-Vs; Sat, 24 Sep 2022 00:11:18 +0200
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
	marcel.ziswiler@toradex.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nicolecrivain@gmail.com,
	m.felsch@pengutronix.de
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add compatible string for Kobo Aura 2
Date: Sat, 24 Sep 2022 00:11:11 +0200
Message-Id: <20220923221112.1671392-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220923221112.1671392-1-andreas@kemnade.info>
References: <20220923221112.1671392-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a compatible string for the Kobo Aura 2 eBook reader.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7431579ab0e8..fd2a5732f755 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -520,6 +520,7 @@ properties:
         items:
           - enum:
               - fsl,imx6sl-evk            # i.MX6 SoloLite EVK Board
+              - kobo,aura2
               - kobo,tolino-shine2hd
               - kobo,tolino-shine3
               - kobo,tolino-vision5
-- 
2.30.2

