Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49274C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 16:02:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 018E564F4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 16:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 018E564F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5BoXLBPK50suouEJb/MkRMSzL7PQOfAdS/o1EY0eVDs=; b=sTTJJTBVuJYRDCSZcYFTWHUybS
	yAo1GDh0AUV4afExyo7UPskOAx39iWdvNWrCazWhiVJAdX8aNJKNGV1Vu4W7i1yJVUbu+O58yBafD
	heBR4tCDavp64lQuxNdz51pYtDI+/JP3S1ioycuiPl0McFV879FaK1Lqd+6+4W8gHhWtGNkn4Qyb4
	03N0S3rtIFV9/3LubFKlPK5uEkFq6KjXY/iyCkfnyhffUPpqcGArwB0L3aP3e2hJ7hSMN24LmpXcy
	+N2d0/VB+z0k41MI8bqijArRp7s5246d5gXr+jM3CeXjGSfgUFSo08gU5aqeQ9RjOiTWHXpxgEBa1
	XEu60T3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7h4d-0008Uy-JO; Thu, 04 Feb 2021 16:01:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7h4Z-0008To-5H
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 16:01:35 +0000
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
Subject: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
Date: Thu,  4 Feb 2021 17:01:20 +0100
Message-ID: <20210204160129.2249394-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_110135_307624_46FD082F 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204160120.v7aIWoeOjxP-mLmWTbIUud-2um_b8WipJalDgt-hLfc@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
