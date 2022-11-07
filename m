Return-Path: <SRS0=lTMw=3H=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C877C433FE
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 10:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34EF9C433D6; Mon,  7 Nov 2022 10:34:22 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 227A5C43470;
	Mon,  7 Nov 2022 10:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 227A5C43470
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 07 Nov 2022 19:34:17 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 439572059027;
	Mon,  7 Nov 2022 19:34:17 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 7 Nov 2022 19:34:17 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id BACA5B62A4;
	Mon,  7 Nov 2022 19:34:16 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/5] dt-bindings: arm: uniphier: Add NX1 boards
Date: Mon,  7 Nov 2022 19:34:09 +0900
Message-Id: <20221107103410.3443-5-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
References: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for NX1 SoM board, evaluation board, and reference
board support.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/socionext/uniphier.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
index c2cea1c90f3c..eb4401067683 100644
--- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
@@ -66,5 +66,12 @@ properties:
           - enum:
               - socionext,uniphier-pxs3-ref
           - const: socionext,uniphier-pxs3
+      - description: NX1 SoC boards
+        items:
+          - enum:
+              - socionext,uniphier-nx1-evb
+              - socionext,uniphier-nx1-ref
+              - socionext,uniphier-nx1-som
+          - const: socionext,uniphier-nx1
 
 additionalProperties: true
-- 
2.25.1

