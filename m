Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9B3C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:59:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D486112F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9D486112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mXM7SWE2XqjuYfsOM6TjVlPrLra0WVskFAAUFRilVA=; b=i137RLDpgYSR3m
	OKsOC7Kp0XpYwAcPOcU8zXWINntIchpj8Jlj0IwrtWgdC5TjmD20dGTDDDTvfzGjjbDP3uCu+I+fT
	cQhuS1cWqzbljcJc8oemdJVTf6UVEKcyi8kTnFtKiIZzbOZJXaQAyU+Dt1K/NdAPIMqG7b5+7q7WV
	iVApXp1jYc3gbDk2CbKzdppnQoegzqg2YGVATdsE9gkmnIFuNwXB579AbjLqTdx7zE80PFsQXaxHc
	202b6/00BO6fz/QpipmVDC2CDRwWFWPgh5fzhJWjqQMlNKSq9y1MhUe5IAGKDJs2yrub3ffS492yI
	SmmWmlsqj0bIpQcwFTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfku-00A9mo-WC; Thu, 05 Aug 2021 15:58:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfkR-00A9Iy-PM
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 15:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628179052; x=1659715052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u/FP3J42Jj1CUvIWoJWdIAW76KXzDQA0eBIvNVlOqIE=;
 b=XKkrp5ypFIR33gweECBG0OVs/xDwV5i9D2mBTZCcAvNaryG7175fpDk4
 r3NN/luYr5loixwTEJdFYg/NVvzMX+GyXT0ouz6g6+q1NF9aQPD+/gQsV
 p5FmyLtE2CXX/nZtDXbElP11m2Ihjik6umRHDJzjW0CS41FNwfU1ybCow
 fWzQPhV96ZOmqac4C24mMqg2tLxoXPW5WjSnBa1Za8Drv7uMCtR+knw8n
 7SZzOmrh/x8D58Dnepb9bLqP1tFoW0vLFQTmEv2qC1P1KRWWsI+qwzps3
 IsRp3VC/xMypD1ZDyHJ6yZJVv9goVftiUU29LO0kfizNrkoRHpIRHb8oJ Q==;
IronPort-SDR: GFZkV5EpqrR5KXm+N4PxVSN3Hm3IcViz9wPbaaqGcP86AuZzQ4IgoW/4ONmO2UDDTx9pg50uGe
 9IIyV3Q46POSvliV4f8TBnlQny0CRw0Mw2SLbHYG3TSUbq1wjLvWu9BTJBFDgkXhPYhA9n9MgI
 uShU7AZOkGz70phMI3hnSf2d42oP/O32wmgNHp+v10m1EpqHm6k+vTobAQdvaOtDpS4HCGkxuw
 sAW62dqK2GBxzmrmadn72nm1lShNs6dHTiarfmJjN3zJ5adNPaynDZHNfCScmkdiqP0Spz2vl4
 31p2FcS7LSRrM0xdIkfA8yWf
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="131188594"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2021 08:57:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:57:30 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:57:27 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 6/7] dt-bindings: ARM: at91: document CalAmp LMU5000 board
Date: Thu, 5 Aug 2021 18:53:56 +0300
Message-ID: <20210805155357.594414-7-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_085731_861386_FAAAB7B8 
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
Message-ID: <20210805155356.YD3-GzEoBVNS2LruumL-MrD9u7thOVI4CNblX1DNkHE@z>

Document CalAmp LMU5000.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index a9ab18510fef..08efb259a947 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -132,6 +132,12 @@ properties:
           - const: atmel,at91sam9g20
           - const: atmel,at91sam9
 
+      - description: Exegin Q5xR5 board
+        items:
+          - const: exegin,q5xr5
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
