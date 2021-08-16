Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396F1C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08A7E61A59
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08A7E61A59
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23P4Hva4X00yKsVhFPxrJ8foN+LIBhnrFLEDatI1ako=; b=3F/vQEllBkYUhX
	xzQHerMaMKYwScOgGUNCmP4tWiSVl6c9OUOAppC8l1VaRoabhNanZIS4mXHQpjEQeaUKf9zd39JGj
	tkgbbTgcJ6/IOjBQd48Y+hPn8c9xZ3Mn5nvL5TfC2LKfslXsEQrkt9+Iixj2KsZevtDX6cMnrG4iQ
	nkfQ6VO/+rQS0kzhdfBr/2OJFdDk1ffhW7zTTMAcFcui8pu6euxVSq7ijJVh0IXqOmQAV2YEwFT8F
	rrb5TsRrJhDNrNk2IvDxRlNA0wFQpqwSK47mCKajtSiYIwjaOsfAg+jopQp8Q9lJ9yCeYilhLUL7U
	010hVc29/zVg05Ps6piA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWOb-00GGQn-FI; Mon, 16 Aug 2021 06:46:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWOH-00GGMA-Oo
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 06:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629096393; x=1660632393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QOlG895YLHjDjZlX0+oU0a41P3tagn5ancDt1lnfWhE=;
 b=tyhypsGr1ssdZDXE7tVL+mXGTXxFDbDzvdIjaOn7SxF288n8NbZw8c1K
 vgA8xluS8a9l6d5nDB1sCoxmCjUTm7K3pC8J9MmIPCYUgDrvYV1lFF/Xp
 Tv95RRit/b55vb7GqmwOwBEyEf/mzjDoce3e6cmCDpzzaFgR2VMcIn7v6
 aZ2DWq3JZDOGdkIPaVvDX7FKBz47OvDa4h1SjbBjoSfplNAm308dqUI0u
 CiNPzmGxVuZDadX9EvpkSsPiPClvXsBgX2AJy6SoV/EAQno0L5k0sDodJ
 ddcbQHVujgRJL8CjZ4Wf+Uj6bFSsWaSFc+6Nffz5Ua3Nv05iLOmjNGZb1 w==;
IronPort-SDR: BrheuwS149YsFwi3XG2K3Wr46ZPaN2CbmcFrIHSnFq4Cg5ZZt6l7M1HFzg0H/PmnTMvyoiSZGA
 OPrPwrbms5gf6EuYUc9GoN5wleO4tOakYz7cujvVW5f+Yah+gfTxdEk14/gdGKybdmgQPXaDSg
 /IogmZtWJleaOuP2XNw7CKXgeLugjvmKoLMtl3O8weON9RgpJ0JqCOSfdEBIxav0FDQOELvSVM
 7Z8lEgBVyi1yDPG2Q3IuYfbjz2ExZPwMbKoDV7nE8mj03FxGnGEysTaOOu4bku4q+heCavOiZu
 SCCRT7fsB0SXOmDFM8Q92Zkf
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="132362618"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2021 23:46:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:31 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:27 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/7] dt-bindings: add vendor prefix for calamp
Date: Mon, 16 Aug 2021 09:44:11 +0300
Message-ID: <20210816064416.1630674-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_234633_857566_5E6BF54F 
X-CRM114-Status: UNSURE (   7.15  )
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
Message-ID: <20210816064411.N01dfpQugeyBXog5YiW2ycoNwDLrQNSkjeSeN3PfJuY@z>

Add vendor prefix for CalAmp Corp.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 07fb0d25fc15..8cf2ed41537a 100644
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
