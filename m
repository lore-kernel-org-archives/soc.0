Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A9DC433EF
	for <soc@archiver.kernel.org>; Tue,  5 Apr 2022 09:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E75EC385A3; Tue,  5 Apr 2022 09:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31C2C385A2;
	Tue,  5 Apr 2022 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649152770;
	bh=EEo7KrgaXtqrkSsjEuUL73k5zwFAAXPPtUO8II4l9/U=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=g2pdlT4SF2bV8Ce3mYbo0qNtZ8AsxtVnpMC2W4tPoJifsYvqWspZ6+mm0RwPU0Rum
	 x1apSmegYYZpYrE4d59yxq62JXYcTAsoxqvZ1sn0Ke0rOgCGM+0/87lekP42318RwX
	 evWNztsJFbPsWTtFeRY5Z8fxesqwn+2wY991V6Qg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5.15 895/913] arm64: dts: ls1043a: Update i2c dma properties
Date: Tue,  5 Apr 2022 09:32:37 +0200
Message-Id: <20220405070406.649128949@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405070339.801210740@linuxfoundation.org>
References: <20220405070339.801210740@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
 


