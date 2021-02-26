Return-Path: <SRS0=yS1I=H4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D7CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 16:45:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E489764F0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 16:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E489764F0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SYsJZWvQ3QlKwty/h/djYbzIGbqGOAk4Mrmk+gFGWDw=; b=UlgJVfYOqYVANvrasnFlcDNphc
	5D9Yx+QR2LpJa+IyXW/tuiUzRsuomVF5Ai8ZzyFPSlyx0/AE09BQ5ZY4XMVqTnG8af9kzbAoaPr/Q
	SlsaYqFlbNdPY0iHtpcVUsn76CU2uI3CY67t7PU778tLHt0/ameuQrPREW84vifnuhVbto6xy9+73
	vSNBQtHMT78JAhKsBZ1ikVJ7p/eFZiPqwQnrj1zE4EwYkGyfa3NQVg2Nm6DHQHD+WjjYSME2sgy7F
	9LCd3jyz/jyEK+a7EjL/qJ96vCrBDGLtS87ZXqwE+EuusI38D7c/4ChzDX4tdgWx20ybcqDBLUenF
	UzGoNT6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFgDt-0004k0-NH; Fri, 26 Feb 2021 16:44:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFgDs-0004jd-34
 for linux-arm-kernel@lists.infradead.org; Fri, 26 Feb 2021 16:44:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 873D664F0D;
 Fri, 26 Feb 2021 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614357851;
 bh=H2YTMQM6RGZ40+WuXh4eMNp65ECystWvO4ylYg/h6gA=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=CXuh0VwWEoQwI8PVuntuQ6o3aPcuHorVUEukP7moPDI+z+B9wl61EQREIpalsWH9p
 k3rqfixqto5YA/4HPHmOzwRFnDreWi7jsA/i4bwQGICQ/6LnCmUVJ19D+RlSXO8yWg
 hY8FdTUC6Yr2myKZh+BegAT/BB0d1gripMBS5SayJ0enXvwQaJ7rvzmQgcnejdnrMU
 8bBN9/+FEtWcFP0rXdM4eqCFMNOfYEXb/+gnHLggaGcP7StY0AWGAmAAZgyzMthqqS
 a7YPEJiggmfEcnoWgH97erj0+JKfN2PTOuzI6Dl99c5eXbYTqjztpUz3jvT61SloL6
 Pm7p1rOX69Iow==
From: Arnd Bergmann <arnd@kernel.org>
To: Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
Date: Fri, 26 Feb 2021 17:43:31 +0100
Message-ID: <20210226164345.3889993-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_114412_219179_2DD583D7 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210226164331.avMicqx1qfFp-5LzSqeP-8gDkdilSTxL1wQvLzEmxDo@z>

From: Arnd Bergmann <arnd@arndb.de>

Randconfig builds with ep93xx fail with the clang integrated
assembler that does not understand the maverick crunch extensions:

arch/arm/mach-ep93xx/crunch-bits.S:94:2: error: invalid instruction
 cfstr64 mvdx0, [r1, #0] @ save 64b registers

It is unclear if anyone is still using support for crunch: gcc-4.8 dropped
it in 2012 when it was already too broken to be used reliabled. glibc
support existed as an external patch but was never merged upstream.
We could consider removing the last bits of the kernel support as well.

Turn off the integrated assembler for this file for now.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-ep93xx/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ep93xx/Makefile b/arch/arm/mach-ep93xx/Makefile
index 86768495f61d..f686577ba059 100644
--- a/arch/arm/mach-ep93xx/Makefile
+++ b/arch/arm/mach-ep93xx/Makefile
@@ -7,7 +7,7 @@ obj-y			:= core.o clock.o timer-ep93xx.o
 obj-$(CONFIG_EP93XX_DMA)	+= dma.o
 
 obj-$(CONFIG_CRUNCH)		+= crunch.o crunch-bits.o
-AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312
+AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312 $(cc-option, -fno-integrated-as)
 
 obj-$(CONFIG_MACH_ADSSPHERE)	+= adssphere.o
 obj-$(CONFIG_MACH_EDB93XX)	+= edb93xx.o
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
