Return-Path: <mani@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6E6C2B9F4
	for <soc@archiver.kernel.org>; Mon, 28 Jun 2021 07:28:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C1BA661C31; Mon, 28 Jun 2021 07:28:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58C0A61AC0;
	Mon, 28 Jun 2021 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624865315;
	bh=aMxSwzUPfiY+R6sibvgkSCcIdxzU2psw3KiAkUjVPLM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=McHX3vwpmZejGt2gIlbxuB1p7eofMdlTNLidFZyWZOAnFYCywvtp93SJUVl73Em1o
	 kTauRkeYkDFgSOYuBZ5Y28iBVwBG+zLfkt/6fNYCRNyWv7u/RWY6riheDMNOsrPgJQ
	 f0/01QQjcFwCNKqMFntt65ELgM3fRzNIhzIsFeu7o3v11vmcqve+FfXAty8qnqPrb2
	 XMqN1HPH34D/xKZIS5YlvI35VUK9JpZgUhtlKnxf4VvyjZoAvsd83CazcrKaAiCqNo
	 skBJsf+fkvqeyC7AlsseJrkVyXfb8jhGHOoYOY9bT9H6n76rFXvYTQr6GX2P46Usy5
	 W9IleD5aBbKgw==
From: Manivannan Sadhasivam <mani@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: olof@lixom.net,
	arnd@arndb.de,
	afaerber@suse.de,
	linux-actions@lists.infradead.org,
	thomas.liau@actions-semi.com,
	cristian.ciocaltea@gmail.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH 2/2] ARM: dts: owl-s500-roseapplepi: Add ethernet support
Date: Mon, 28 Jun 2021 12:58:17 +0530
Message-Id: <20210628072817.8269-3-mani@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628072817.8269-1-mani@kernel.org>
References: <20210628072817.8269-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Add pinctrl configuration for enabling the Ethernet MAC on RoseapplePi
SBC. Additionally, provide the necessary properties for the generic S500
ethernet node in order to setup PHY and MDIO.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/d0e1fbf81984127f0352eb740c7129424b5e40f9.1623401998.git.cristian.ciocaltea@gmail.com
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm/boot/dts/owl-s500-roseapplepi.dts | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/owl-s500-roseapplepi.dts b/arch/arm/boot/dts/owl-s500-roseapplepi.dts
index b8c5db2344aa..eb555f385283 100644
--- a/arch/arm/boot/dts/owl-s500-roseapplepi.dts
+++ b/arch/arm/boot/dts/owl-s500-roseapplepi.dts
@@ -225,6 +225,27 @@ bias1-pinconf {
 			bias-pull-down;
 		};
 	};
+
+	ethernet_pins: ethernet-pins {
+		eth_rmii-pinmux {
+			groups = "rmii_txd0_mfp", "rmii_txd1_mfp",
+				 "rmii_rxd0_mfp", "rmii_rxd1_mfp",
+				 "rmii_txen_mfp", "rmii_rxen_mfp",
+				 "rmii_crs_dv_mfp", "rmii_ref_clk_mfp";
+			function = "eth_rmii";
+		};
+
+		phy_clk-pinmux {
+			groups = "clko_25m_mfp";
+			function = "clko_25m";
+		};
+
+		ref_clk-pinconf {
+			groups = "rmii_ref_clk_drv";
+			drive-strength = <2>;
+		};
+
+	};
 };
 
 /* uSD */
@@ -241,6 +262,30 @@ &mmc0 {
 	vqmmc-supply = <&sd_vcc>;
 };
 
+&ethernet {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&pinctrl 88 GPIO_ACTIVE_LOW>; /* GPIOC24 */
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <150000>;
+
+		eth_phy: ethernet-phy@3 {
+			reg = <0x3>;
+			max-speed = <100>;
+			interrupt-parent = <&sirq>;
+			interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
 &twd_timer {
 	status = "okay";
 };
-- 
2.25.1

