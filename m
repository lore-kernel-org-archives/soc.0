Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773C5C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:43:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2309E2389A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2309E2389A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=43LBI80IxIPSTEtGrCN5Kox3uVMg8erFKbqNHnWrb4I=; b=jt2oTNXAL+sqLH4NqSKMMDup1
	wYPKfNZ4+n9lambwZm1CRmJB8IoM8qptmXK/ULdidvEg1369LQWAcnmmFf8l+OJTsSmF1MRZmyUxA
	STER2ehHtIZWK6vT+hG0cRAA0wiZzfWMdADJP7Kg64zxnSirFvl+/82qGP9qBcSpzXrZXVOSFs2QC
	BZD2K1T5VeDVww/m3UJpct83atpPu2jMgOxfsBd5p88qLSGjS2HLwebcNSr3CjXI3YcPU5D0xiJ4S
	44oiBl/7nuU+5BJrJ5Ur1t026udl/q9R7AKm+LrYx8ocex7xrmTg5CcJ1qArqHllehZX7oEOh1rXt
	i7ui0SIjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Qr4-0006BF-AN; Thu, 21 Jan 2021 03:41:54 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqo-000651-Ln
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:39 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id D8528DF892;
 Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TV5t0yC6OOVg; Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 03B79DF8E6;
 Thu, 21 Jan 2021 03:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zZr-gO1SsUBE; Thu, 21 Jan 2021 03:37:38 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 6484EDF892;
 Thu, 21 Jan 2021 03:37:38 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 01/12] dt-bindings: gpio: mrvl-gpio: Fix the gpio-ranges
 property
Date: Thu, 21 Jan 2021 04:41:19 +0100
Message-ID: <20210121034130.1381872-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224138_881107_DD889103 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121034119.37-U0uTqj8CAdZH2ciRDbpigWuVwQ4oxUCpOKvNWuDg@z>

The property specifies a list of GPIO-capable pins. Don't limit it to a
single element as there's  presumably more than one GPIO pin.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
index 4db3b8a3332c2..9cf6137dd5241 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
@@ -82,8 +82,7 @@ properties:
   '#gpio-cells':
     const: 2
 
-  gpio-ranges:
-    maxItems: 1
+  gpio-ranges: true
 
   interrupts: true
 
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
