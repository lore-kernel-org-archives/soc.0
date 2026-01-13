Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587C430C616;
	Tue, 13 Jan 2026 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768335252; cv=none; b=aFUCJr2hEA2slpP678OVZU4seTeX76dE0hRqKSL+ZdG+ixJE3Lhgi0uubxewy8ac7KAYRaBN4IEalnTTZimL9PrjsLj0fICRqARMsQtWsTa/gN0W0+U71R+5CgAK+G02gssDCuiTwM6FBjHrHpgmq9yL7knk1UgJOPTiBSe+CZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768335252; c=relaxed/simple;
	bh=5NBDhvcf0Xl7tSwBf8nTtU/2p0OwbbFqu3FaqzpjFXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHZC02hocMO5+UlogyrQEGe9A2m35kkYOWOPorSQNLObUZSNwPSBiqbW/KoSA1T3HhIdWaOA3PnsNBA05eUoFr2AiNuT/wqQx0qYm0OiAWBAIEtiQbsb8k2b5TvkoxN/Xw955KFLAGOFYa3fvzEdqwN6Y5xLeDZ1D8ufDP41w2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh9+CgUa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh9+CgUa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F5CC116C6;
	Tue, 13 Jan 2026 20:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768335252;
	bh=5NBDhvcf0Xl7tSwBf8nTtU/2p0OwbbFqu3FaqzpjFXM=;
	h=From:To:Cc:Subject:Date:From;
	b=Wh9+CgUaWrNifq/AVDrjrmZ9r5yNSepaTEWAcTKTAXHRD3iTDgi/f7UbGqisVflUK
	 pHxfJwXGVyU65d4QUZ1XSWKUYPqIEJBs91TPcmTzzCA54ragy6QJYB1OqmLD1rX4bS
	 0c5r0CRqFIe9OsWZjxZtO3Ni7l5r6wauKAqj9iFkvVZ/dYrfi/NprRwYNghZ8ZEUXF
	 L/ki0D9qOCx8yomhAfrx1xHhklUeoYGUGpTLzoAXq64bFqGyQg6hhf/dMWgYbZ/HFn
	 mE3sFQreYBrB8LA4kB8MTqwnlP3ZN9B6TB12rcGTsOWFFYJ3ze8r9FE5l65h/WTbwV
	 f6jcd+1zlA+Qw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2] arm/arm64: dts: st: Drop unused .dtsi
Date: Tue, 13 Jan 2026 14:13:38 -0600
Message-ID: <20260113201340.36950-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These .dtsi files are not included anywhere in the tree and can't be
tested.

Reviewed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop erroneous QCom .dtsi
---
 arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------
 .../boot/dts/st/stm32mp15xxab-pinctrl.dtsi    | 57 ---------------
 arch/arm64/boot/dts/st/stm32mp21xc.dtsi       |  8 ---
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |  8 ---
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |  8 ---
 .../boot/dts/st/stm32mp25xxal-pinctrl.dtsi    | 71 -------------------
 6 files changed, 176 deletions(-)
 delete mode 100644 arch/arm/boot/dts/st/spear320s.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp21xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi

diff --git a/arch/arm/boot/dts/st/spear320s.dtsi b/arch/arm/boot/dts/st/spear320s.dtsi
deleted file mode 100644
index 133236dc190d..000000000000
--- a/arch/arm/boot/dts/st/spear320s.dtsi
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * DTS file for SPEAr320s SoC
- *
- * Copyright 2021 Herve Codina <herve.codina@bootlin.com>
- */
-
-/include/ "spear320.dtsi"
-
-/ {
-	ahb {
-		apb {
-			gpiopinctrl: gpio@b3000000 {
-				/*
-				 * The "RM0321 SPEAr320s address and map
-				 * registers" document mentions interrupt 6
-				 * (NPGIO_INTR) for the PL_GPIO interrupt.
-				 */
-				interrupts = <6>;
-				interrupt-parent = <&shirq>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
deleted file mode 100644
index 328dad140e9b..000000000000
--- a/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
+++ /dev/null
@@ -1,57 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AB>;
-
-	gpioa: gpio@50002000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@50003000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@50004000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 32 16>;
-	};
-
-	gpiod: gpio@50005000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@50006000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@50007000 {
-		status = "okay";
-		ngpios = <6>;
-		gpio-ranges = <&pinctrl 6 86 6>;
-	};
-
-	gpiog: gpio@50008000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl 6 102 10>;
-	};
-
-	gpioh: gpio@50009000 {
-		status = "okay";
-		ngpios = <2>;
-		gpio-ranges = <&pinctrl 0 112 2>;
-	};
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp21xc.dtsi b/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
deleted file mode 100644
index e33b00b424e1..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp23xc.dtsi b/arch/arm64/boot/dts/st/stm32mp23xc.dtsi
deleted file mode 100644
index e33b00b424e1..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp23xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xc.dtsi b/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
deleted file mode 100644
index 5e83a6926485..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
deleted file mode 100644
index 2406e972554c..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AL>;
-
-	gpioa: gpio@44240000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@44250000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@44260000 {
-		status = "okay";
-		ngpios = <14>;
-		gpio-ranges = <&pinctrl 0 32 14>;
-	};
-
-	gpiod: gpio@44270000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@44280000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@44290000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 80 16>;
-	};
-
-	gpiog: gpio@442a0000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 96 16>;
-	};
-
-	gpioh: gpio@442b0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 2 114 12>;
-	};
-
-	gpioi: gpio@442c0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 0 128 12>;
-	};
-};
-
-&pinctrl_z {
-	gpioz: gpio@46200000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl_z 0 400 10>;
-	};
-};
-- 
2.51.0

