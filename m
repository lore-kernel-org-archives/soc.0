Return-Path: <SRS0=aJU7=IV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C697C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 13:10:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7037619B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 13:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7037619B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L0PjD3NZ9xAxyLwbW77NGPQpjlsZpOkOyz+qE7e1VA8=; b=gfAvqHYWcLOw0htJ10D5prh7P7
	q3ojTI6JDeuW9wGd1g3Tk8lwwRkr/RZQwmqlWvZSC4l40P8BUofXcFyfCNulnk0vWt7UzEPkEbb0j
	ociMNJfzavklF+vpW6yZTIAsxpKgeOMryQFB3yzNQ/Q0py92gmfAtkTpYuSIcXoT3AGkCi5wcETXt
	KstHP0QSBQA1s4deuiTKyt0khJhr6oA6fNggHPPUnQVp7Mo29TAaR7PT3mMoAkfPd46fOp+ZkYGjk
	K+Vl12PIrt1GiwQgrmxXga55hvE3PsbT8+s5qIepypMOVvZ+VhXlC5Q0HecaxJLB5dK30D+P1X2hV
	XDcgMMGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOgmL-00F0mN-RZ; Tue, 23 Mar 2021 13:09:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOgmH-00F0lw-It
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Mar 2021 13:08:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 072B161920;
 Tue, 23 Mar 2021 13:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616504933;
 bh=2SHpTb9MZLORqmsnpw6kKb4YNiJ7pwIKK6mVvZCPNvM=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=IxYt/AGWkifkWaB5s/974XknZA8fcPdnzDtxUfqJCb6inlQRZ0eSDi7zJ0VY4NwWs
 7owBKwlWXFe5IfGX2YQri8m2F8Yye3Sl2QgWiV4lxq1ayZbN8X5MPhvjbqfs1/jvZn
 O9089PSmgkQKy7IqKOwSfCcRrwoqLLcXHIBUCiZCQWGikeBjOv3/zS+DGs9HFAE3gh
 y4AMprU5lWQnSuMNFaN8Ey2YYDaEWyKbEUBhij6Fx0c3Kic1LYeFFBKlpOC+oxcah6
 ZlJH5DRUHVrnc0rYj36nhFlBwepzdTohB9aDiW9IIWM9rGh6TUGbJFWWDPhjLaE8b4
 XPkLt1xnfCmfg==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: pxa: mainstone: avoid -Woverride-init warning
Date: Tue, 23 Mar 2021 14:08:27 +0100
Message-ID: <20210323130849.2362001-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_130857_907179_31201348 
X-CRM114-Status: GOOD (  12.29  )
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
Message-ID: <20210323130827.QOlXXZ4Nk2-c_v5NdTKxcE3IdVkY6GSQ9tr4T7VZJfc@z>

From: Arnd Bergmann <arnd@arndb.de>

The default initializer at the start of the array causes a warning
when building with W=1:

In file included from arch/arm/mach-pxa/mainstone.c:47:
arch/arm/mach-pxa/mainstone.h:124:33: error: initialized field overwritten [-Werror=override-init]
  124 | #define MAINSTONE_IRQ(x)        (MAINSTONE_NR_IRQS + (x))
      |                                 ^
arch/arm/mach-pxa/mainstone.h:133:33: note: in expansion of macro 'MAINSTONE_IRQ'
  133 | #define MAINSTONE_S0_CD_IRQ     MAINSTONE_IRQ(9)
      |                                 ^~~~~~~~~~~~~
arch/arm/mach-pxa/mainstone.c:506:15: note: in expansion of macro 'MAINSTONE_S0_CD_IRQ'
  506 |         [5] = MAINSTONE_S0_CD_IRQ,
      |               ^~~~~~~~~~~~~~~~~~~

Rework the initializer to list each element explicitly and only once.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index 6f4b64727df1..599736c93163 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -502,16 +502,20 @@ static inline void mainstone_init_keypad(void) {}
 #endif
 
 static int mst_pcmcia0_irqs[11] = {
-	[0 ... 10] = -1,
+	[0 ... 4] = -1,
 	[5] = MAINSTONE_S0_CD_IRQ,
+	[6 ... 7] = -1,
 	[8] = MAINSTONE_S0_STSCHG_IRQ,
+	[9] = -1,
 	[10] = MAINSTONE_S0_IRQ,
 };
 
 static int mst_pcmcia1_irqs[11] = {
-	[0 ... 10] = -1,
+	[0 ... 4] = -1,
 	[5] = MAINSTONE_S1_CD_IRQ,
+	[6 ... 7] = -1,
 	[8] = MAINSTONE_S1_STSCHG_IRQ,
+	[9] = -1,
 	[10] = MAINSTONE_S1_IRQ,
 };
 
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
