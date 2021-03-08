Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A7CC433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 16:22:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 818F06522F; Mon,  8 Mar 2021 16:22:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0B9160241;
	Mon,  8 Mar 2021 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615220570;
	bh=WjQucMJgoQboQ4KTxNtenpqSOnYqYfMkrfDLFuaJnOM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ViUStSZg6Pzi0fmtfT9braAo33N/AcfLgpA6uX7E7LvbM1erbRJhFTPolG8iAPGbA
	 FK7E1ACIcZ0jaeYYioVOf5lm8K0mLQXNvzLw137KGndlytmFCqiPeSfJ/bHIfE2aB9
	 hif7L1qmPfCG347TKywHODtSXXTCdhk2AOmiZzRe9CZptjf04Z9EaPQ2O3E13dP8fO
	 P0zLW/EFKzo7YCmi5bos7Bc8ULjX9WpVDDW0qse6QQZnIRr9wtc/l37ZwGuTkCLyzz
	 Vuhj0fCrGCMSeolkGFLkqQ8UGQ8E8eZdTn1HfCP7RFipJ7uFF5bexJ1Z84tdTkeThE
	 Y7fr+o46zUHOQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 06/10] arm64: dts: intel: socfpga_agilex: move usbphy out of soc node
Date: Mon,  8 Mar 2021 17:22:24 +0100
Message-Id: <20210308162228.62614-7-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308162228.62614-1-krzk@kernel.org>
References: <20210308162228.62614-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usual usb-nop-xceiv USB phy node should be under root node, to fix
dtc warning:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:472.21-476.5:
        Warning (simple_bus_reg): /soc/usbphy@0: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index f46d678ba775..103de0a91e60 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -124,6 +124,11 @@ timer {
 			     <1 10 0xf08>;
 	};
 
+	usbphy0: usbphy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -469,11 +474,6 @@ uart1: serial1@ffc02100 {
 			status = "disabled";
 		};
 
-		usbphy0: usbphy@0 {
-			#phy-cells = <0>;
-			compatible = "usb-nop-xceiv";
-		};
-
 		usb0: usb@ffb00000 {
 			compatible = "snps,dwc2";
 			reg = <0xffb00000 0x40000>;
-- 
2.25.1

