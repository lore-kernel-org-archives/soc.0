Return-Path: <SRS0=HjUL=GX=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0324C433E0
	for <soc@archiver.kernel.org>; Wed, 20 Jan 2021 19:40:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8D07F2343F; Wed, 20 Jan 2021 19:40:48 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD9B233FC;
	Wed, 20 Jan 2021 19:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD9B233FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=michael@walle.cc
Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 8EE9322802;
	Wed, 20 Jan 2021 20:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1611171646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3A2yLeqNx7Ab1FkbcdckJJlh8tEYM/0x+XqT+BMUNkw=;
	b=DV9HPq1riH71TnTAHwvL9QeeeRVEZQCFeXiZ5KpNUHAvNpBhcLIsdxBxdeKQaC3HuyXyM+
	tVS1kP8+vG5nQ5sgQe8Y+WXV1ALPxlbTHEYB8K9bG/nPTeEl52NQ32bOqopY6nt2pXwpmw
	525c2CV+TflHAlG7DDUTme6f1PoKGdA=
From: Michael Walle <michael@walle.cc>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH 1/3] dt-bindings: add ebang vendor prefix
Date: Wed, 20 Jan 2021 20:40:31 +0100
Message-Id: <20210120194033.26970-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210120194033.26970-1-michael@walle.cc>
References: <20210120194033.26970-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Zhejiang Ebang Communication Co., Ltd.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e8c773478f54..f23ea04e0a86 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -311,6 +311,8 @@ patternProperties:
     description: Dyna-Image
   "^ea,.*":
     description: Embedded Artists AB
+  "^ebang,.*":
+    description: Zhejiang Ebang Communication Co., Ltd
   "^ebs-systart,.*":
     description: EBS-SYSTART GmbH
   "^ebv,.*":
-- 
2.20.1

