Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8DEC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7296105A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A7296105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YiKWd/Qk8mkIxE44oyOzxGDbF578dcIfVj42l3zBBPI=; b=3hVKYV669suy+K
	XBTtVdjQ3X5IzZfWN5qUmdTDNcfjpCRK1zZKMm76lz3gm3ThNcqqfMCzN5Z5qw/KI8KEJ6FRF2DFa
	3Teb5IM5rKSV70N4Y8AqksdUqH3CcwVMVzxqKfbsTs3qUF5zeicFnaiIf4ppcMeGXgi6edLQpxA/F
	9pvjIcc6d1GdwLmbzRsEFJ2QalKQBdbAdx2HbR4J8br+OXbO/ujxeCQKlQ+bdmPda9Btp+X7n2d6N
	G+Hg3L43zpXBimyQzpFCio8NlMj8geA5lbuq7sMLBSCFieWYfhBPPRvPWlfQxpIzi+1vnFcVaiUu1
	5C6bb9JBWxOdPUm3FE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfkX-00A9ON-7M; Thu, 05 Aug 2021 15:57:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfkP-00A9Iy-SW
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 15:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628179050; x=1659715050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3gj+l86LGzCXpPdm2bvQS8DTJlfMc1PnzmCTCU9NWo=;
 b=APuGyYwc+VbAf5GW6EvJjrWeY0XThICPs5x8/vtGSxlLJOmmBndV+IBE
 Y1Vg6B3kRofoDbv//+VuM59gxBMZHoNRM4bWWNC+hMEfg1u5RwsEKVpDS
 oW7g9GlWlaHvghZcrXNJtUMmVdx0WW8CLS0LTDRzR5tXGwBzE9mOHkHuC
 VpBk3XM/Bvqe+CWlN6pqDGqTqjXfBmHBS9/HSQ4wManMJefE8SuTqJo6k
 qvqgLqxermJqAtrbWaW6cVbw36iJZQD5wImT9T0qOxXAtfZH/NHrJKVMy
 aHELxrlvYuxeqF4CgmpjUV47tAhcMU8ymvgMHApa2CT/pgcHWt8FiBS1R A==;
IronPort-SDR: n9rnYFlLL/iZ26UuOJnityprQY8Q3eO5jiRPszsRFXa8rF8xdOo4VYceE1Kr3wMyiGyUFgcMT2
 LusXKlf12QL9bacp7DRyGa4OfvKcTsjrvaI7QTMX6u0QWgJn9FeP4iIDvV41bYF6SE1H0bj927
 3DVeMtDX3rgIEMZKhVtWXeB2GmfhZ8bBBI3iE9FFy/Jg8G0779oTSh2MNut0WZXaxx15h8lian
 CAjPHUEGErGzfcD5E0qhGrm9GzGB6X1QLabMtrtIgsvuoOzrScxdiH376G1/M+eLYcH77PJP/p
 LcCKemC0ptp/Z3vspL1QkTK5
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="131188582"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2021 08:57:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:57:26 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:57:04 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 5/7] dt-bindings: add vendor prefix for calamp
Date: Thu, 5 Aug 2021 18:53:55 +0300
Message-ID: <20210805155357.594414-6-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_085729_995106_02FEFE5E 
X-CRM114-Status: UNSURE (   7.69  )
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
Message-ID: <20210805155355.G1iRCZkGp5rKqohSPH8Y2HkyO0uNDypiCCyPb3GHgeg@z>

Add vendor prefix for CalAmp Corp.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2fa00c7b7ee2..61fe4778498d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -191,6 +191,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bticino,.*":
     description: Bticino International
+  "^calamp,.*":
+    description: CalAmp Corp.
   "^calaosystems,.*":
     description: CALAO Systems SAS
   "^calxeda,.*":
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
