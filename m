Return-Path: <SRS0=VKAG=KI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1C6C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 May 2021 06:16:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23940613C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 May 2021 06:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23940613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZS5i6D/TmJFdwKPQwYZ/C3EhfB6l02PgMBPYNUMygGc=; b=XEBsCH9EYj2a2X9JqadDapeiRe
	P78GhoWinERJ21Gfmr8DqqI+BRDC+wybG8GHCLBT0L7+TwHR6aYyd/dxB/yjIZcUBAY2J0d9vzliO
	Vb0v8jcslnQMSbNzB7KT2NiV+xLSUHuvbLxsXAVwFNC0Qp0Yc/7DXl2xKiwq27DNLkL4YLjRfJroo
	0HzIZJTXcq0FGxiVJ1v9bfWcQJuK+eU3VqB+ga6MrZDAahMojulexbGDvPXZ/V/npiDR7pZ32IAMd
	CklKzDU3wpnmgCZU/ZBOv80tfmIxCF5EvVZ2drArqHeGyb6Zbc11mviSXmRsKEYd0NAa8egBRjoxe
	lZyqa7jQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh4bu-004rr6-NW; Thu, 13 May 2021 06:14:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh4bs-004rqw-KC
 for linux-arm-kernel@desiato.infradead.org; Thu, 13 May 2021 06:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=5MsAqf9rjFCNNwfhYudK0v6/Lwf7yjyUGC8pEH/Z8uc=; b=0PBWcVgbCPM6EVfgyFpebw58Os
 6oQKLfPZiqsLTlEgccg6ZoeyjjkIsTUNwpNTF3G6gmyonNzSLWdosq9kaAOh31yXbjEim1nyrTVec
 rGJrejpzw3Te2xZcUm7dsVYaWuSTwIPYnAIySrIdiM5b/bj2gHZkYsm7I6n3+RCyS/dlqiw89SMcy
 DeA+zhX7WquUHYJ1xgf1WkD1CIErIDVZDAMLgLUpDhwQP3s2k03s5Yb+Fw+SVtd17tqorH+rcirtw
 scVfHXPqvLzI2U6QCU6CLwQR85rufV1ZSDoSCL+ZsrVyp7MPfG0Ja7LzxnvSmJ60MDgbQFqxtBEm2
 n5bwKCeA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh4bp-00B2Yz-Ti
 for linux-arm-kernel@lists.infradead.org; Thu, 13 May 2021 06:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620886451; x=1652422451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D1JleMTnSO1ymCUdXh/+hDEDMbLr8UzAtT0hHDbs/TM=;
 b=C94nutiw2XgbuiQowzRiA6Q/xn1wkr761BR1izlG8hsfmj+nFXB7hoK8
 G2SgcWheGsaXjZt+joDaurxPod1K4ZZUGUDzrygJAyA4J4zHUQLFnBoLJ
 rlKRuxOCf8rfYEcDfZAf+O4j84XG/yUJevh4mIkhEBdj7yPg9oTDXuSGF
 f5DD5Lt8sOMMq1p9MU6vHKYkXy9RcxrwR1rvgDMr8kLbMiQ4v1OcZSVaw
 ZGUkvA7afhtHVSHgh0O718p67meyY13KMqv7zIsb+3r8De52yZF/h8rbW
 Th56PFfT9k0rMSShiMz5fgbnbQtLekxUPsOLI6yB4NpDKyPCAyKLxpjcw A==;
IronPort-SDR: k15+ZFnGZ06hmMnNi6eCmqkxd3VbO35iPqxDzc1yiAXCcPuzX3axntASUrut/nWmA14tBEUDb+
 IEvDh9swKcQoH//8FoR7201O1yBd5+BJZ4+4D11FSzuleSnoPqkXPVQIU7yPBxEVIS4YmDoLFA
 nL7Ii4bMIt5QnplTVfshBNkrdi9ktZexI/SIR4+0JfnHGPKqw+YyOiqbUUwIiZnmHjFRXUHGiX
 oGqQTFSlpH+K2ev6SLnI7iavsnE8EGRd/HpII0TgSwya0tFGXk6jGcAyMd4LmHdTOmJz+0bq38
 7Rg=
X-IronPort-AV: E=Sophos;i="5.82,296,1613458800"; d="scan'208";a="120906595"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 May 2021 23:14:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 23:14:06 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 12 May 2021 23:14:02 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <soc@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Thu, 13 May 2021 09:13:51 +0300
Message-ID: <20210513061354.138158-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_231410_014441_D909BCAC 
X-CRM114-Status: UNSURE (   6.58  )
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
Message-ID: <20210513061351.SyNR37FVrPYUEbPExxN0hplFxnrrpLphxZKZ4V6lMRY@z>

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
