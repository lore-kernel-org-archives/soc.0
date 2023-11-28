Return-Path: <SRS0=Yuoh=HJ=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB6FC4167B
	for <soc@archiver.kernel.org>; Tue, 28 Nov 2023 01:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76C31C433C8; Tue, 28 Nov 2023 01:32:27 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 999ECC433C7
	for <soc@kernel.org>; Tue, 28 Nov 2023 01:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 999ECC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id C690537944A
	for <soc@kernel.org>; Tue, 28 Nov 2023 01:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SK_MuGWcd4JF for <soc@kernel.org>;
	Tue, 28 Nov 2023 02:33:52 +0100 (CET)
Received: from werkpc.lan (87-101-2-254.dsl.cambrium.nl [87.101.2.254])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 437C3379439;
	Tue, 28 Nov 2023 02:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1701135230; bh=oZJLJBZAx0MsbUik85ITPZJyjd007ov2TZPI2l716ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j/MfXWJgHTh0AtXvrXLnAe1itn7cYMb7NGAh1tII1aJIEz83V2lHg+ki4glL0fRbr
	 +ANvN1kFhezYBvoJs0HOYCFs3G3sz6aeP4BbF8ooWtTdoxOdDUfhD29Yk1pRZxzAEd
	 bOrakgBLjHchm570f05dJmQ5+Ol3tE6Dr1EjAl1g=
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
	andrew@aj.id.au
Cc: Renze Nicolai <renze@rnplus.nl>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Asrock X570D4U board
Date: Tue, 28 Nov 2023 02:30:16 +0100
Message-ID: <20231128013136.2699317-2-renze@rnplus.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128013136.2699317-1-renze@rnplus.nl>
References: <20231128013136.2699317-1-renze@rnplus.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Asrock X570D4U compatible.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
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

