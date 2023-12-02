Return-Path: <SRS0=bLPC=HN=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603BAC10DC1
	for <soc@archiver.kernel.org>; Sat,  2 Dec 2023 00:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 367F5C433CA; Sat,  2 Dec 2023 00:39:44 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18E6FC43391
	for <soc@kernel.org>; Sat,  2 Dec 2023 00:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18E6FC43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 0964A379445
	for <soc@kernel.org>; Sat,  2 Dec 2023 00:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2FaG1T4wvqL for <soc@kernel.org>;
	Sat,  2 Dec 2023 01:41:10 +0100 (CET)
Received: from werkpc.lan (87-101-2-254.dsl.cambrium.nl [87.101.2.254])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 173ED3793FF;
	Sat,  2 Dec 2023 01:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1701477663; bh=CwGWvJCzddL6gm7YQA+F+nkM3tpx9C2kBUx10w36QJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T6BoGNs88njtLz//MLdZdnVxyMDruJVgf2iNmGHbjjS1FY1+bD4byHH5NiqPq0wep
	 DiDQF4Xz7vo2Ekzn8VWlbfkEqG8pnIRVa6gzWAA0jEFtBvv3g1j+Pc8yVDaZxNm7CY
	 MTbt/VPdW4YgNWIPmH6ScQ1LYuzGKmo5cHdI0EA0=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	renze@rnplus.nl
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Asrock X570D4U board
Date: Sat,  2 Dec 2023 01:38:44 +0100
Message-ID: <20231202003908.3635695-2-renze@rnplus.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202003908.3635695-1-renze@rnplus.nl>
References: <20231202003908.3635695-1-renze@rnplus.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Asrock X570D4U compatible.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3ff8..81ed678905fa 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -36,6 +36,7 @@ properties:
               - aspeed,ast2500-evb
               - asrock,e3c246d4i-bmc
               - asrock,romed8hm3-bmc
+              - asrock,x570d4u-bmc
               - bytedance,g220a-bmc
               - facebook,cmm-bmc
               - facebook,minipack-bmc
-- 
2.43.0

