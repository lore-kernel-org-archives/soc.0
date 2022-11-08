Return-Path: <SRS0=dEvG=3I=bewilderbeest.net=zev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD22C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 00:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BA14C43470; Tue,  8 Nov 2022 00:16:08 +0000 (UTC)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FA1BC43144;
	Tue,  8 Nov 2022 00:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6FA1BC43144
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 97623AF1;
	Mon,  7 Nov 2022 16:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667866561;
	bh=ZjsD8nI1qO+JoTRJ1p3i2ieIeCPVFjtYFXk7nf3JSzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ojQK+ZEu8eAXHGLz+2jfi52pp0neZF8/+ypdSPOYFHpqFdGloo5WDZ4k0alAsWbCT
	 9ksqmis24Bq4oC8dl274h/te1B1cePOvHAnvzrht+6BtbPeyWWw9Ru7QT30KuAiAsy
	 A0SPYnViNA1FB4yCI4pQaKSbP5TBesolbwvZadtc=
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
	openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
Date: Mon,  7 Nov 2022 16:15:50 -0800
Message-Id: <20221108001551.18175-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221108001551.18175-1-zev@bewilderbeest.net>
References: <20221108001551.18175-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Delta AHE-50DC BMC board compatible.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

