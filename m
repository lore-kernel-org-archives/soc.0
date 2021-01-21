Return-Path: <SRS0=ZEVb=GY=v3.sk=lkundrak@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20FDC433E6
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 03:41:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 94D822389E; Thu, 21 Jan 2021 03:41:38 +0000 (UTC)
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A7B82388E;
	Thu, 21 Jan 2021 03:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A7B82388E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lkundrak@v3.sk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id D8528DF892;
	Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id TV5t0yC6OOVg; Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 03B79DF8E6;
	Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zZr-gO1SsUBE; Thu, 21 Jan 2021 03:37:38 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
	by zimbra.v3.sk (Postfix) with ESMTPSA id 6484EDF892;
	Thu, 21 Jan 2021 03:37:38 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	SoC Team <soc@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 01/12] dt-bindings: gpio: mrvl-gpio: Fix the gpio-ranges property
Date: Thu, 21 Jan 2021 04:41:19 +0100
Message-Id: <20210121034130.1381872-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The property specifies a list of GPIO-capable pins. Don't limit it to a
single element as there's  presumably more than one GPIO pin.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Docu=
mentation/devicetree/bindings/gpio/mrvl-gpio.yaml
index 4db3b8a3332c2..9cf6137dd5241 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
@@ -82,8 +82,7 @@ properties:
   '#gpio-cells':
     const: 2
=20
-  gpio-ranges:
-    maxItems: 1
+  gpio-ranges: true
=20
   interrupts: true
=20
--=20
2.29.2

