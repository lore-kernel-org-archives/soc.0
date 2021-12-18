Return-Path: <SRS0=RL/0=RD=huawei.com=cuigaosheng1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5239C433F5
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 08:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEC28C36AEB; Sat, 18 Dec 2021 08:57:54 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CBDB3C36AE1;
	Sat, 18 Dec 2021 08:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CBDB3C36AE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from dggeme762-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JGKRP3lzxz1DK67;
	Sat, 18 Dec 2021 16:54:41 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.44) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Sat, 18 Dec 2021 16:57:44 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
List-Id: <soc.lore.kernel.org>
To: <linux@armlinux.org.uk>, <krzysztof.kozlowski@canonical.com>,
	<andrew@lunn.ch>, <gregory.clement@bootlin.com>,
	<sebastian.hesselbarth@gmail.com>, <vireshk@kernel.org>,
	<shiraz.linux.kernel@gmail.com>, <soc@kernel.org>,
	<linus.walleij@linaro.org>, <ardb@kernel.org>, <cuigaosheng1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<gongruiqi1@huawei.com>, <wangweiyang2@huawei.com>
Subject: [PATCH -next 3/3] arm-soc: various: replace open coded VA->PA calculation
Date: Sat, 18 Dec 2021 16:58:43 +0800
Message-ID: <20211218085843.212497-4-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20211218085843.212497-1-cuigaosheng1@huawei.com>
References: <20211218085843.212497-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.44]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected

From: Ard Biesheuvel <ard.biesheuvel@linaro.org>

This replaces a few copies of the open coded calculations of the
physical address in the secondary startup code of a couple of
platforms. This ensures these quantities are invariant under
runtime relocation.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-spear/headsmp.S     | 11 +++--------
 arch/arm/plat-versatile/headsmp.S |  9 +--------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-spear/headsmp.S b/arch/arm/mach-spear/headsmp.S
index 96f89436ccf6..32ffc75ff332 100644
--- a/arch/arm/mach-spear/headsmp.S
+++ b/arch/arm/mach-spear/headsmp.S
@@ -10,6 +10,8 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 
+#include <asm/assembler.h>
+
 	__INIT
 
 /*
@@ -20,10 +22,7 @@
 ENTRY(spear13xx_secondary_startup)
 	mrc	p15, 0, r0, c0, c0, 5
 	and	r0, r0, #15
-	adr	r4, 1f
-	ldmia	r4, {r5, r6}
-	sub	r4, r4, r5
-	add	r6, r6, r4
+	adr_l	r6, spear_pen_release
 pen:	ldr	r7, [r6]
 	cmp	r7, r0
 	bne	pen
@@ -37,8 +36,4 @@ pen:	ldr	r7, [r6]
 	 * should now contain the SVC stack for this core
 	 */
 	b	secondary_startup
-
-	.align
-1:	.long	.
-	.long	spear_pen_release
 ENDPROC(spear13xx_secondary_startup)
diff --git a/arch/arm/plat-versatile/headsmp.S b/arch/arm/plat-versatile/headsmp.S
index 09d9fc30c8ca..cec71853b0b3 100644
--- a/arch/arm/plat-versatile/headsmp.S
+++ b/arch/arm/plat-versatile/headsmp.S
@@ -18,10 +18,7 @@ ENTRY(versatile_secondary_startup)
  ARM_BE8(setend	be)
 	mrc	p15, 0, r0, c0, c0, 5
 	bic	r0, #0xff000000
-	adr	r4, 1f
-	ldmia	r4, {r5, r6}
-	sub	r4, r4, r5
-	add	r6, r6, r4
+	adr_l	r6, versatile_cpu_release
 pen:	ldr	r7, [r6]
 	cmp	r7, r0
 	bne	pen
@@ -31,8 +28,4 @@ pen:	ldr	r7, [r6]
 	 * should now contain the SVC stack for this core
 	 */
 	b	secondary_startup
-
-	.align
-1:	.long	.
-	.long	versatile_cpu_release
 ENDPROC(versatile_secondary_startup)
-- 
2.30.0

