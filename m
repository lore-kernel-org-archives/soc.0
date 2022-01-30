Return-Path: <SRS0=FQl8=SO=nbd.name=nbd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0027AC46467
	for <soc@archiver.kernel.org>; Sun, 30 Jan 2022 14:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF4F0C340E4; Sun, 30 Jan 2022 14:51:38 +0000 (UTC)
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABC4BC340F6;
	Sun, 30 Jan 2022 14:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ABC4BC340F6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=nbd.name
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zuMwAtKwAKhJ6tXZBjnRsIGNnEtjFz5TcgOQeseaIuU=; b=TpGpl+qIhYbRJ8YgeIL99jdLaD
	978oeCUO2qrlfL0ky06yQ84S2IpANUgN+pSAclofFi06hZc8MwPO0SUCtyVA4O275Ikc9VKmWK/jj
	0asZ+KNcWbihH9xgs4JY57P521xgy5OFopVSVynroTkJArMX5uQ0J9vWEjDOrT+xqfgY=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1nEBY5-0002if-Do; Sun, 30 Jan 2022 15:51:25 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	john@phrozen.org,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 01/13] dt-bindings: Add vendor prefix for Airoha
Date: Sun, 30 Jan 2022 15:51:04 +0100
Message-Id: <20220130145116.88406-2-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Crispin <john@phrozen.org>

Add vendor prefix "airoha" for Airoha, a subsidiary of MediaTek

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Bert Vermeulen <bert@biot.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index eb8ab0d82198..d2f9fd7654bc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -59,6 +59,8 @@ patternProperties:
     description: Aeroflex Gaisler AB
   "^aesop,.*":
     description: AESOP Embedded Forum
+  "^airoha,.*":
+    description: Airoha
   "^al,.*":
     description: Annapurna Labs
   "^alcatel,.*":
-- 
2.32.0 (Apple Git-132)

