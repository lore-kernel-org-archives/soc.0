Return-Path: <SRS0=rvNc=5Q=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF4EC00A5A
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 14:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53B94C43392; Thu, 19 Jan 2023 14:42:53 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 428EAC433EF;
	Thu, 19 Jan 2023 14:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 428EAC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674139370; x=1705675370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MxvAgWwx3j8bs/X7hks889d23qZmaIa2T4rMGUUlcGE=;
  b=Zl2CkrMu6MwisBsELv+eFPvM2lWI/+9rnFiJ9+N2rks92a8BHjaRgf4K
   RKsif2yHvLRhrjfNPekdjJJ+/qtTMjOlyOd2cd/Lz7Rgd73xeLUVA2stt
   BVvzXXJ2A0fngqhkewX7FC70369O8PWc3F02OnE0gjbV0w0A9I6STSiJS
   anHpMYSkEaS1uRGW0TdHWjBh7nDFX/mKW3iLOYwLKyyKPKVZMr3tXrRGV
   M99BJi12t36TRk8asVz0qsvZFy0Q+GM+DBMeY6rL67L4DQ0WfcCd5lPKU
   Z7x6oEyWEyyNEnRLwxyWHE5f89G7MC4nNiJYUZbBSzPsaTXxTxpmqXAns
   w==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28537302"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 15:42:43 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 19 Jan 2023 15:42:43 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 15:42:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674139363; x=1705675363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MxvAgWwx3j8bs/X7hks889d23qZmaIa2T4rMGUUlcGE=;
  b=aSTjBsEtY/VD7iKipXUekoChgXfUDK04nhTpZqbVujOTk0YEil3TsogR
   Q1VZOvI6SQg8SDxwa6FXjS6xjS0jrthRb3fWtBhGtuys3WnxI+syCNOLR
   MMSYGIlpmCsb5lSDHuCsh4A1Lc29gxPryHXTfafranMkuQXzPd5+voACU
   BarJGnQOBky/z/loXrdx+NJ/05yaoGNsu30K1+x4g+8bd/eRn4j1f3McO
   cZi+kgkL5hTNw1Sbt5G1j8rdxf/kvAEj0AUY+pnWJiL7ysW/ANDyZhXar
   3VgTdxXq0ZlqViHS+7vcpOzk3/Xvo+7Ob7i54yhxwLOwFqeeq0G0F4GX9
   A==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28537300"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2023 15:42:43 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 34949280072;
	Thu, 19 Jan 2023 15:42:43 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/9] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
Date: Thu, 19 Jan 2023 15:42:28 +0100
Message-Id: <20230119144236.3541751-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS102xA is a SOM family using NXP LS1021A CPU family.
MBLS102xA is an evaluation mainbord for this SOM.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 3ba354578e8f9..b54a920934c9d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1164,6 +1164,13 @@ properties:
               - fsl,ls1021a-twr
           - const: fsl,ls1021a
 
+      - description: TQ-Systems TQMLS1021A SoM on MBLS102xA board
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

