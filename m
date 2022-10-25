Return-Path: <SRS0=jCS8=22=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A7EECDFA1
	for <soc@archiver.kernel.org>; Tue, 25 Oct 2022 14:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 203BCC433D6; Tue, 25 Oct 2022 14:59:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 811FEC433B5;
	Tue, 25 Oct 2022 14:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 811FEC433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03DCD1042;
	Tue, 25 Oct 2022 07:59:28 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 388873F71A;
	Tue, 25 Oct 2022 07:59:20 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	soc@kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: add compatible strings for Lctech Pi
Date: Tue, 25 Oct 2022 15:59:08 +0100
Message-Id: <20221025145909.2837939-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025145909.2837939-1-andre.przywara@arm.com>
References: <20221025145909.2837939-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lctech Pi F1C200s is a small development board using the Allwinner
F1C200s SoC.

Add the compatible string list to the bindings documentation.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c6e0ad7f461dd..cbdfc1c247a2b 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -366,6 +366,12 @@ properties:
           - const: lamobo,lamobo-r1
           - const: allwinner,sun7i-a20
 
+      - description: Lctech Pi F1C200s
+        items:
+          - const: lctech,pi-f1c200s
+          - const: allwinner,suniv-f1c200s
+          - const: allwinner,suniv-f1c100s
+
       - description: Libre Computer Board ALL-H3-CC H2+
         items:
           - const: libretech,all-h3-cc-h2-plus
-- 
2.25.1

