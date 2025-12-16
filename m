Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F75313E1D
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 18:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908080; cv=none; b=C1UDghW45X/9O0Pe3Lp7+vy8yoGg3A9A8zkzDy4iD1p+4dP7WL73bkLUwBwqht1RAEAudkRr4+JOWpEBR2CgO1CH2oInS1fvVO2ENM35Jnm+Uu5W74n8XUkAlaCVNb6M+9ahe3Eoibng1js+HEcpgn7tGx0gv5rRIXlt55bkM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908080; c=relaxed/simple;
	bh=UKbvHEFdrbGA70W2Vp+q+A5UUZFxp7s4Z2HxcK440Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBGFjQAXRadaNdYCE69q8OAa9Aq+wceRBqlsu+4T8FD388cjbOqCyfkwoSTcpmn/UUM2yk+AgzE/wiaDQjLV9QfvIzGR8+dTCJDsmfjWkCMknCCL2PZOV6DiHtMoyXBaP0Mjiom4yHPVtY5V4XWK3KB47KNX4pwSwf3lD0vwiZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLSy2oum; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLSy2oum"
Received: by smtp.kernel.org (Postfix)
	id 356F6C113D0; Tue, 16 Dec 2025 18:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8E3C4CEF1;
	Tue, 16 Dec 2025 18:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908080;
	bh=UKbvHEFdrbGA70W2Vp+q+A5UUZFxp7s4Z2HxcK440Tw=;
	h=From:To:Cc:Subject:Date:From;
	b=OLSy2oumnMUuLjA6kChb6sehsEOr4pZYYgFz1ab08CgzmpgGCngCdfQSpoNEOe7DG
	 ChZkA31NDloUjKxbr+LWK4Ad5nNxJlggPbo4vn1kgYS/pieSTKlNLZIkB3HfncmHyC
	 ld6Ybj7cKKEl7FcuUMoR+qtG0FIJ3jJcgS5WfOj3tnC8JkhlSYOER4VsdSbQdi7COs
	 5zYOlmIXjvkjDBrDkX3svjd7c6fIYd+p1hIBShxITPnxNrI3SEuSk3VYKS3d1K4z9t
	 tpG5aim5Lafa/Oe8Z43LoZQKnGHDsG88joj7OxgtfqL8M89TB6oHk7r2C7b3rolcSz
	 mxMq7KOkgwnWA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: toshiba: Use recommended node names
Date: Tue, 16 Dec 2025 12:00:54 -0600
Message-ID: <20251216180055.2793215-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Toshiba TMPV7708 node name to the recommended standard node
names. Generally, node names and paths aren't considered ABI, so it
is safe to change them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.

 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts      | 2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts  | 2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi | 2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi             | 4 ++--
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
index d209fdc98597..8d099b237025 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
@@ -43,7 +43,7 @@ &piether {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
index ed7aa7e457b1..4439b3e8acbb 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
@@ -43,7 +43,7 @@ &piether {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
index 0c8321022a73..af406f7285c4 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
@@ -26,7 +26,7 @@ &spi0_pins {
 &spi0 {
 	status = "okay";
 
-	mmc-slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
index 9aa7b1872bd6..88e38d6efcaa 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -161,7 +161,7 @@ gic: interrupt-controller@24001000 {
 			      <0 0x24006000 0 0x2000>;
 		};
 
-		pmux: pmux@24190000 {
+		pmux: pinctrl@24190000 {
 			compatible = "toshiba,tmpv7708-pinctrl";
 			reg = <0 0x24190000 0 0x10000>;
 		};
@@ -463,7 +463,7 @@ piether: ethernet@28000000 {
 			status = "disabled";
 		};
 
-		wdt: wdt@28330000 {
+		wdt: watchdog@28330000 {
 			compatible = "toshiba,visconti-wdt";
 			reg = <0 0x28330000 0 0x1000>;
 			clocks = <&pismu TMPV770X_CLK_WDTCLK>;
diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
index a480c6ba5f5d..5ea835fe08a8 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
@@ -91,7 +91,7 @@ i2c8_pins: i2c8-pins {
 		bias-pull-up;
 	};
 
-	pwm_mux: pwm_mux {
+	pwm_mux: pwm-pins {
 		function = "pwm";
 	};
 
-- 
2.51.0

