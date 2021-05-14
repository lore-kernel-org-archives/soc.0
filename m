Return-Path: <SRS0=3VtK=KJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF47CC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 May 2021 08:24:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F266A61454
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 May 2021 08:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F266A61454
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZS5i6D/TmJFdwKPQwYZ/C3EhfB6l02PgMBPYNUMygGc=; b=rI88UJmOni745tThPRpss9WCkX
	nqg7tXMelWrJuTPIZCIZ0VDb/ONxtXptUyPgskp6D2V5SIuYVUacmjJb0Cx9dnYxJArWlc6F9RYAT
	ORCqMfss3IQHvTHu12HTT7/ZaWdQ7OUiKQh2hTlFElCU+JrR76OqYbKP6qZ+c6EtlptOu3CW+TQgX
	ayAyy0FWfOxtVO3CwECMOyL9NcckV/yk0jtLiUx/laOH+SuY1r+WTO0pjH0x1+Hrkc93dm95kNZMb
	shMprv1/ucUW30yurG1URclO57IzktodVhOI3ijL9nAtTh2MY75YfOBZpbJv+ZEwlGYy/VAx7lVpC
	Mx3AkZgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhT62-007Tnl-RW; Fri, 14 May 2021 08:22:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhT5w-007TmL-LT
 for linux-arm-kernel@desiato.infradead.org; Fri, 14 May 2021 08:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=5MsAqf9rjFCNNwfhYudK0v6/Lwf7yjyUGC8pEH/Z8uc=; b=5CpOCpyIDjnehMxjC3KPZeJL6N
 VAVC7Xnaq0oj47/gxVUm24AqoTe/ujhSfMYaNRYGgzmvLMMF+Za3m2qohXrLCCmRCwcBXJ0DxwXeA
 dm9CdL9FuR10mF/O4gEqPH3awBB9YeP0O/8ruRZMqIdfIl4ZtWT79Ot+JVvDNSjYf/ksYEfKPskeE
 Czn0Cni1FzonE55oXNeTsXDRI+YSWe1nKHzcqewwKitYtzESI9qNWkqh1Dl+PcMINk/QWe0T2hzKS
 NrZkTuH5qVxjx/As2d8X2Kk+s3zn6SO4pkTA4YmJROZZ1L5N6fkP3TR/xg/lSlV3AjdDCSsg++dOE
 HdFUj5FA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhT5u-00BoTx-66
 for linux-arm-kernel@lists.infradead.org; Fri, 14 May 2021 08:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620980569; x=1652516569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D1JleMTnSO1ymCUdXh/+hDEDMbLr8UzAtT0hHDbs/TM=;
 b=GAKY9y41m/6ePYE5vbAUzx7H07TYn/AL5xeYLLUEjD7qFRiZtqG1xBgC
 tjr4xXddZBu6xTjUNUt+Y9jlYakoOA6OI22MCin/332WIkD2RRx4QiXWO
 1VS/ucbcF1jiG6n3tXwwPelt4H5D+tNn9ttTMO4JrNMB3+VtG8LILua8O
 FkG2FelgepRf//n0ZqPGZF9HDcRUn12F3xKToYPdIn6fmeOr+Fzg23ocy
 lCNzlUIIaErTM0ajb1NjTiXdFHUwXlAMIhp0IzM95pn7nrRpK9aAgtwxK
 Jko7u3K7bH/VMqBS9WxGaXrUao+GIrzSsGP6KwBb706x/YIwbWc8Nk921 A==;
IronPort-SDR: vrn929UhSWLJK1sTs+1BY/s6IU0eQoyieGhDAPPIHf6Oc/AhXwRQDTyHZBy+Sr2QJTBXv3OP9h
 n3LPeiSYUglTw6SUUss9DGU4f25DwZ8l0+NlvobTtnWOQ05hPv1D+upBO8GVFzNJ6JIIwy6ul1
 4bUW94fksKKoMQc15Ko36ANlVDQuqmWpR5tzySYiPIY60HeM9A/lO77OxLPwapoHyyAYub5kv5
 tVhEJVAC3D2wLO9jTnYCkaCVSumfMtSjw3cAG/waJmChOShLpW5Y3aORd49sjnsCBQvms2f+/9
 Cbw=
X-IronPort-AV: E=Sophos;i="5.82,299,1613458800"; d="scan'208";a="128041994"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 May 2021 01:22:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 01:22:47 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 14 May 2021 01:22:44 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <soc@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>,
 <tudor.ambarus@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Fri, 14 May 2021 11:21:48 +0300
Message-ID: <20210514082151.178571-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_012250_251848_56AB6D1B 
X-CRM114-Status: UNSURE (   6.43  )
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
Message-ID: <20210514082148.FCmqAv0GYcZeVLo49NmD8i5SLrZWPFqm6pqYnKMbN6M@z>

Document the SAMA7G5 Evaluation Kit based on sama7g5 SoC.

Acked-by: Rob Herring <robh@kernel.org>
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
