Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E480AC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5C5E6112F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5C5E6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edOJvsFbEV2ofXn6fkFFHIR9F0NxW5DJKj95A6Wtbeo=; b=H6dbEXIUAI9toz
	XbI2NrNriB6FLiY2mMV3TdVnO+f/wWDkohPv69RLpG+qhqA5rZEF6LmUOWU8X9u2utDpF7He9ty64
	FFBiDxsf6l/L8KCKnnW3HEESzthMxhZG+PujWNjhL1HQBHybSEyrT+5soY2P+buymhRzDKf0UEHX8
	2EDhil85OAUcIYZ4GWIe4aMmgYgq5QIAHluWgWdueVueVnBoApJuHsk6mTRnyOCDWp3mk0K1vkCAD
	7obDNMpKeD6L0ROTF6aejIZHZhYxoGQkpSZ2SCtNASPjSk/0WH8ViN6Y5VIBmfEQZCSMe4WFHibfd
	x9LoxleiJi67t83JFEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfjw-00A8nh-MD; Thu, 05 Aug 2021 15:57:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfjs-00A8mb-Fk
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 15:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628179016; x=1659715016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ba3PMiW36nZ+DW3AnbgSVLgStmXrbfUqHhLyUQwshzg=;
 b=pupGa8/XUcj02aFqAYUNHPFdTNdZfqFw2pd1Q0yJRUYeKfgKCaiFghsz
 y/Q1VFcirT+3adfGadaVTGrHesy2BZ4gnDtCEfu950Gnvhby6s/9lu20o
 hCCsk0gcCHsOBNq9jYVq192+mX+LnWBDCOoOyH1g2VdTIXt9vvZGy9iIK
 IVjlaLWAErUqy/TJ+ei3l4XaTA12lQ4h0V8Wb2tfWSGrkmJfyLhLUJrqq
 gDy6ZuIu9TUOLt6sIRD6waO4LCJYF/dhKK53S/7mCgrCOAOtNy7INifDP
 Sw9+3eiJ6sXeoyj8sB9+S7NN2UU5KywQnvOV516laBcO+ZawS9RVAYQtl A==;
IronPort-SDR: smDePm7d2kBBMXYpxVzF4KURZX+MRqBWV9nvdX7urDDOe1i9XVGnpG5DETiyH4tNGQwStfeTdJ
 2iuGCVs1A0Bwjoq8xcusoA04aGQlTz/H81icsuECqVqiA6W1eZjFn3sDfy6VkYqLo2Lz8Vt+Bv
 j/ZtVjEZ0B4A11Vg7aDH/SGboGbnFQ0bH8HCsDa+5zFUx9Alnm19Kb9b+cCrgUh1An92Y3IsLq
 E6bBOY9wyzc4q5Vghd1OCV0U1638QVwIaIPAYu6s3wgSopk5jkVhpmII/VqDVOP5bX5tr5t/ZD
 1z06RoOqasVl/MHEsS/0NE3N
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="124734202"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2021 08:56:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:56:54 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:56:32 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 3/7] dt-bindings: ARM: at91: document exegin q5xr5 board
Date: Thu, 5 Aug 2021 18:53:53 +0300
Message-ID: <20210805155357.594414-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_085656_737997_6C9DC4A0 
X-CRM114-Status: UNSURE (   6.68  )
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
Message-ID: <20210805155353.kMZhSmnE1PCr39pVUpDACNyc6VnLJUt8Q848pWSXG2Q@z>

Document Exegin Q5xR5 board.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index fba071b9af1d..a9ab18510fef 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -126,6 +126,12 @@ properties:
           - const: atmel,sama5d3
           - const: atmel,sama5
 
+      - description: CalAmp LMU5000 board
+        items:
+          - const: calamp,lmu5000
+          - const: atmel,at91sam9g20
+          - const: atmel,at91sam9
+
       - items:
           - enum:
               - atmel,sama5d31
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
