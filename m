Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F106CC433F5
	for <soc@archiver.kernel.org>; Tue,  5 Apr 2022 09:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5947C385A1; Tue,  5 Apr 2022 09:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8EDC385A2;
	Tue,  5 Apr 2022 09:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649152772;
	bh=M4lqNObJM+r1/tJzivqYIMuiBnctq0svQNzKg4neuPY=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yjh2M0sxhNanoa+2qo0BUYwIE8Ls7P5y/b2wy6rAHZ2AC7FB93nwu8K/mt+Kewexh
	 hPrpFSPuVTD1mYMzYG8M/O3OrlTz/Gi2cOFVuHiodSZG0Aq/oFST0986JhBNLe/yJw
	 TD5DhBp98EDB91ASOqDRMn0P4tDLsYUbzAWGzWko=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5.15 896/913] arm64: dts: ls1046a: Update i2c node dma properties
Date: Tue,  5 Apr 2022 09:32:38 +0200
Message-Id: <20220405070406.678602597@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405070339.801210740@linuxfoundation.org>
References: <20220405070339.801210740@linuxfoundation.org>
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
 


