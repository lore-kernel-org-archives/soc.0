Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB2CC433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:19:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DFA1964EC8; Wed, 10 Feb 2021 17:19:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36E4164EC6;
	Wed, 10 Feb 2021 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977547;
	bh=c/Ax+KU4DL5JozYwTOkjNe1K5hw5XVOa51fa//wHaxA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J7twu9oruKBFHatLyOM8x1cg1lnIeAvQMkeWMxdW8Gi0yfefNN+W23FnELWHQr/Bf
	 g+gKio7xoxnGayi6PvCzaLK5Ye47K22iBS19pc0cS85eW8xwL9jMNWVAM90ycSdPS4
	 37/6A7MXJDyZQ79e+kW114NVT/eDjGFNLsj3JfuO1TqBtisAHbywEnFhi0ByomBzq0
	 kDJ09W45kn6CALhspPGWbGJ5vpxDdgz0CiM2WZjwHvGaDGQ/mfTKEtkY12+CDnUY7Q
	 piPSxgvbFeoHUy7E9Df7dkGbAsluPdKlM4dYb0ixz+lRyxGG0gKL09FoV7ta8raPh3
	 y0dsd+DIAsFlA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 05/11] arm64: dts: intel: socfpga_agilex: move timer out of soc node
Date: Wed, 10 Feb 2021 18:18:17 +0100
Message-Id: <20210210171823.333802-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
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
index 12b6d208e236..30dcf9978067 100644
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

