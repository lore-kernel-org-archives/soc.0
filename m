Return-Path: <SRS0=MX/P=5R=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A5BC5320B
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 13:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67BF6C433A1; Fri, 20 Jan 2023 13:35:10 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC712C433EF;
	Fri, 20 Jan 2023 13:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC712C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221707; x=1705757707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xibdXcyDKc5HBVbhOrjXMoYAa2ma3rLME5of97XOPQE=;
  b=OUWAoqwJpJGlZXzL3dAAd5VOkGdDuf0ZieL7S2WVizycsR7laUZjQX4Q
   WQ1+xLnCcOC6QZ6cB+oYSKCrxoE4p4rFIOGRdy+UtC1xSO9jxK3WJPysy
   LChbZjReC3w4bQjgQz9Icjq7ZC3T1d4ThpCy0WU38/+uVe4lS0G34h+vi
   xvXsP41405NHE/mLVzh9bkqkjEt8mDe1nr+ULvIAa2Y6yQoqElCD3k75V
   bqxoewaIAypxnXWKbJ3Yh/SIQX+LB1WAWUA+yseHV/LHH457WDVZpQ2hT
   u+WsXwi/chCHEJ2Cy0q5/l4Um+lhicq7i9ePOKLCK30554YQ6nr80T2Mq
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561572"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:03 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:03 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221703; x=1705757703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xibdXcyDKc5HBVbhOrjXMoYAa2ma3rLME5of97XOPQE=;
  b=F3j6U3Fd7qoGmpEPVoBwCICwTY/53l3qy0B01BhrZAEh9XLkB6sbanDe
   SxHaxgc5scQNRzbCiY+qkkILoUmwgq0HXjRy2pR3FQU3vbMoTUYs17Omm
   es3+fr2f+QOsi7qSampjFWzsXGU7E2WzeileFQu1TVOx9mXKz20xoyM/H
   kHykL0sn48oGXd4Ax0RQHoF68Ta2TDhtAM2s+NnQgxwo3Vluj5B5UttGi
   FM1l49Eik01awb5lIV9rUzG4RKt0lm01lSxf8WP+JFqWO8rjQczukqJHA
   PFhbsmmtVPDyzboShnlWxCMnQ1oOQ1AMqSqwenz33qPsNYVO7kc3EjKWM
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561571"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:03 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B1599280072;
	Fri, 20 Jan 2023 14:35:02 +0100 (CET)
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
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 01/10] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
Date: Fri, 20 Jan 2023 14:34:46 +0100
Message-Id: <20230120133455.3962413-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS102xA is a SOM family using NXP LS1021A CPU family.
MBLS102xA is an evaluation mainboard for this SOM.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved the description mentioning this is a socketable module

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

