Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DDFC433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:19:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0829A64EB1; Wed, 10 Feb 2021 17:19:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BB3464EAA;
	Wed, 10 Feb 2021 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977541;
	bh=ttjPRouIOPlSkyqjYj/ltvyLuVoeWCC/qc6EwvnywPw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DuT9+Ip683GFvV2jF7y5QdbomjYOsXM3OkgrtjcbtFatjEsE9WssJV/fdDjDBWTWd
	 Op6NzThGXPjQUm1rXATv90+BiTA1K28fbXa5ILBXSQEwqp4vdOB/fXB4/Et+fhlxtn
	 It+5yD6OdI+ULdADTQUi6m0i2TaEz4FT9tm/N23QSk80vhVTC67SyeTtlqancV0JmY
	 Ym0kRF/JuyQOYnchclYGRE0dHddY/gEwRrd8QMFCu95J8viC3JaHltMeMCWFVRVTzy
	 9/Jh48QKuJypAvJ2CA9ugNftRvwrYboTe57uaQr0g7GNPJRDGSRDXOM8Cg3TtNkGxQ
	 z/5sJvsiCY3ow==
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
Subject: [PATCH 03/11] arm64: dts: intel: socfpga: override clocks by label
Date: Wed, 10 Feb 2021 18:18:15 +0100
Message-Id: <20210210171823.333802-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using full paths to extend or override a device tree node is error
prone.  If there was a typo error, a new node will be created instead of
extending the existing node.  This will lead to run-time errors that
could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts   | 12 ++++--------
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts     | 12 ++++--------
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts      | 12 ++++--------
 3 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index a7a83f29f00b..f14a89ca8784 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -41,14 +41,6 @@ memory {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0 0 0 0>;
 	};
-
-	soc {
-		clocks {
-			osc1 {
-				clock-frequency = <25000000>;
-			};
-		};
-	};
 };
 
 &gpio1 {
@@ -92,6 +84,10 @@ &mmc {
 	bus-width = <4>;
 };
 
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
index 979aa59a6bd0..58a827a5e83f 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
@@ -41,14 +41,6 @@ memory {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0 0 0 0>;
 	};
-
-	soc {
-		clocks {
-			osc1 {
-				clock-frequency = <25000000>;
-			};
-		};
-	};
 };
 
 &gpio1 {
@@ -121,6 +113,10 @@ partition@4280000 {
 	};
 };
 
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
index 5f56e2697fee..01f1307ce4ac 100644
--- a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
@@ -23,14 +23,6 @@ memory {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0 0 0 0>;
 	};
-
-	soc {
-		clocks {
-			osc1 {
-				clock-frequency = <25000000>;
-			};
-		};
-	};
 };
 
 &clkmgr {
@@ -44,6 +36,10 @@ &mmc {
 	bus-width = <4>;
 };
 
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.25.1

