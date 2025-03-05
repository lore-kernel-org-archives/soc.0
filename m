Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A4A1D8DEE
	for <soc@lists.linux.dev>; Wed,  5 Mar 2025 22:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214978; cv=none; b=PAP8Hanj/Wv5MTQW4DUYAsohRZ0aLPl3n2cL+7vex6HCbXTIBbN0NbRQ7EHjwSzivHd0O13vMHZfsvtR+Mbcdm7aZoFe5mD3ZoUAuQ+iHsvhr0Lo5IhYi6gXRGUm6v4kNpPZfDEAsdOOltTkNQqBdI3tswt9t9+vvoKYFJWXMqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214978; c=relaxed/simple;
	bh=tvF+6eR8G5nkdnPZOSey1KiCW0OiFUeol3JtDBnly/A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=aUt/WVYN9piopOcYKKmasb4f36d/L4pJGk/0ftNPb70c67dhbZOfDAqak05vFcS1c/7WoeBz7fu62SxwYLERdDWsBdBX9hLkcQ8jJN41m+bxkjugGUdEn4EbRSRLDyLL8FQKazyajAFgPIRrD9Lz+2zKVkgGzMAraL0tIOcJIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXiqaObF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXiqaObF"
Received: by smtp.kernel.org (Postfix)
	id 1F7FFC4CEE7; Wed,  5 Mar 2025 22:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12A4C4CEE0;
	Wed,  5 Mar 2025 22:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741214978;
	bh=tvF+6eR8G5nkdnPZOSey1KiCW0OiFUeol3JtDBnly/A=;
	h=From:To:Subject:Date:From;
	b=aXiqaObF5TXoXrrQpV/QRUdP/Os/nnuu3xBmA8Ebgbu4tqAlRgTIx9spxKiBko98N
	 zBeI6bSlBn8d9O4qS3OWkRxtJp7B2OgHeqdagUUb3FFLDspxwKzlOJCWNIW5iSU5hT
	 G9hDrTQT2bYJMVhlX3xIuBRw9rTlGFoMCEO8qhoKyeG/zwz5Cc3J1tzFnSjrtj7EH1
	 uw0VPliHArNX3qzYfdn7ZcTZ1qQnE75u2/QRv/VhbGOmVUixtRLYGeVhQ4g8uSVsuf
	 Ty0gAAigsnTUvEsD5b7c/r1IWHKqV/zOawIBMOq0xTWDo5O34BzzaBMhI9hpCftq1T
	 AoMG3uyC7hGQw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org
Subject: [PATCH] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
Date: Wed,  5 Mar 2025 16:49:36 -0600
Message-ID: <20250305224936.2995519-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove "regulator-ramp-delay-scale" property which is both unused in the
kernel and undocumented. Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index c56824d7f4d8..0ecdd7243b2e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -266,7 +266,6 @@ vdd_soc: sd0 {
 					regulator-max-microvolt = <1170000>;
 					regulator-enable-ramp-delay = <146>;
 					regulator-ramp-delay = <27500>;
-					regulator-ramp-delay-scale = <300>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -281,7 +280,6 @@ vdd_ddr: sd1 {
 					regulator-max-microvolt = <1150000>;
 					regulator-enable-ramp-delay = <176>;
 					regulator-ramp-delay = <27500>;
-					regulator-ramp-delay-scale = <300>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -296,7 +294,6 @@ vdd_pre: sd2 {
 					regulator-max-microvolt = <1350000>;
 					regulator-enable-ramp-delay = <176>;
 					regulator-ramp-delay = <27500>;
-					regulator-ramp-delay-scale = <350>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -311,7 +308,6 @@ vdd_1v8: sd3 {
 					regulator-max-microvolt = <1800000>;
 					regulator-enable-ramp-delay = <242>;
 					regulator-ramp-delay = <27500>;
-					regulator-ramp-delay-scale = <360>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -326,7 +322,6 @@ vdd_sys_1v2: ldo0 {
 					regulator-max-microvolt = <1200000>;
 					regulator-enable-ramp-delay = <26>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -341,7 +336,6 @@ vdd_pex_1v05: ldo1 {
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <22>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
 					maxim,active-fps-power-up-slot = <0>;
@@ -354,7 +348,6 @@ vddio_sdmmc: ldo2 {
 					regulator-max-microvolt = <3300000>;
 					regulator-enable-ramp-delay = <62>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
 					maxim,active-fps-power-up-slot = <0>;
@@ -371,7 +364,6 @@ vdd_rtc: ldo4 {
 					regulator-max-microvolt = <1100000>;
 					regulator-enable-ramp-delay = <22>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 					regulator-disable-active-discharge;
 					regulator-always-on;
 					regulator-boot-on;
@@ -395,7 +387,6 @@ avdd_1v05_pll: ldo7 {
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <24>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
 					maxim,active-fps-power-up-slot = <3>;
@@ -408,7 +399,6 @@ avdd_1v05: ldo8 {
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <22>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
 					maxim,active-fps-power-up-slot = <6>;
-- 
2.47.2

