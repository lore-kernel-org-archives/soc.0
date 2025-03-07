Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4D149C4A
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 01:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309684; cv=none; b=OVeEhP5Ch/zQ1ZqXq7zRzRG/PhHvgz0hRgwmXNtkzL+WncMkgBnfvtUh3pLsm/X0WpaxOUwiRAOe4U4KQOuvjooowy922pLqdKaYJMDFiJCOkOCS1CnUEjHP/NgWoA14/dqra3S7QbgE8vnywqfGKwxlX67acc5j0L7TaGjtQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309684; c=relaxed/simple;
	bh=ouaKAGOGUT7pUC99owzfxsQUE3Rjd4PCRCuSt8gNyZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pd0EuN2hNk7XItWK8blUk/vkB0ioMjbTTmQ4Q3eF6urh8cH/di5k5r7cRPaX3egTRnduXDjtrJm7UrQuU0OCIj0gD+3AqlJ9x3GAymEuKr11N+vir/dXfZSUpWJ7mlGgCU4KRVgDcrVbBECvPP5Uso6QxUvwdzh/ZnlGhap1qZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkfTuR0K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkfTuR0K"
Received: by smtp.kernel.org (Postfix)
	id 8D44AC4CEE5; Fri,  7 Mar 2025 01:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D55C4CEE0;
	Fri,  7 Mar 2025 01:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741309683;
	bh=ouaKAGOGUT7pUC99owzfxsQUE3Rjd4PCRCuSt8gNyZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZkfTuR0KirZgiKNz0oGp/VselMAYwifu6tWPQAInDlYnSMJBsANjsShSbRkFjqOZ6
	 pzsWPspfZoqV82YK9pW+hgGHI+S/4EoIWWWci3xp+FZSjLCnLU6Kxc26rhZzzMa4c3
	 AiMCgdb4Y+jjaLHNrX0BDvPGXaMn02j7CFjaFgQ2HrVmfhXfvntG57kOP0fFNMK6HT
	 Zs6RwXlDl5+lI0t0tElfE+FvzqYMqTX5UUQx5dyPD2HAUsYrOxJAvxrclloW4CrfP4
	 uR3Z2OsEce8RO6aVOdLMNknDj6YAjoTPl93oSokQrobBTpIvI8+P4TRM+ANWzH6ejv
	 YJSxsFtkHk0Dg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 06 Mar 2025 19:07:43 -0600
Subject: [PATCH 1/4] arm64: dts: amd/seattle: Base Overdrive B1 on top of
 B0 version
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-dt-amd-fixes-v1-1-011c423ba99a@kernel.org>
References: <20250306-dt-amd-fixes-v1-0-011c423ba99a@kernel.org>
In-Reply-To: <20250306-dt-amd-fixes-v1-0-011c423ba99a@kernel.org>
To: soc@kernel.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

AMD Overdrive B1 version is just more peripherals enabled over B0
version. Rework the B1 .dts to use the B0 .dts.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts | 61 +-----------------------
 1 file changed, 1 insertion(+), 60 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
index 58e2b0a6f841..b34dd8d5d1b1 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
@@ -8,32 +8,10 @@
 
 /dts-v1/;
 
-/include/ "amd-seattle-soc.dtsi"
-/include/ "amd-seattle-cpus.dtsi"
+/include/ "amd-overdrive-rev-b0.dts"
 
 / {
 	model = "AMD Seattle (Rev.B1) Development Board (Overdrive)";
-	compatible = "amd,seattle-overdrive", "amd,seattle";
-
-	chosen {
-		stdout-path = &serial0;
-	};
-
-	psci {
-		compatible = "arm,psci-0.2";
-		method = "smc";
-	};
-};
-
-&ccp0 {
-	status = "okay";
-};
-
-/**
- * NOTE: In Rev.B, gpio0 is reserved.
- */
-&gpio1 {
-	status = "okay";
 };
 
 &gpio2 {
@@ -44,48 +22,11 @@ &gpio3 {
 	status = "okay";
 };
 
-&gpio4 {
-	status = "okay";
-};
-
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
-&pcie0 {
-	status = "okay";
-};
-
 &sata1 {
 	status = "okay";
 };
 
-&spi0 {
-	status = "okay";
-};
-
-&spi1 {
-	status = "okay";
-	sdcard0: sdcard@0 {
-		compatible = "mmc-spi-slot";
-		reg = <0>;
-		spi-max-frequency = <20000000>;
-		voltage-ranges = <3200 3400>;
-		pl022,interface = <0>;
-		pl022,com-mode = <0x0>;
-		pl022,rx-level-trig = <0>;
-		pl022,tx-level-trig = <0>;
-	};
-};
-
 &ipmi_kcs {
 	status = "okay";
 };
 
-&smb0 {
-	/include/ "amd-seattle-xgbe-b.dtsi"
-};

-- 
2.47.2

