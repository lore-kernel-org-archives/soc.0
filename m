Return-Path: <SRS0=L7O9=7E=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA717C6FA99
	for <soc@archiver.kernel.org>; Sun, 12 Mar 2023 20:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F3C7C433A0; Sun, 12 Mar 2023 20:52:58 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E16C0C433EF;
	Sun, 12 Mar 2023 20:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E16C0C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vlevqCiURsW178TvumjMuvflR7nEe2fWIJW6Lvp0uPM=; b=nzaloXY0q23xB6ECeTuRpLKrcr
	UkKwTSloXjKQuQcDtxfvj11lCzJGBR7CCSDcbvh7MIVjTYvMZY79pIHLF61qwnBUA+ChF9wAKaKnB
	5skwgYj9x10pDn4lld0xqbrV5iWDn7T0RmFHBs8u3PAGSQCeqN2TqWnWtMMoFK1V4xjotjwpFOElp
	XAe/tmFpNombd+b3BSI9v9voEn/VcShxrNqOqGAtSyGxRjGHxsvx3htn+oHwj8tq44/T8s4hKTpDr
	2eNlr3Jemj/6grgD8YG4wnjMuGScA9pZn2mgKtGiXfx5m48jB6gqfv/48xrnxGz5X3Gj4G/n5Hgb5
	N3SbPWEw==;
Received: from p200300ccff059e001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff05:9e00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1pbSgL-0003yw-Uh; Sun, 12 Mar 2023 21:52:42 +0100
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1pbSgL-009ZWk-ES; Sun, 12 Mar 2023 21:52:41 +0100
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
	marex@denx.de,
	max.krummenacher@toradex.com,
	leoyang.li@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add compatible string for Tolino Vision
Date: Sun, 12 Mar 2023 21:52:35 +0100
Message-Id: <20230312205236.2281466-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230312205236.2281466-1-andreas@kemnade.info>
References: <20230312205236.2281466-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a compatible string for the Tolino Vision eBook reader.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 442ce8f4d675..b78b7fc285e6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -581,6 +581,7 @@ properties:
               - kobo,aura2
               - kobo,tolino-shine2hd
               - kobo,tolino-shine3
+              - kobo,tolino-vision
               - kobo,tolino-vision5
               - revotics,imx6sl-warp      # Revotics WaRP Board
           - const: fsl,imx6sl
-- 
2.30.2

