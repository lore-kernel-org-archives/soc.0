Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D54C433FE
	for <soc@archiver.kernel.org>; Tue,  5 Apr 2022 08:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87191C385A2; Tue,  5 Apr 2022 08:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E87C385A1;
	Tue,  5 Apr 2022 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649147401;
	bh=M4lqNObJM+r1/tJzivqYIMuiBnctq0svQNzKg4neuPY=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=xNPGvWACniD0SOeYpHwDfflNbGjRjHlyahyfKeg6sVNxrsfF0Yngf6hFNBIB87DNF
	 cUXQ/aL9CZpwX80HqJzOM43q0R6h+m2LpbZ0vaMrW2LQIH5pvy3zL6tvU1PBqcPn1g
	 62ioSJEKIpH0wULnxw7McxYIUSYRgCH2cFj1Y6lQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5.17 1111/1126] arm64: dts: ls1046a: Update i2c node dma properties
Date: Tue,  5 Apr 2022 09:30:58 +0200
Message-Id: <20220405070440.045454822@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405070407.513532867@linuxfoundation.org>
References: <20220405070407.513532867@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
 


