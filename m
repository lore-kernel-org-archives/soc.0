Return-Path: <SRS0=+GD3=KC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21E8C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 May 2021 15:29:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58A66613F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 May 2021 15:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58A66613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u02V8sDKtkV75TlgEraLkRskK+EBSZ943FrDnY5a2fs=; b=M2W7UoEkxtqTvYJ1MwZkPpuiqO
	m8i5U6/qBLmOXVmawxKCsWQwGu/vFDJXUWfFvF0NgPGIkIvRY5MGge380QtjXreHwCwuVEfvCkeUA
	8+/egHUzbsx/bN84jJcNSxOx8CXuDzMbfznJFnf2rSfjHnAtbZKnKS6lmyMAhVLBh4+mu9WWBC4C/
	QXX5DG9VniuqsCdcxB4FBk4GACpQSeKAfve9P+Ne0x3B64qMB16RjyaWr39qiQ+oSReqeIs/0AWQr
	qCtpisD0uNxjgGIe5fY2Kc3KJAOB0nolbUrNTawzK5APbXCN2KACDyZKLHDyUDCPLAnZ6cK8PqpX9
	IzUd8axA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf2O2-007PpK-4a; Fri, 07 May 2021 15:27:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf2Nz-007Pp2-O9
 for linux-arm-kernel@desiato.infradead.org; Fri, 07 May 2021 15:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=7avJpUKDQaDva4sjiE2xJ2tGq7TM8EMJzqhL0drgivg=; b=s7hioKqVblupTlPKfIWbo40OlG
 FgYHBmZwRMhzdRHX/xF2fC5SrQGhWf732C63+27wono/iB3IU7iNEkD9jCpYT3w8oclj2GcX93kJP
 8Wuww8Hiqfeac3C4zsoJV3k2R0Z4VlzDfcGyvjkjO/o5ZjpOAIfDG8g/f1nA+6AZw9P5A7cUilOp3
 MIMM7Dz2UhvKPqq/fA9ZmZT0k3uSsWgyTPurXEh7xor/PddzoZn0cpdc06GuFq1Y3lOGylCI3SFjq
 K7KNj220puf+0wyIRrjhZmdc6TBoY5KSCF0It6GtnC35Ty2KvtRuQaJdxIi4Lf7ezwXJjORQ3cGZy
 e1XMZ72w==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf2Nw-006xhp-NI
 for linux-arm-kernel@lists.infradead.org; Fri, 07 May 2021 15:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620401244; x=1651937244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pTkesFyIpyVjzbe9acZLbxNURxPk51YCjjVT18Qv9e4=;
 b=a3egG05ns4YdHdh6n3WNbjztwwgid5qUPvY4Kk9guMq2SpEpTXhFmEQz
 rVtM0K7HZoHONPOpQSooYshg2+SFjXtYScKvPn3yjeLZ2OdmwdlZB3epL
 fC7ErtproRH3YYFuCjzqly+Kxo+DCjkQRtsSR6VsskeOSc0sIlS82i3P0
 uLV7+diTQWt37b5RiZIVrbdVoT5wIcGcWt4oEM/3ibk1MhbdxrTlu7LoS
 jyLpTCBYkxtuLCiiizOqsnFwH4T/GN2gh+8KpQ2o711Uv6MoZRbHX5/Fj
 E4rh0gYEBW9oR2ihV9H0IDwj4Z8eKaI8dcOjCY0WLfglukS+AkwHw8N9q Q==;
IronPort-SDR: RAcbIj8AgNfwgWnESOIzDLR23C2fnPVbi/fLcbsqfmriWVuQr6u2h4dyO0KVEnM9T043Nyj8sX
 KFcMzU7cpMSudF+oX3MVCSpCsMHHCNiGOmV6aGgihZ6tqtKqWvFEk9aPOMpV/2kJgU5hNNqztY
 6Ns26dFGYPV+Pnyy026zTbLytbXes6W+iLJuEKJoaDP/NQepwwpkTMHdAQLI/8IE2q6pRaFusv
 gGtSjgqL9Tx5sF2v47Dp4CIOqadP6ydF14oezJi8BhtBZRqPo+EM3ikVxiRCLpt7s46rP4T4iv
 Y8M=
X-IronPort-AV: E=Sophos;i="5.82,281,1613458800"; d="scan'208";a="119335494"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 May 2021 08:27:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 7 May 2021 08:27:20 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 7 May 2021 08:27:16 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <soc@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Fri, 7 May 2021 18:26:52 +0300
Message-ID: <20210507152655.182558-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_082724_785778_7A23F79B 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210507152652.QX-xvZixKraqTNYNgGy5uELZ6kXcs9Dply7vcLjC1Ps@z>

Document the SAMA7G5 Evaluation Kit based on sama7g5 SoC.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 6fc5a22ad962..fba071b9af1d 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -145,6 +145,11 @@ properties:
           - const: atmel,sama5d4
           - const: atmel,sama5
 
+      - items:
+          - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
+          - const: microchip,sama7g5
+          - const: microchip,sama7
+
       - items:
           - enum:
               - atmel,sams70j19
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
