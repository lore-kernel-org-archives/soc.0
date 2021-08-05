Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C0EC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C56526105A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C56526105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFrEAAmZ+l3eBdXXUVC+0hG8iFhZ6+rJt+W1dw5/Bww=; b=ynWQj9NOZh+T7o
	P5KrP8PNYT6SJdRVr3/9RxW39oxz4IwsXffl9F5TKM57cQ2LTNGdmgRe+T8AytngZnmglGo3tNw+d
	irXCGDSQ6CiBnO4+QfFMoyr9J1BlNKTG/3TFhVobAKjpDh2XL5SmumB3V6tsQR8iLBXfI9OrG9Dfr
	MHzIkmCV96EbjJvpp2KKAZyF39PuON6v2C4tW6Vp8e0QKS/Chkhr95XDL7XEyMwZC31qzM/eOcU1g
	0cPjTkpz2jkpJ5JufgBkx+6+zkZYWCaf6SaeqV6e2znvLlQh+EE0IXxGlDHgJnnzHVUanlWeApZAY
	/bodPr9pkvrAQ5HdPAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfjc-00A8in-I2; Thu, 05 Aug 2021 15:56:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfjV-00A8i2-Aj
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 15:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628178993; x=1659714993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0QVxHcmZ9L6f6OEKoKgRnF1g91VpcBy5zpzMgpahQWE=;
 b=ry8CF5CkpJai4ZLrPE1X9FcEU5pONn2wfb/I6KoMPDcxy1JW81RMyth9
 g/rZZHw4jATv5KCtkOYEwvnAedcwKWLB2ZHhGA0Z07RQFDFHcPCppcSjB
 h2/Dr96jNsf5z5NbTPhXnL/GlB5sYnB8RZctCkZxYYqtskyVXjA6jvP03
 i6ZetcIqTkm13gHXGq0so63hBbN8uGO2V46REHHYVJvGHa67vp1Jg/KIj
 q3gIQ1q9IuU4v33NMIheIinMh88V7ta+WVTFMTx+dmQaka5W2q32UdNRY
 Ds2RwLW1JB8y+f8Ig+LoyIL0SQ1oJZRAprKmrMV6uJCeeIF8iztgy5lGk g==;
IronPort-SDR: Aot8wCgC0XDJxvzxn7KL/e6cAU4FgIY7HrtMZTwpze2SkxzbJorMvg1RpuKmYE/ksgbbOThbbA
 aWLHNxgZtj03HLb/dkkxqFe5/XrwZLvzerPFd74ld8oiAtCd1uH9dH7GutJN4sSgUIVH5nL6BU
 iei0YtV7GymumNfmXIvZQLnbvI+e/g+BphhIurXi2F7tXo/TicbU16TGJTdkW2i1zZMKTCiDS/
 idEqGz3/hV9R5qUprjrBG/8+HNpefMJeIcCwodqdGqfpIl8M0vxu71yIBZbK3e3JLdzkLIDYUG
 78m2f+hnTq1ZtQdmKqQri/V4
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="127242289"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2021 08:56:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:56:32 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:56:25 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 2/7] dt-bindings: add vendor prefix for exegin
Date: Thu, 5 Aug 2021 18:53:52 +0300
Message-ID: <20210805155357.594414-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_085633_473912_81415CC4 
X-CRM114-Status: UNSURE (   7.78  )
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
Message-ID: <20210805155352.mu3-H8e_dEMElaV7JkMaZMcqdEW8VZqCSPc_fkkWqVE@z>

Add vendor prefix for Exegin Technologies Limited.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 07fb0d25fc15..2fa00c7b7ee2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -391,6 +391,8 @@ patternProperties:
     description: Exar Corporation
   "^excito,.*":
     description: Excito
+  "^exegin,.*":
+    description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
   "^facebook,.*":
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
