Return-Path: <SRS0=yGSj=3R=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D8CC433FE
	for <soc@archiver.kernel.org>; Thu, 17 Nov 2022 10:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64125C433B5; Thu, 17 Nov 2022 10:37:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id C127FC433D7;
	Thu, 17 Nov 2022 10:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C127FC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A17AA1477;
	Thu, 17 Nov 2022 02:37:10 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DCB73F73B;
	Thu, 17 Nov 2022 02:37:02 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bin Liu <b-liu@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 01/11] dt-bindings: usb: sunxi-musb: add F1C100s MUSB compatible string
Date: Thu, 17 Nov 2022 10:36:46 +0000
Message-Id: <20221117103656.1085840-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117103656.1085840-1-andre.przywara@arm.com>
References: <20221117103656.1085840-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Icenowy Zheng <uwu@icenowy.me>

Allwinner F1C100s has a hybrid MUSB controller between the A10 one and
the A33 one.

Add a compatible string for it.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/usb/allwinner,sun4i-a10-musb.yaml         | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
index 8992eff6ce387..f972ce976e860 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -13,10 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-musb
-      - const: allwinner,sun6i-a31-musb
-      - const: allwinner,sun8i-a33-musb
-      - const: allwinner,sun8i-h3-musb
+      - enum:
+          - allwinner,sun4i-a10-musb
+          - allwinner,sun6i-a31-musb
+          - allwinner,sun8i-a33-musb
+          - allwinner,sun8i-h3-musb
+          - allwinner,suniv-f1c100s-musb
       - items:
           - enum:
               - allwinner,sun8i-a83t-musb
-- 
2.25.1

