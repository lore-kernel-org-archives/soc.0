Return-Path: <mani@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B35C2B9F4
	for <soc@archiver.kernel.org>; Mon, 28 Jun 2021 07:28:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC2E561C31; Mon, 28 Jun 2021 07:28:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB07A61C2F;
	Mon, 28 Jun 2021 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624865311;
	bh=iPOIbgLAyFE2QQLWUh74/OjEiBGdZObPx5IMvJLXJPc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/KQUhUqssOdJc98VCBNK7ZJWZt+C8eE+Nh+Kkp0c8A75BXyVm5zMmPFz9VoD0KPL
	 z0o1zY6LK02E95kY/1rm85wbI/TWDlz7+KpOuDMxOPzp8Lb7RDcN2hBwS+bt8TZ6cM
	 RMJQIz5OskKTCAyoOJpWZ/rP+ID0Hrntj4NE+s3mBcrKCshCWPtP0kkfSwt8yrtSif
	 G+DVrdB26TnHsN1GVpgcVXf41q6sZCmB/H3ymFTIqa6TeonKWiyZuosianYCvTy49j
	 D/Wn3ofPnkekxb+tS+rtHygeELkqm1p5mNHB+n9ligXRzXA8yatQ4eFx3Iqymu0QVz
	 xaJasr2jl7AzA==
From: Manivannan Sadhasivam <mani@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: olof@lixom.net,
	arnd@arndb.de,
	afaerber@suse.de,
	linux-actions@lists.infradead.org,
	thomas.liau@actions-semi.com,
	cristian.ciocaltea@gmail.com,
	kernel test robot <lkp@intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH 1/2] ARM: dts: owl-s500: Add ethernet support
Date: Mon, 28 Jun 2021 12:58:16 +0530
Message-Id: <20210628072817.8269-2-mani@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628072817.8269-1-mani@kernel.org>
References: <20210628072817.8269-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Add Ethernet MAC device tree node for Actions Semi S500 SoC.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/222ee0c2cb431619f558dce9726585ac92f65e00.1623401998.git.cristian.ciocaltea@gmail.com
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm/boot/dts/owl-s500.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/owl-s500.dtsi b/arch/arm/boot/dts/owl-s500.dtsi
index cd635f222d26..739b4b9cec8c 100644
--- a/arch/arm/boot/dts/owl-s500.dtsi
+++ b/arch/arm/boot/dts/owl-s500.dtsi
@@ -324,5 +324,15 @@ mmc2: mmc@b0238000 {
 			dma-names = "mmc";
 			status = "disabled";
 		};
+
+		ethernet: ethernet@b0310000 {
+			compatible = "actions,s500-emac", "actions,owl-emac";
+			reg = <0xb0310000 0x10000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu CLK_ETHERNET>, <&cmu CLK_RMII_REF>;
+			clock-names = "eth", "rmii";
+			resets = <&cmu RESET_ETHERNET>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1

