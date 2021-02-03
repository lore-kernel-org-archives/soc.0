Return-Path: <SRS0=NF4K=HF=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C66DC433DB
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 09:03:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3E65264F91; Wed,  3 Feb 2021 09:03:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D1464E24
	for <soc@kernel.org>; Wed,  3 Feb 2021 09:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6D1464E24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.belloni@bootlin.com
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 067791C0002;
	Wed,  3 Feb 2021 09:03:20 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:03:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Vladimir Zapolskiy <vz@mleia.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH RESEND v2] ARM: dts: lpc32xx: Revert set default clock rate
 of HCLK PLL
Message-ID: <20210203090320.GA3760268@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.29.2

This reverts commit c17e9377aa81664d94b4f2102559fcf2a01ec8e7.

The lpc32xx clock driver is not able to actually change the PLL rate as
this would require reparenting ARM_CLK, DDRAM_CLK, PERIPH_CLK to SYSCLK,
then stop the PLL, update the register, restart the PLL and wait for the
PLL to lock and finally reparent ARM_CLK, DDRAM_CLK, PERIPH_CLK to HCLK
PLL.

Currently, the HCLK driver simply updates the registers but this has no
real effect and all the clock rate calculation end up being wrong. This is
especially annoying for the peripheral (e.g. UARTs, I2C, SPI).

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Arnd,

This is a very important fix that was sent back in may and october 2019 without
any reply from the maintainers, please consider applying it so it can be
backported on v5.10.

 arch/arm/boot/dts/lpc32xx.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 3a5cfb0ddb20..c87066d6c995 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -326,9 +326,6 @@ clk: clock-controller@0 {
 
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
-
-					assigned-clocks = <&clk LPC32XX_CLK_HCLK_PLL>;
-					assigned-clock-rates = <208000000>;
 				};
 			};
 
-- 
2.29.2

