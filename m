Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD1FC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 16:22:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21CA965227; Mon,  8 Mar 2021 16:22:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F9DD6521F;
	Mon,  8 Mar 2021 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615220566;
	bh=MiNA1/sAgsAObqJ0tYp3uC1FL30SQ9+KFVnoH2XDBLY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2MfF+dDTbMmDrowZOR5yWhk3BX/EI0D9Z4zxrtgy2tVnQXWEEKNC+HL33Sa+4FJm
	 KUSGJE05BSUJg3+C6rD9hlCW4cnkOCwbdy1Et7PQrI2lzNwijOcgd4x8fMzI8Y2QQn
	 I10wtYY6MMKtP5RQjN0X23i2SYeY/7MHCkz2nY6/hxjy/HK6lftqYtl4ZdUUSgLG5y
	 zNmS+RCZA+BZNbe5LpqYyR4EP1uQYYG7D+IcY+qTU15dDjXLCWhvTf7ozfCo23FL+W
	 ApRE4YrS1SBl0M/L/KdptnD3eQLqN6WsN+zhyolCiGOTitIXaWu+TXqFEOG+bBZ0Ev
	 xfNHTLhAeZsyQ==
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
Subject: [RESEND PATCH 04/10] arm64: dts: intel: socfpga_agilex: move timer out of soc node
Date: Mon,  8 Mar 2021 17:22:22 +0100
Message-Id: <20210308162228.62614-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308162228.62614-1-krzk@kernel.org>
References: <20210308162228.62614-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARM architected timer is part of ARM CPU design therefore by
convention it should not be inside the soc node.  This also fixes dtc
warning like:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:410.9-416.5:
        Warning (simple_bus_reg): /soc/timer: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 8f0736e4f3b5..25882faccbdb 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -115,6 +115,15 @@ qspi_clk: qspi-clk {
 		};
 	};
 
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <1 13 0xf08>,
+			     <1 14 0xf08>,
+			     <1 11 0xf08>,
+			     <1 10 0xf08>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -406,15 +415,6 @@ sysmgr: sysmgr@ffd12000 {
 			reg = <0xffd12000 0x500>;
 		};
 
-		/* Local timer */
-		timer {
-			compatible = "arm,armv8-timer";
-			interrupts = <1 13 0xf08>,
-				     <1 14 0xf08>,
-				     <1 11 0xf08>,
-				     <1 10 0xf08>;
-		};
-
 		timer0: timer0@ffc03000 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <0 113 4>;
-- 
2.25.1

