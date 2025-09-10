Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F0E309DC1
	for <soc@lists.linux.dev>; Wed, 10 Sep 2025 23:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757547579; cv=none; b=QKCLfqieV1VhFemz83E6fVUQW+OAm14H3VyTLC2gK2+Kpr43yWHuwNshLNr8wfzv7gz23+Ml9j3IOCBEQJfzpUA162V7MjAHCHs0get01Ln5eJAqLGDrKdRt8Oo67jYtWlsJ174k1DvldlqqrPSr0YcctlBDhX2SM6jZjg/lL80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757547579; c=relaxed/simple;
	bh=GJZeHiPjiP3DnQJ+evMgNsJiiU3rynjez02+ZvOXV3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUgbu4H8WH7rSa1opkFnPav1Q+qcSRI+hvnKt94SXYKxjbHwOsM8SbBuu77ZlE6arxYJZRblt2D1MhHOYjHz2d72xPPLHRZeGe7qIIuMs0roip+U3p6+wrIeOHRMBjqfWncKUGkI3weX7lHYSRi4AbgwW5GRuwZyYFDF5h4KA9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDsTZZWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDsTZZWx"
Received: by smtp.kernel.org (Postfix)
	id 0FC8CC4CEF0; Wed, 10 Sep 2025 23:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13EDC4CEEB;
	Wed, 10 Sep 2025 23:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757547579;
	bh=GJZeHiPjiP3DnQJ+evMgNsJiiU3rynjez02+ZvOXV3o=;
	h=From:To:Cc:Subject:Date:From;
	b=VDsTZZWxOqmBMXRIg17++DxFGS2w1kU0CXtlP35NBu37ZgvzwUvVzf+mY0P0QZPy4
	 sl17HHzvWMdOJI675tO/9uJPQG4eHuKu0/sFADbEYSkRKwGfasxUXCu9Wh1w79ZJmZ
	 2F4c8bZg7grHlhMNUE01zdOBpYVFUA1gN1s5aov+WJw4PFS/dHuHbEHB6J7qPgRtJv
	 Yenyk3NWL+KJ7ypSiSLIUDBvG7V25afpffUSjS1gnKvUbI9Ig7fCZIRu23yMPOdNxF
	 rOVAJVr8Q/bhWcmFYLx5xX/ITLQIuRaa2Dp+8poK5Rxmcaero5/3cke2ND4svciFTu
	 8+VNad3BMBMrQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: socionext: Drop "linux,spdif-dit" port node unit-address
Date: Wed, 10 Sep 2025 18:39:23 -0500
Message-ID: <20250910233923.778992-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A single graph port node without an address (i.e. "reg") should not have
a unit-address, drop it from the "linux,spdif-dit" port node.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, Please apply directly.

 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts  | 4 ++--
 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts | 4 ++--
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
index de219570bbc9..fc105d420db4 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
@@ -68,7 +68,7 @@ spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			spdif_tx: endpoint {
 				remote-endpoint = <&spdif_hiecout1>;
 			};
@@ -79,7 +79,7 @@ comp-spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			comp_spdif_tx: endpoint {
 				remote-endpoint = <&comp_spdif_hiecout1>;
 			};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
index fba454adae7d..10efa747ed8b 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
@@ -74,7 +74,7 @@ spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			spdif_tx: endpoint {
 				remote-endpoint = <&spdif_hiecout1>;
 			};
@@ -85,7 +85,7 @@ comp-spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			comp_spdif_tx: endpoint {
 				remote-endpoint = <&comp_spdif_hiecout1>;
 			};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
index 20e5fb724fae..3c4dcfb82ddf 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
@@ -68,7 +68,7 @@ spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			spdif_tx: endpoint {
 				remote-endpoint = <&spdif_hiecout1>;
 			};
@@ -79,7 +79,7 @@ comp-spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 
-		port@0 {
+		port {
 			comp_spdif_tx: endpoint {
 				remote-endpoint = <&comp_spdif_hiecout1>;
 			};
-- 
2.51.0

