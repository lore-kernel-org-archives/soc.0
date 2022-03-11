Return-Path: <SRS0=Xlam=TW=fw-web.de=linux@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E01C433F5
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 21:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18F0EC340E9; Fri, 11 Mar 2022 21:04:37 +0000 (UTC)
Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A533C340EC;
	Fri, 11 Mar 2022 21:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A533C340EC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id C8E3C10094E;
	Fri, 11 Mar 2022 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1647032665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzUpAU2rIj4MneApxcGOMZkO1oQVZIG7wDHq0O5jdws=;
	b=ZZb0pptTkqL/70UKGUTNRJHridSGTKhiZir/Aeqv7psFkZ8D30xO2Sj0P+n6uHVE7y3EE7
	+Vna7IZjIQrbOnFmY9BLo8IoHbO+uO1dFlo63gkal+xXZdtM+QGI9N6evNyRmdolqhHPTd
	/HXu8+QO0VhYzOjDYEHGzeYHA3nVb2I=
Received: from localhost.localdomain (fttx-pool-217.61.144.196.bambit.de [217.61.144.196])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id B4DBD402CA;
	Fri, 11 Mar 2022 21:04:23 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v6 4/6] dt-bindings: ata: ahci-platform: Add power-domains property
Date: Fri, 11 Mar 2022 22:03:55 +0100
Message-Id: <20220311210357.222830-5-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311210357.222830-1-linux@fw-web.de>
References: <20220311210357.222830-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 6845e91d-5aad-440f-94ee-4fd891871427

From: Frank Wunderlich <frank-w@public-files.de>

Some SoC using power-domains property so add it here

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
changes in v5: added reviewed by
changes in v4: none
changes in v3:
  - new patch
---
 Documentation/devicetree/bindings/ata/ahci-platform.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.yaml b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
index e71bfb04d7f1..a02f6d12773e 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.yaml
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.yaml
@@ -108,6 +108,9 @@ properties:
       some embedded SoCs.
     maximum: 0x1f
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
-- 
2.25.1

