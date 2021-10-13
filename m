Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C41C433F5
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 14:38:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C0A4160C40; Wed, 13 Oct 2021 14:38:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3F83610A2;
	Wed, 13 Oct 2021 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634135908;
	bh=pKAOnpyNJuH6mLdV9073fxUIwetuDafsmOfvDdIRucA=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=iFmzELGTJbaYDy5hDE3CkewtspqSh3XDRou4fSHcLaMqPPxF3GbQ24FihxnjvlN/2
	 LPte7I6suCAMCGzOnotci6srObn+QnEisraz3Q42Te22NEjw+I9QLb6lmmZCvdAxGr
	 o3u3EWV6p8vkKL30SyQjpDrR7beKu7q7XcsbBFmhZT/vyUMS2orMKx5ac1u2AtFYDa
	 mA2+TRo6YYGWrIGlkMcCHQyShqimvFIKit1bmmLSfrvxHT6C763MTRJz+57y0qyZUr
	 Cuy8V3CgT6Gz7eY7O5Baxas7CHjm7CvCG6upGrE5dUpte+jOoALJNJmfVwBiJVHcx9
	 Y/FyJACtGRC7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Chanho Park <chanho61.park@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: exynos: fix cpu unit name warnings
Date: Wed, 13 Oct 2021 16:37:44 +0200
Message-Id: <20211013143810.2101838-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013143810.2101838-1-arnd@kernel.org>
References: <20211013143810.2101838-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

dtc started warning about some of the CPU addresses:

arch/arm64/boot/dts/exynos/exynosautov9.dtsi:78.20-83.5: Warning (unit_address_format): /cpus/cpu@000000: unit name should not have leading 0s
arch/arm64/boot/dts/exynos/exynosautov9.dtsi:85.20-90.5: Warning (unit_address_format): /cpus/cpu@000100: unit name should not have leading 0s
arch/arm64/boot/dts/exynos/exynosautov9.dtsi:92.20-97.5: Warning (unit_address_format): /cpus/cpu@000200: unit name should not have leading 0s
arch/arm64/boot/dts/exynos/exynosautov9.dtsi:99.20-104.5: Warning (unit_address_format): /cpus/cpu@000300: unit name should not have leading 0s

Remove the leading zeroes.

Fixes: f695b3f4c45d ("arm64: dts: exynos: add initial support for exynosautov9 SoC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 1dd1d73a52b8..284a7adb474a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -75,28 +75,28 @@ core3 {
 			};
 		};
 
-		cpu0: cpu@000000 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0>;
 			enable-method = "psci";
 		};
 
-		cpu1: cpu@000100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x100>;
 			enable-method = "psci";
 		};
 
-		cpu2: cpu@000200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x200>;
 			enable-method = "psci";
 		};
 
-		cpu3: cpu@000300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x300>;
-- 
2.29.2

