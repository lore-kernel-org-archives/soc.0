Return-Path: <SRS0=j0A+=3F=bewilderbeest.net=zev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B07C433FE
	for <soc@archiver.kernel.org>; Sat,  5 Nov 2022 01:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7C68C433D6; Sat,  5 Nov 2022 01:33:38 +0000 (UTC)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C2C4C433D7;
	Sat,  5 Nov 2022 01:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C2C4C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EBDE491A;
	Fri,  4 Nov 2022 18:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667612009;
	bh=havEPQ5Zc7FUigJMnjIkknNS7EN8eM/Wdjj1wV/opao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CGBMyJP9v0UTGEWC6qTVqeU1LgFCjmouzNrHdBYlgpcVCkbKiPRdtTVQTVkbJHMy5
	 kjOrik6cieDTnTheOMWYQ6tDDTnVDnZP2fXTUoQjmFAgn2ZY4RvTim1JaBNYwVKoj1
	 XmS1QEOt2YpdzsFhD2AKg2p/QHpmgiuWO1MkCtrs=
From: Zev Weiss <zev@bewilderbeest.net>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	soc@kernel.org
Cc: Zev Weiss <zev@bewilderbeest.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
Date: Fri,  4 Nov 2022 18:33:20 -0700
Message-Id: <20221105013321.2719-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221105013321.2719-1-zev@bewilderbeest.net>
References: <20221105013321.2719-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Delta AHE-50DC BMC board compatible.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 217a1d674863..272626937ecd 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -17,6 +17,7 @@ properties:
       - description: AST2400 based boards
         items:
           - enum:
+              - delta,ahe50dc-bmc
               - facebook,galaxy100-bmc
               - facebook,wedge100-bmc
               - facebook,wedge40-bmc
-- 
2.38.1

