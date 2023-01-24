Return-Path: <SRS0=Qc4v=5V=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEB4C25B4E
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 11:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BB67C433A4; Tue, 24 Jan 2023 11:02:24 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 733B5C433D2;
	Tue, 24 Jan 2023 11:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 733B5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558141; x=1706094141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fSfwPgEMSrPA0W9QIT6UX0FJsOwhXbijwR82Z3R/5VI=;
  b=H9jrYthdXetybXA9+UVbT49VLZDlsvrI+/mvaMhvvu9obtlXTwqcXoCy
   ez4Q/EGNO+amaLgqzdXnUnAqO1KWN/iktZMNBC3ljnzAuPc015aYMZYwa
   Tm0OcsN7mCw1XHQajngAfckctfgDkgistBdDBOS5TzrR0XDF3013ikkSw
   NkW4AvmEhw6cTSLBMviyulkOtLMCpJkJ0WnKmnl+P/QNoxLs+Bl2veLhe
   49KgZ3RS+0aWT7zRxD/r7FbLohoHj3unDu5zgWo/xcqNgtjALngNI6MYQ
   WyMBX088ExCQ2dPj9lGbBzUrMTeqS0tE9oBq6Zx4m/SVsmozW2uJTwqEn
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616610"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:17 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:17 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558137; x=1706094137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fSfwPgEMSrPA0W9QIT6UX0FJsOwhXbijwR82Z3R/5VI=;
  b=d0gANoG+xKmY7s4fVw1q1MeLmjyWI8pa30IcUZotENHJIiZJ6BqbMO1+
   vsr6fC8KP1CRQv3R9IPmCJJqTlsNHKg/1Bej1tOazBqh7HuhDfit/RxgU
   Bqnvu6L9hrrcXhwO4RLpd/x2WLQdfLcXu6n3lq4fVB8xlLCzbZYFTUD5j
   9zd0yngVtdtmosxEM7Ggzh9ZVwU890qqeJx4+nvpAgwF9RpGcLYogwNk3
   wHZMnTpX/nVZfOVlZcmD3BjDZPrBOF5z9ErIjXUXC5jBu2rDdEPuOuQXZ
   dS5vTlrBKVczxC44+7zz5brxslmHOuLnsE7GDLcQNB0+oasho3l7ht2XF
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616609"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5C2B2280072;
	Tue, 24 Jan 2023 12:02:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/10] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
Date: Tue, 24 Jan 2023 12:02:04 +0100
Message-Id: <20230124110213.3221264-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS102xA is a SOM family using NXP LS1021A CPU family.
MBLS102xA is an evaluation mainboard for this SOM.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
* Added Krzysztof's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 3ba354578e8f9..489d350c3bbbe 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1164,6 +1164,16 @@ properties:
               - fsl,ls1021a-twr
           - const: fsl,ls1021a
 
+      - description:
+          TQ-Systems TQMLS102xA is a series of socketable SOM featuring
+          LS102x system-on-chip variants. MBLS102xA mainboard can be used as
+          starterkit.
+        items:
+          - enum:
+              - tq,ls1021a-tqmls1021a-mbls102xa
+          - const: tq,ls1021a-tqmls1021a
+          - const: fsl,ls1021a
+
       - description: LS1028A based Boards
         items:
           - enum:
-- 
2.34.1

