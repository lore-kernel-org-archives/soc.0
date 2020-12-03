Return-Path: <SRS0=glJB=FH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07ABDC4361A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Dec 2020 23:20:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA122245C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Dec 2020 23:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA122245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IgBVpjxp76s2WXA8T/KyN5+CImDAguQWHSUOt09tiiY=; b=x1Ojf2DB7/9UfU5ont+BoVXZDK
	OimDIzJEoM5gEY+HkC8vqM7AiGnmH3g5MYk6dzA+lOz+Vfm/t2SjnE0uvLwopNZ5bWPYW/x33HpR/
	3RbmobUj/lTGw9fXFpsCX4sLNvYUvhqoz6eUefKLVQ6U8/Jlr5+3NnRYAY0T7v4K7MDK2ZvY+kSap
	jIm7nmSJr0e3gcFY8O4oSRNI5z2X5+LF3E6/Rsfx9hWUxXGWZVceLTu3UCL1fwt4VvkEfvUu7zvPD
	dH/15qjEii8oeo19ruTzGkAsqUFNy3xNTVGV2OgFHvZ+5Dl+cnAFWCT3D4NtmP1CsVJl+rz0v2NVg
	5O2T3FWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkxsD-0001Wh-TI; Thu, 03 Dec 2020 23:18:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkxsB-0001WK-HC
 for linux-arm-kernel@lists.infradead.org; Thu, 03 Dec 2020 23:18:52 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Santosh Shilimkar <ssantosh@kernel.org>
Subject: [PATCH] ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
Date: Fri,  4 Dec 2020 00:18:40 +0100
Message-ID: <20201203231847.1484900-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_181851_660413_538ADC53 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201203231840.FHKZ4cfHDXlvBi_0HaKkvL6yWhIwh1g2cvOKLdNYukg@z>

From: Arnd Bergmann <arnd@arndb.de>

These definitions are evidently left over from the days when
sparsemem settings were platform specific. This was no longer
the case when the platform got merged.

There was no warning in the past, but now the asm/sparsemem.h
header ends up being included indirectly, causing this warning:

In file included from /git/arm-soc/arch/arm/mach-keystone/keystone.c:24:
arch/arm/mach-keystone/memory.h:10:9: warning: 'SECTION_SIZE_BITS' macro redefined [-Wmacro-redefined]
 #define SECTION_SIZE_BITS       34
        ^
arch/arm/include/asm/sparsemem.h:23:9: note: previous definition is here
 #define SECTION_SIZE_BITS       28
        ^

Clearly the definitions never had any effect here, so remove them.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-keystone/memory.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-keystone/memory.h b/arch/arm/mach-keystone/memory.h
index 9147565d0581..1b9ed1271e05 100644
--- a/arch/arm/mach-keystone/memory.h
+++ b/arch/arm/mach-keystone/memory.h
@@ -6,9 +6,6 @@
 #ifndef __MEMORY_H
 #define __MEMORY_H
 
-#define MAX_PHYSMEM_BITS	36
-#define SECTION_SIZE_BITS	34
-
 #define KEYSTONE_LOW_PHYS_START		0x80000000ULL
 #define KEYSTONE_LOW_PHYS_SIZE		0x80000000ULL /* 2G */
 #define KEYSTONE_LOW_PHYS_END		(KEYSTONE_LOW_PHYS_START + \
-- 
2.27.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
