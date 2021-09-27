Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE93C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 09:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFF36115C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 09:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FFF36115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D+6gPCdecIahvoRYLrXC9mDlh0x+1HING0zzsMXEoTk=; b=nEXx5utAlCjdhn
	Gg5ixc50/8ODGaRx/BlGI8yDfalB1n928ekRwvBuYdm5Ewrcy1CIxYwvAwE4N4hA6pWWyLN6EqcSL
	Fp2WKcHM2lY9CREQtUPcm3ORA+dJc0UhbKgXy9E2cH2XTw37EUHfIa7GstGRNQD81PPxh8QykSXNw
	aUAuoEDM4QLeMv9h4kQ1AUsQBUantTMT+EjM21avzHniotG3fIdDZzTpn0Rms0l6k13ZvDrSy6d57
	RUiuQYvqNHUfEIRcL+O2WVyMW6LoleA61mnQIYSQK7EeBvQbwOB8q7auRJvGfYX/7TrZqCxVBP+fa
	485ncaNQ2hz+2QMa+fiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUnKY-002DwB-Vp; Mon, 27 Sep 2021 09:53:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUnKV-002DvZ-FR
 for linux-arm-kernel@lists.infradead.org; Mon, 27 Sep 2021 09:53:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8D060F70;
 Mon, 27 Sep 2021 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632736427;
 bh=0Fj65JXbuxZGtuGCEpwlOS482/Z2ZnxDqxnU0qnk8kI=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=TQ3qfRdrDleOFX8TYfi0C7bFoN4J5r7MOJW1aZeGBme7hXswu79QRia+CTPjhnZBc
 qtFR/J0C/lAAg1oIE3LMUl4cP9UFFHRYAWJIlYJOJCougxj8zWlD9LXLPUfiQZJFCE
 BH59W+yFhDamEy3Gd6767vTbm4OWNrlDB5S/XOfnlM5XPJ6Ittuw9+ncWpy9xTb4M+
 BLzBpOC6gB8xTnfaRJo2UzheS4Qp8mNGkHvqMG6BDFJcUyvqEtVLYTyQrjHV5tFCdk
 i0bFcoSuvCRT+rBPQ9GvgqilqK+CogVfcI8ASVE6kzdmmAgrpr1zRFKZpR575sNVev
 XRAmCGNrUb77Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dove: mark 'putc' as inline
Date: Mon, 27 Sep 2021 11:53:33 +0200
Message-ID: <20210927095343.1015422-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_025347_557559_72DEF129 
X-CRM114-Status: GOOD (  10.99  )
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
Message-ID: <20210927095333.A1--2lkk8RoTBVmPctTtlomCcTWJnnoJF7dmXWAajtY@z>

From: Arnd Bergmann <arnd@arndb.de>

This can cause a randconfig warning without the 'inline' flag
that every other platform uses:

In file included from arch/arm/boot/compressed/misc.c:29:
arch/arm/mach-dove/include/mach/uncompress.h:14:13: error: 'putc' defined but not used [-Werror=unused-function]
   14 | static void putc(const char c)
      |             ^~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-dove/include/mach/uncompress.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-dove/include/mach/uncompress.h b/arch/arm/mach-dove/include/mach/uncompress.h
index 7a4bd8838036..ddf873f35e2b 100644
--- a/arch/arm/mach-dove/include/mach/uncompress.h
+++ b/arch/arm/mach-dove/include/mach/uncompress.h
@@ -11,7 +11,7 @@
 
 #define LSR_THRE	0x20
 
-static void putc(const char c)
+static inline void putc(const char c)
 {
 	int i;
 
@@ -24,7 +24,7 @@ static void putc(const char c)
 	*UART_THR = c;
 }
 
-static void flush(void)
+static inline void flush(void)
 {
 }
 
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
