Return-Path: <SRS0=658M=7J=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3DCC76195
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 08:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D953C433EF; Fri, 17 Mar 2023 08:16:36 +0000 (UTC)
Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD54AC4339B;
	Fri, 17 Mar 2023 08:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD54AC4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4IuyNtpJI6BF3NLMqSotHmaejiL5zlvW2Pv5rd5IX1U=; b=g++679NI2ha6seLH1jXwKZVfRE
	XH8p1LQmhapAtAmiU+/ttC6kIEoy/n0B6O4GwlkNZtZ5gE51/x8TghiaLTnz71Cv+jtghvWhwnr2v
	/PnZZUChtPOckwgz19Ec8ujAtyDmBWtxCjHCcQgu8Eak3zHFQHcQ7AqVCUCACzqcvFyKwA5qjtccc
	oywHU9MtjyoeUAjWvMDqwl4/VHLoZN63g6gQBju5S0BDZSu0x68Nzybosukl+lTExBAHSB8VfwOHL
	hkLOrXh8zCj9TqjhqvVvWeYvbEfzTbNIFShLAFNmVQ/NivkUl6KdYRU2gu7/fObg4Tue2nd606CxA
	XQCvExFg==;
Received: from p200300ccff1235001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff12:3500:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1pd5GC-00073U-0C; Fri, 17 Mar 2023 09:16:24 +0100
Received: from andi by aktux with local (Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1pd5GB-00A15S-EJ; Fri, 17 Mar 2023 09:16:23 +0100
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add compatible string for Tolino Vision
Date: Fri, 17 Mar 2023 09:16:17 +0100
Message-Id: <20230317081618.2387407-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230317081618.2387407-1-andreas@kemnade.info>
References: <20230317081618.2387407-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for the Tolino Vision eBook reader.

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

