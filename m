Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22C9C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 16:01:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A832164F65; Thu,  4 Feb 2021 16:01:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F40E64DD6;
	Thu,  4 Feb 2021 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612454494;
	bh=8G+7VE0gcf4JFZkpiuUu1ybU70U+isYPoSIRMW+O3Io=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=AxxDK+Qh/TvtH6+p7RY3eKl2Q6vIunpGyqYxp1thSCCTb1/u1TqihAr1e1T5oseA6
	 0eBeBZ6dRyjww7TuQhpCNYhvnzKPj5tiWehSOFgAd+N1tyIoZawQwTeOcT2+pCXKAU
	 ztKmVjPK9cqvt1fPelPTuED2WrquMuW3Wi7SPWhkud0rfQxN+tomGqZCH+RmlhWRwA
	 XGQ9S5qxb9e6qPd2PUHcpEDGw4CaTYx8ir+H+lBifZyuFW2GJu5bc4NifehlFE113J
	 1fs/7q+WiVRv6ZdU/z83PwOJvqrfhMteUI3jby6Il3oTQdfV/ioHkP/9lsxasA/mRy
	 wlmknOda2Co9g==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Stephen Boyd <sboyd@kernel.org>,
	clang-built-linux@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
Date: Thu,  4 Feb 2021 17:01:20 +0100
Message-Id: <20210204160129.2249394-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Compiling with the clang integrated assembler warns about
a recently added instruction:

<instantiation>:14:13: error: unknown token in expression
 ldr tmp1, =#0x00020010UL
arch/arm/mach-at91/pm_suspend.S:542:2: note: while in macro instantiation
 at91_plla_enable

Remove the extra '#' character that is not used for the 'ldr'
instruction when doing an indirect load of a constant.

Fixes: 4fd36e458392 ("ARM: at91: pm: add plla disable/enable support for sam9x60")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-at91/pm_suspend.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
index 909856c8a8c6..0d467cc40129 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -446,7 +446,7 @@ ENDPROC(at91_backup_mode)
 	str	tmp1, [pmc, #AT91_PMC_PLL_UPDT]
 
 	/* step 2. */
-	ldr	tmp1, =#AT91_PMC_PLL_ACR_DEFAULT_PLLA
+	ldr	tmp1, =AT91_PMC_PLL_ACR_DEFAULT_PLLA
 	str	tmp1, [pmc, #AT91_PMC_PLL_ACR]
 
 	/* step 3. */
-- 
2.29.2

