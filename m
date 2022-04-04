Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05644C433F5
	for <soc@archiver.kernel.org>; Mon,  4 Apr 2022 11:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEBF0C34111; Mon,  4 Apr 2022 11:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F934C340F3;
	Mon,  4 Apr 2022 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649070374;
	bh=3Pp2c/ajNFBYxYzPeqgnvw3Jj87ZfE/ldSFzCfVO5Mg=;
	h=Subject:List-Id:To:Cc:From:Date:From;
	b=nXc1pF2QQrQ2KET+gtZEDgdLYJMUegd/nQglsmcZVag78f6RHgG5GhSay3/vEw71x
	 dc5S2kTGo5zg3xL46qooWKxmOgla+55550Wu027xSYf0YjvBW8gTemQHBN+tLWVNVV
	 JLMDHiSorLo0ACWe1iWf9TauHLx8Z8tZxselCz2A=
Subject: Patch "arm64: dts: ls1043a: Update i2c dma properties" has been added to the 5.17-stable tree
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,gregkh@linuxfoundation.org,singh.kuldeep87k@gmail.com,soc@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 04 Apr 2022 13:06:03 +0200
Message-ID: <164907036325466@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    arm64: dts: ls1043a: Update i2c dma properties

to the 5.17-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-dts-ls1043a-update-i2c-dma-properties.patch
and it can be found in the queue-5.17 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From aa4df840d1c5eab2bb33695efe4409b3e5526749 Mon Sep 17 00:00:00 2001
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
Date: Sat, 26 Mar 2022 09:53:11 +0530
Subject: arm64: dts: ls1043a: Update i2c dma properties

From: Kuldeep Singh <singh.kuldeep87k@gmail.com>

commit aa4df840d1c5eab2bb33695efe4409b3e5526749 upstream.

Reorder dmas and dma-names properties for i2c controller node to make it
compliant with bindings.

Fixes: 6d453cd22357 ("arm64: dts: add Freescale LS1043a SoC support")
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
CC: soc@kernel.org
Link: https://lore.kernel.org/r/20220326042313.97862-4-singh.kuldeep87k@gmail.com'
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -536,9 +536,9 @@
 			clock-names = "i2c";
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
-			dmas = <&edma0 1 39>,
-			       <&edma0 1 38>;
-			dma-names = "tx", "rx";
+			dmas = <&edma0 1 38>,
+			       <&edma0 1 39>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 


Patches currently in stable-queue which might be from singh.kuldeep87k@gmail.com are

queue-5.17/arm64-dts-ns2-fix-spi-cpol-and-spi-cpha-property.patch
queue-5.17/arm64-dts-ls1043a-update-i2c-dma-properties.patch
queue-5.17/arm64-dts-ls1046a-update-i2c-node-dma-properties.patch
queue-5.17/arm-dts-spear1340-update-serial-node-properties.patch
queue-5.17/arm-dts-spear13xx-update-spi-dma-properties.patch
