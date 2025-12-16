Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F628335577
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 20:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765916876; cv=none; b=iR7z73fSwusoKV4DYncRDTZOCNxFfackpc+cLDw99YpZOpDGZ8CKhCNvi5S/wNQvAP86rqnUMsGYvezn8AOw4jpLSNjVq34R81KdufUaQuppkwwQ5yNVy/U7E16gxNJWKN2UWBaTeB6l/ancluUH0wTKBtXSkOaewPpVkL5+ggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765916876; c=relaxed/simple;
	bh=CQnLNaUMLjZ+wdq9bP5dhtGT0NQKX6rSsW7oxrquADQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4gng/gyKQZogWT2PJjLqLRZcvahPs3OYExcOrbQ4LnDw/tRcbfC9PEva+Dq1Kd0kjo6N5baB+HeyDriw7F3sblFu7LLIejbuSVnvK0NMGsGpSqOni7YgYZm0LAxWW1WbcVhX2id+PQXYPFbKCMP+ry6sbup5EMqt6MPOSDDmSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rzj42V31; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rzj42V31"
Received: by smtp.kernel.org (Postfix)
	id 02B52C4CEFB; Tue, 16 Dec 2025 20:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47E0C4CEF1;
	Tue, 16 Dec 2025 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765916875;
	bh=CQnLNaUMLjZ+wdq9bP5dhtGT0NQKX6rSsW7oxrquADQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rzj42V31tpyZxM/f77rMKpBA9ZAVxD+ZlqFc+wpdxcbPgRgsfUW3vUFoMuuH5o8+N
	 BqR8CSZ4iyZTwi7Qr2Nh5WUDKUy73FLmNvltcQKEuGrmnnIpCNibAHKMOkqdNYYc1y
	 kPxXLQKaZ19j1K7Lt1zsbmNQ+Kn2eUx3a2Xi1tUDZzD92a5zydQbAWmZs/Uwp8etLu
	 NIVbgLG10XTnmBdIec+78qb/heV3ePPrZVBD9WRW8PYhk3e6OWW0Pts4qt0BUe9w1b
	 SGHDdtpyqJpJBUfb5cvoF0kTC3IJGvvl+onyAHt36zNBuwELIMmRVOjG4pDQ+wbtjG
	 KeP91owDRLWBA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 16 Dec 2025 14:27:48 -0600
Subject: [PATCH 1/4] arm64: dts: apm/shadowcat: More clock clean-ups
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dt-apm-v1-1-0bf2bf8b982c@kernel.org>
References: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
In-Reply-To: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
To: soc@kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

A fixed-factor-clock only provides 1 clock, so "#clock-cells" must be 0.

The "snps,designware-i2c" node is not a clock provider, so drop
"#clock-cells.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index 5bbedb0a7107..032d37a32193 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -295,7 +295,7 @@ socpll: socpll@17000120 {
 
 			socplldiv2: socplldiv2  {
 				compatible = "fixed-factor-clock";
-				#clock-cells = <1>;
+				#clock-cells = <0>;
 				clocks = <&socpll 0>;
 				clock-mult = <1>;
 				clock-div = <2>;
@@ -305,7 +305,7 @@ socplldiv2: socplldiv2  {
 			ahbclk: ahbclk@17000000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x17000000 0x0 0x2000>;
 				reg-names = "div-reg";
 				divider-offset = <0x164>;
@@ -329,7 +329,7 @@ sbapbclk: sbapbclk@1704c000 {
 			sdioclk: sdioclk@1f2ac000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f2ac000 0x0 0x1000
 					0x0 0x17000000 0x0 0x2000>;
 				reg-names = "csr-reg", "div-reg";
@@ -346,7 +346,7 @@ sdioclk: sdioclk@1f2ac000 {
 			pcie0clk: pcie0clk@1f2bc000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f2bc000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "pcie0clk";
@@ -355,7 +355,7 @@ pcie0clk: pcie0clk@1f2bc000 {
 			pcie1clk: pcie1clk@1f2cc000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f2cc000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				clock-output-names = "pcie1clk";
@@ -364,7 +364,7 @@ pcie1clk: pcie1clk@1f2cc000 {
 			xge0clk: xge0clk@1f61c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f61c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				enable-mask = <0x3>;
@@ -375,7 +375,7 @@ xge0clk: xge0clk@1f61c000 {
 			xge1clk: xge1clk@1f62c000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x1f62c000 0x0 0x1000>;
 				reg-names = "csr-reg";
 				enable-mask = <0x3>;
@@ -386,7 +386,7 @@ xge1clk: xge1clk@1f62c000 {
 			rngpkaclk: rngpkaclk@17000000 {
 				compatible = "apm,xgene-device-clock";
 				#clock-cells = <1>;
-				clocks = <&socplldiv2 0>;
+				clocks = <&socplldiv2>;
 				reg = <0x0 0x17000000 0x0 0x2000>;
 				reg-names = "csr-reg";
 				csr-offset = <0xc>;
@@ -799,7 +799,6 @@ i2c1: i2c@10511000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x0 0x10511000 0x0 0x1000>;
 			interrupts = <0 0x45 0x4>;
-			#clock-cells = <1>;
 			clocks = <&sbapbclk 0>;
 		};
 

-- 
2.51.0

