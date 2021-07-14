Return-Path: <SRS0=F2nd=MG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843F8C07E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 09:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587F261073
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jul 2021 09:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587F261073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zj285Z5UAxaXN0ku+rrc52GmnHks5yafHxDiNdTF7QE=; b=A/ujTe0RTgkXXc
	xgTkCtDjgZiQ+sp1uG9MPA4ZDKcXw//sy3ukMRCq9bUG3GjWtmnKP14JloKjOsOHmrc0iz0p9xVNf
	DEot5/G1fKZqm8f5hzy1D1GJImXpczqf96C8pi8G7sSwoDEUFRuMwT9K8Jyutx0tl43CmQXVy3tfC
	X+FPACMSe4v96EqW4uwCgmGNYqy/2WsD0XyewQygMPzLrZM6aS1o5VA12j30NCJhLgCQrMKo47fN8
	et3SaJrNIdgUnd213oHcXSkgVH3wzmEEkMS8y7QV3IwtJW2ieYywdm/AbLfe6OvkwMV9uqJ5nXgrc
	Et3OXIP4a+tlnbqD73Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3bHA-00Cvko-LX; Wed, 14 Jul 2021 09:33:56 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3bH6-00CvjA-K5
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Jul 2021 09:33:54 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by michel.telenet-ops.be with bizsmtp
 id UxZl2500H1ccfby06xZlEd; Wed, 14 Jul 2021 11:33:45 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3bGz-0015V1-0Z; Wed, 14 Jul 2021 11:33:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3bGy-00A3Cq-Ay; Wed, 14 Jul 2021 11:33:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm: Typo s/PCI_IXP4XX_LEGACY/IXP4XX_PCI_LEGACY/
Date: Wed, 14 Jul 2021 11:33:43 +0200
Message-ID: <82ce37c617293521f095a945a255456b9512769c.1626255077.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_023352_881348_C277FE29 
X-CRM114-Status: GOOD (  11.66  )
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
Message-ID: <20210714093343.5gLDCp_pbwEgzQPQmDgznM2JkmD80Ctmngb76_G-srE@z>

Kconfig symbol PCI_IXP4XX_LEGACY does not exist, but IXP4XX_PCI_LEGACY
does.

Fixes: d5d9f7ac58ea1041 ("ARM/ixp4xx: Make NEED_MACH_IO_H optional")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
v2:
  - Add Reviewed-by.
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3ea1c417339ff6bb..82f908fa5676ac15 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -395,7 +395,7 @@ config ARCH_IXP4XX
 	select IXP4XX_IRQ
 	select IXP4XX_TIMER
 	# With the new PCI driver this is not needed
-	select NEED_MACH_IO_H if PCI_IXP4XX_LEGACY
+	select NEED_MACH_IO_H if IXP4XX_PCI_LEGACY
 	select USB_EHCI_BIG_ENDIAN_DESC
 	select USB_EHCI_BIG_ENDIAN_MMIO
 	help
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
