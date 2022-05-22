Return-Path: <SRS0=t/jJ=V6=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B486C433F5
	for <soc@archiver.kernel.org>; Sun, 22 May 2022 21:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CB7EC34117; Sun, 22 May 2022 21:44:37 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11590C34115;
	Sun, 22 May 2022 21:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11590C34115
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8+g7qPAJf6CMj00K5u9BtRrRXZlFNbx8TAq+uZW4obE=; b=fn+vsJDXQ6MVTsUSnUNsAYhxKC
	OsvEsyS+ojj5R0GH3aQjDToRJkBzeXRiPi6botVTb8tynt+50KaqqOEyy529iK1nYA4NaYUkmtpXR
	vys/uS5qpF3HWWAuJfpx1onSSf00Tou67W/BXFiCEvYC0rYXWpox4Zr6RUZvbT2SCYPI=;
Received: from p200300ccff4f2e001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff4f:2e00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1nstNA-0007GE-No; Sun, 22 May 2022 23:44:24 +0200
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1nstNA-0014L7-6v; Sun, 22 May 2022 23:44:24 +0200
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
	alexander.stein@ew.tq-group.com,
	marcel.ziswiler@toradex.com,
	linux@rempel-privat.de,
	andreas@kemnade.info,
	matthias.schiffer@ew.tq-group.com,
	cniedermaier@dh-electronics.com,
	sebastian.reichel@collabora.com,
	leoyang.li@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nicolecrivain@gmail.com
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add compatible string for Kobo Aura 2
Date: Sun, 22 May 2022 23:44:14 +0200
Message-Id: <20220522214415.254959-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220522214415.254959-1-andreas@kemnade.info>
References: <20220522214415.254959-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a compatible string for the Kobo Aura 2 eBook reader.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
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

