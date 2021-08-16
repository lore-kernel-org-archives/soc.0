Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1A4C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:50:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A7061A59
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 06:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3A7061A59
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGyiG0jTtpKrBY3c1qDwGE9sNaWTBr39b5W/EHGiXoM=; b=aLnLzoupDBMJrf
	uIZGryR9CldrnRC2gO55V6GPQ8liQBoZSXd+4x1j7qsZJnc0d65uaJMh6EbCLI2uiigsJBDMcBw31
	H0JDLzV/JlMXpUyeNNU8S2C44GM4D2O5N7FCcIgfSDx0EF739FNp/m4paEC62oLWv3wtAqZ/pnHhZ
	roOFLUnQji3l3gSpj5RgPUq6iCfgeQfuNwt2FZhHcoQUYW5QnfXunrEsZzRIoUNIqL52wlY17jpz7
	o7FtNDijESKI11uyRFcwk2YoyaSzzGiqHNojxeU9e2kqIM5JlvIoUNyShR/PMMUSdBeHzKx9Pys7r
	nMaZ0WYA59DQz+x2B5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWPn-00GGq9-P5; Mon, 16 Aug 2021 06:48:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWOX-00GGP5-Vq
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 06:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629096409; x=1660632409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+TD5GOQnMaG8+zRlR+FFVFgYC3jWTUSdaYfkn7DGXIY=;
 b=KoFdO+3I4eIUcHQ4Y5SAk9v6W5I77BPtTJZ7CK0eQJ4m3nEmoZpbmyO9
 FfiaqB43xFLwxlXX9Mh2FcgNtxbedGXe2A7LuwatARrDnFV2g6w5bNyNr
 hh3pSH2dz7RnFSxvOqgw2IPhddXC9eMC3sEDxMbv+CQNv/xjV46pELtsL
 speEd7Eiy2OzjFQDvbjBFQyv03Jm1aL/ULKBpxDZ8a4jcziAndcHtEErr
 vfuirWPTfQ+D/r53F8bTj3AX6IcpolUpHdQVt7VG4NNJoum1cQHsTpsJS
 lHyzMHAEpmbRrpejXWD7GInw6GGlXL+IMzgpGpetYrGn/L5QoTYWdn7kX A==;
IronPort-SDR: 5f6qOo1GKNYNXOi1pEE4Slc6alSK18UNI+2BgdfvSSzbFgqt0sQfeMSOtqabHQyjT+ixUeKWA1
 D/TMYAVZwc0YTxNuVOUs9E54sB09sh0XOMx28GJHmoEikP2/RY8FYKU8yeh+oC/UGKLtVAXUWU
 4AZLJbCu5E1AFEBv8Ru713SwKBWe0z4agRDHBk5t6xVZ6g0j+r+QK7pHCIAmHdWERdAtDpsBqV
 cUV5YXXGpBSHe7tA8C82HWmmC2OgG/VkvKOZQFmjYhU5WdBzzvL8ojn+qKLhTEGAz5juTQakhG
 MO/xoWnTDoMhP5JKtBLbbtA6
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="125900554"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2021 23:46:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:47 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:43 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 6/7] dt-bindings: ARM: at91: document exegin q5xr5 board
Date: Mon, 16 Aug 2021 09:44:15 +0300
Message-ID: <20210816064416.1630674-7-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_234650_113730_2E8AC192 
X-CRM114-Status: UNSURE (   6.16  )
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
Message-ID: <20210816064415.XmV396H3LN7WKAvzZVKEsOSLCdG6MAa7c69wPk94ppo@z>

Document Exegin Q5xR5 board.

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
