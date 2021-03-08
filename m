Return-Path: <SRS0=G0Ss=IG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B0EC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Mar 2021 15:36:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9AAB65218
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Mar 2021 15:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9AAB65218
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pbqCx7xfaLGiptNnXi1LzkPQyQR+Cri/VCqk1p6RftY=; b=pd+8VtFu6cavgeZ3vJGFnSNhvG
	Lgmu5OWpzSjayEGLC4GuzbmR9sc+ARxE3k+ji9WfL8rfWO+sVnQYPPaFFNTmsKpjjKqvknwR4cAi0
	ZRVtnIxMQjmbpPx32q9eTVfBFqqACqos7t4yA9lA5G+O6fYNIcQ4bbxMdhnlKNEGQntrY54aD4tf5
	XEGxO4jqEpG8njFBdMEdWsiIaHOC4oG3IqlDpckQh/OXDn4euNVzVbLQM/DAGI3ScLx6hj4LNJ886
	gbK2uwVKSBWcxmB9OyovLP6R9eiYZlMCV6MkhNqpgoLyZDAaEek0g/+hVOxielTJmreO+ErScSqyU
	pqrV01GQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJHu4-000dXg-7E; Mon, 08 Mar 2021 15:34:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJHu0-000dW0-9K
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Mar 2021 15:34:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 060B565208;
 Mon,  8 Mar 2021 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615217674;
 bh=j0NgJNYgPcYbBvwr1Be+M0r5NEbw1hmJwjIfe3Edh1s=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=pF/hs/lBnF6WFs3i0RF4RIoz0ZhEuz+xWNHHYn0q9FyBu4GEbjSECt1YhDsQPKDwn
 RSI88DtEXb6WS4APkZcvZNFm+Sc0/LqkOjih+QOGUvYtBVmFnLm1w72e6mBQ9v8a61
 0K8pG0JVo2EZZ/++MyUAUSt2ydc8sFdiXVdsKcsuUL7aT60rqfn5jbSeo5obAg145c
 4y32rNGS3msLRtD2k+eEO1Ccf/n+FDec3XuAvmE/YfFWnOrAXUaBe0waKwhiT66LKa
 zaJZr1aPum6Yi7HRkJOT6xi/HkDdn4uJAGxhuY0Pbfmz0vYL1v3cOnDCbEOqSDZCWx
 5ZZhhaUyKtOnQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: omap1: fix building with clang IAS
Date: Mon,  8 Mar 2021 16:34:21 +0100
Message-ID: <20210308153430.2530616-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_153436_601545_635A662D 
X-CRM114-Status: GOOD (  12.13  )
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
Message-ID: <20210308153421.dCxU91bOMaqIWIr9mk6SkAp59b5QrI3Te8rPvxCOvqc@z>

From: Arnd Bergmann <arnd@arndb.de>

The clang integrated assembler fails to build one file with
a complex asm instruction:

arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: error: invalid instruction, any one of the following would fix this:
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^
arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: armv6t2
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^
arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: thumb2
 mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
 ^

The problem is that 'NR_IRQS_LEGACY' is not defined here. Apparently
gas does not care because we first add and then subtract this number,
leading to the immediate value to be the same regardless of the
specific definition of NR_IRQS_LEGACY.

Neither the way that 'gas' just silently builds this file, nor the
way that clang IAS makes nonsensical suggestions for how to fix it
is great. Fortunately there is an easy fix, which is to #include
the header that contains the definition.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/ams-delta-fiq-handler.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
index a0fb7cca0fc3..e6a33024f6b4 100644
--- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
+++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
@@ -16,6 +16,7 @@
 
 #include <asm/assembler.h>
 #include <linux/soc/ti/omap1-io.h>
+#include <asm/irq.h>
 
 #include "hardware.h"
 #include "ams-delta-fiq.h"
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
