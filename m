Return-Path: <SRS0=0ZpT=GX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469DAC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6B4B2343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6B4B2343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cwz5Y+rriyqGUBbAOPx3PZmynLyoQaeiouQxhvGdm0o=; b=VjdLBVFDNFCmY1gXqqA1mxJ+s
	xSKQ/imw/fuW2FnMjOYJeJI3W1s1UV7c6li0HyuaVVbDPFaNx21G1IctAuC6N07f8VH3ZuWiUC8Fu
	g+eTqcrAl00DAOVzbLwqmyJpmIZRZ0WmCqv3k0iE5C7t0ZjN4t+bx3HyEvZsN/Pyct0zemmBlm+mT
	6Ta6+2c6NPE/OdfrFEm9fQm3TIdmUsF6iUhH0qb4k3LI2uZ7Z6KwMWYY5GXjTHKASQLSuULnIr02y
	I0U8pMEsRksl9UAMlu7yuM33V7YMuvA/9mQVyzTy2+v2f95dhce1HPUANKAFWL56dhRsIChhsNokN
	vlb89nvGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2JLb-0006kj-M6; Wed, 20 Jan 2021 19:40:55 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2JLT-0006iJ-DU
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Jan 2021 19:40:48 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8EE9322802;
 Wed, 20 Jan 2021 20:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611171646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3A2yLeqNx7Ab1FkbcdckJJlh8tEYM/0x+XqT+BMUNkw=;
 b=DV9HPq1riH71TnTAHwvL9QeeeRVEZQCFeXiZ5KpNUHAvNpBhcLIsdxBxdeKQaC3HuyXyM+
 tVS1kP8+vG5nQ5sgQe8Y+WXV1ALPxlbTHEYB8K9bG/nPTeEl52NQ32bOqopY6nt2pXwpmw
 525c2CV+TflHAlG7DDUTme6f1PoKGdA=
From: Michael Walle <michael@walle.cc>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: add ebang vendor prefix
Date: Wed, 20 Jan 2021 20:40:31 +0100
Message-ID: <20210120194033.26970-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210120194033.26970-1-michael@walle.cc>
References: <20210120194033.26970-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_144047_608898_0AECF87E 
X-CRM114-Status: GOOD (  11.95  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>,
 Michal Simek <michal.simek@xilinx.com>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210120194031.yWfkMNe3hgo3F4vFgeD0UhVLTNErKwNQ_-EXMkf3FYg@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
