Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BD6C433EF
	for <soc@archiver.kernel.org>; Mon,  4 Apr 2022 10:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8FC5C34110; Mon,  4 Apr 2022 10:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564BAC2BBE4;
	Mon,  4 Apr 2022 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649069892;
	bh=z+3Z03Spj3eCipiCCtAOtm+whQsfdLEoahZGsmTZTCU=;
	h=Subject:List-Id:To:Cc:From:Date:From;
	b=mTuwoGsp2J9ejYF5PNndlKwaljlUoLIyuCDEl/pjxf6srhZTiCWSoFpGIFatTJoOw
	 K4s3/1xmtHFknznCcZ9/pTzrX1/I5Hhza8YkumzWPRAr8voh/LPzzUBkiZlE+rxhGS
	 3YeAl8iCjVAaOnWgAXL8o4ZWtFgMGQdPM5m9gXtc=
Subject: Patch "arm64: dts: ls1046a: Update i2c node dma properties" has been added to the 5.15-stable tree
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,gregkh@linuxfoundation.org,singh.kuldeep87k@gmail.com,soc@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 04 Apr 2022 12:57:56 +0200
Message-ID: <1649069876148249@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    arm64: dts: ls1046a: Update i2c node dma properties

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-dts-ls1046a-update-i2c-node-dma-properties.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From eeeb4f1075d71d67083c75f69247206e9b3d9f4a Mon Sep 17 00:00:00 2001
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
Date: Sat, 26 Mar 2022 09:53:12 +0530
Subject: arm64: dts: ls1046a: Update i2c node dma properties

From: Kuldeep Singh <singh.kuldeep87k@gmail.com>

commit eeeb4f1075d71d67083c75f69247206e9b3d9f4a upstream.

Reorder dmas and dma-names properties for i2c controller node to make it
compliant with bindings.

Fixes: 8126d88162a5 ("arm64: dts: add QorIQ LS1046A SoC support")
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
CC: soc@kernel.org
Link: https://lore.kernel.org/r/20220326042313.97862-5-singh.kuldeep87k@gmail.com'
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -499,9 +499,9 @@
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
-			dmas = <&edma0 1 39>,
-			       <&edma0 1 38>;
-			dma-names = "tx", "rx";
+			dmas = <&edma0 1 38>,
+			       <&edma0 1 39>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 


Patches currently in stable-queue which might be from singh.kuldeep87k@gmail.com are

queue-5.15/arm64-dts-ns2-fix-spi-cpol-and-spi-cpha-property.patch
queue-5.15/arm64-dts-ls1043a-update-i2c-dma-properties.patch
queue-5.15/arm64-dts-ls1046a-update-i2c-node-dma-properties.patch
queue-5.15/arm-dts-spear1340-update-serial-node-properties.patch
queue-5.15/arm-dts-spear13xx-update-spi-dma-properties.patch
