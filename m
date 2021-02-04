Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7D2C433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 16:24:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A796564F46; Thu,  4 Feb 2021 16:24:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E86A64E3F;
	Thu,  4 Feb 2021 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612455861;
	bh=wuLYYCwHZMgbt5nb9mtubFyVtmrl2W2eCyuwFcHaNbs=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=m9wBdgig1UeBzClRQ7pMKJ64pQq2qG9bImmw4EEr2f503Xfvk33cfAY0SybbEJFp6
	 JXA/qP3TemjfV4XKESPe63nWMAstO+MY90daY5qd+uOf3WY7oIUQDrD/hxE4OxllUi
	 xDIaS65nnywORZZOAkNA2+I3bLnamqWrayxSbO+TySz+Y08Olnsrt4Mw52kae2uKLR
	 6B36AsZCVIMWXy03cXLz0bOmIDV4x1HJWW7WImaHg4+oHcFMOlOO+w9B6Y6wbN+JNS
	 wUEuiI50JJ5/JM5sEJgSM+hs2SLcpkqTYJ2/OqaNJTkUyfc+uOdtzE+R4zihuuVXlO
	 dgUMjVu5f/xIQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
List-Id: <soc.lore.kernel.org>
Cc: Ben Dooks <ben-linux@fluff.org>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Agner <stefan@agner.ch>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH] ARM: s3c: fix fiq for clang IAS
Date: Thu,  4 Feb 2021 17:23:42 +0100
Message-Id: <20210204162416.3030114-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building with the clang integrated assembler produces a couple of
errors for the s3c24xx fiq support:

arch/arm/mach-s3c/irq-s3c24xx-fiq.S:52:2: error: instruction 'subne' can not set flags, but 's' suffix specified
 subnes pc, lr, #4 @@ return, still have work to do
 ^
arch/arm/mach-s3c/irq-s3c24xx-fiq.S:64:1: error: invalid symbol redefinition
s3c24xx_spi_fiq_txrx:
^
arch/arm/mach-s3c/irq-s3c24xx-fiq.S:79:2: error: instruction 'subne' can not set flags, but 's' suffix specified
 subnes pc, lr, #4 @@ return, still have work to do
 ^
arch/arm/mach-s3c/irq-s3c24xx-fiq.S:104:2: error: instruction 'subne' can not set flags, but 's' suffix specified
 subnes pc, lr, #4 @@ return, still have work to do

There are apparently two problems: one with extraneous or duplicate
labels, and one with old-style opcode mnemonics. Stefan Agner has
previously fixed other problems like this, but missed this particular
file.

Fixes: bec0806cfec6 ("spi_s3c24xx: add FIQ pseudo-DMA support")
Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
index b54cbd012241..5d238d9a798e 100644
--- a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
+++ b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
@@ -35,7 +35,6 @@
 	@ and an offset to the irq acknowledgment word
 
 ENTRY(s3c24xx_spi_fiq_rx)
-s3c24xx_spi_fix_rx:
 	.word	fiq_rx_end - fiq_rx_start
 	.word	fiq_rx_irq_ack - fiq_rx_start
 fiq_rx_start:
@@ -49,7 +48,7 @@ fiq_rx_start:
 	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
 
 	subs	fiq_rcount, fiq_rcount, #1
-	subnes	pc, lr, #4		@@ return, still have work to do
+	subsne	pc, lr, #4		@@ return, still have work to do
 
 	@@ set IRQ controller so that next op will trigger IRQ
 	mov	fiq_rtmp, #0
@@ -61,7 +60,6 @@ fiq_rx_irq_ack:
 fiq_rx_end:
 
 ENTRY(s3c24xx_spi_fiq_txrx)
-s3c24xx_spi_fiq_txrx:
 	.word	fiq_txrx_end - fiq_txrx_start
 	.word	fiq_txrx_irq_ack - fiq_txrx_start
 fiq_txrx_start:
@@ -76,7 +74,7 @@ fiq_txrx_start:
 	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
 
 	subs	fiq_rcount, fiq_rcount, #1
-	subnes	pc, lr, #4		@@ return, still have work to do
+	subsne	pc, lr, #4		@@ return, still have work to do
 
 	mov	fiq_rtmp, #0
 	str	fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
@@ -88,7 +86,6 @@ fiq_txrx_irq_ack:
 fiq_txrx_end:
 
 ENTRY(s3c24xx_spi_fiq_tx)
-s3c24xx_spi_fix_tx:
 	.word	fiq_tx_end - fiq_tx_start
 	.word	fiq_tx_irq_ack - fiq_tx_start
 fiq_tx_start:
@@ -101,7 +98,7 @@ fiq_tx_start:
 	strb	fiq_rtmp, [ fiq_rspi, # S3C2410_SPTDAT ]
 
 	subs	fiq_rcount, fiq_rcount, #1
-	subnes	pc, lr, #4		@@ return, still have work to do
+	subsne	pc, lr, #4		@@ return, still have work to do
 
 	mov	fiq_rtmp, #0
 	str	fiq_rtmp, [ fiq_rirq, # S3C2410_INTMOD  - S3C24XX_VA_IRQ ]
-- 
2.29.2

