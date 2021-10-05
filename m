Return-Path: <SRS0=yos0=OZ=z3ntu.xyz=luca@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132C4C433F5
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 20:29:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EC434617E4; Tue,  5 Oct 2021 20:29:18 +0000 (UTC)
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CBA61131;
	Tue,  5 Oct 2021 20:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83CBA61131
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
	by mail.z3ntu.xyz (Postfix) with ESMTPSA id B15B8C9158;
	Tue,  5 Oct 2021 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
	t=1633465757; bh=frxoBNTsUZRbITBdNSe5aGy6uhU1HOv6AQ3q+VXoaXA=;
	h=From:To:Cc:Subject:Date;
	b=X0ujESeE0xHg0RTUID+yhgBnuvIcoCWFv5zHu3Ga9cnC9+IrR8fe/7NIxT/qlysZ1
	 /a5cS2myucCbWz3BV7KZ+TNYVm/1NmlJ4XszrKcbFultyujpeeTM6sQryoKME1NjNW
	 z2hLdL3vIpj7x8Nv0/La3dMbBIHDTYLcRdkJin0s=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Arnd Bergmann <arnd@arndb.de>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: Add MT6589 Fairphone 1
Date: Tue,  5 Oct 2021 22:28:30 +0200
Message-Id: <20211005202833.96526-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for Fairphone 1 smartphone with MT6589 SoC.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 80a05f6fee85..0fa55497b96f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -32,6 +32,7 @@ properties:
           - const: mediatek,mt6580
       - items:
           - enum:
+              - fairphone,fp1
               - mundoreader,bq-aquaris5
           - const: mediatek,mt6589
       - items:
-- 
2.33.0

