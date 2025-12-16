Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711A1684BE
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908050; cv=none; b=tK+/9dKvfQKTvu4DCSLZ881m9Q3En0RPozWjpdnJ5QTTa/SJLtbGczGrQRXqXwak8I6HPHO8MH/2MRFfSQGb/+tL3+BlKTkj1bVhW3XjZC4hwULk7dcq9e3WTJBtSyO3UbtRcoaBLJbNDaDJVg5bsLc04NXl5+cSZCL2YexPZB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908050; c=relaxed/simple;
	bh=0Kh/tiLYUsZsgJ5cjC4uh5vk2v/SDTqpoh29Wrnea44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWs8SZ2T3a5OiKYwp8BtzpmxJN8gk53myI3gKswL56Ol+5OfvhicEpAbKfcsOeThq8IN2173Q9QH1+hX1o/hAlknlwF0KDjnY2QexmWeff8c0ux+oSD80ekxU1uNF6/PktDMrp6JA/6EreDYEF1b+ohMGI0F90pjTUne6zIvlog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d74h76hk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d74h76hk"
Received: by smtp.kernel.org (Postfix)
	id 03356C113D0; Tue, 16 Dec 2025 18:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC799C4CEF1;
	Tue, 16 Dec 2025 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908049;
	bh=0Kh/tiLYUsZsgJ5cjC4uh5vk2v/SDTqpoh29Wrnea44=;
	h=From:To:Cc:Subject:Date:From;
	b=d74h76hkH0akG6NzKJ+CIiNmuppIeZKw0ETx/dO/h1YCekqzJLsVBXnJX8Qo0ecDj
	 KPdG8XFExmN5aNrDwRWPEzDrrq2eTDJI4x3gVXAWy93KBiSTnKfcz9O0WIgmzNxk28
	 uXJSKIBgsz1JL9EajKghFgkJ0dTjvgyYfz3IamwmxtR4hkEYp854exZgqhuFdx3JZU
	 q09yp9mJilxg6cvTxYhReC7BUDI91HJpW7HE/kq72tX38B7aidBW+iGhyxgBLlkQUu
	 Ig0pQxPKl164WFU4mdjDjUqNX/a6DB7DzewsPgNong3Mn5KtURqBKpOCh2LQx1X1tX
	 YF7HzWiJQTOVA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: sprd: Use recommended node names
Date: Tue, 16 Dec 2025 12:00:29 -0600
Message-ID: <20251216180029.2792676-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Spreadtrum platforms node name to the recommended standard node
names. Generally, node names and paths aren't considered ABI, so it
is safe to change them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.

 arch/arm64/boot/dts/sprd/sc9860.dtsi   | 7 ++++---
 arch/arm64/boot/dts/sprd/sc9863a.dtsi  | 4 ++--
 arch/arm64/boot/dts/sprd/sharkl64.dtsi | 2 +-
 arch/arm64/boot/dts/sprd/whale2.dtsi   | 8 ++++----
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
index 864ef0a17425..765acde4867c 100644
--- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
@@ -115,7 +115,7 @@ CPU7: cpu@530103 {
 	idle-states {
 		entry-method = "psci";
 
-		CORE_PD: core_pd {
+		CORE_PD: cpu-pd {
 			compatible = "arm,idle-state";
 			entry-latency-us = <1000>;
 			exit-latency-us = <700>;
@@ -124,7 +124,7 @@ CORE_PD: core_pd {
 			arm,psci-suspend-param = <0x00010002>;
 		};
 
-		CLUSTER_PD: cluster_pd {
+		CLUSTER_PD: cluster-pd {
 			compatible = "arm,idle-state";
 			entry-latency-us = <1000>;
 			exit-latency-us = <1000>;
@@ -276,7 +276,8 @@ etb@10003000 {
 			reg = <0 0x10003000 0 0x1000>;
 			clocks = <&ext_26m>;
 			clock-names = "apb_pclk";
-			out-ports {
+
+			in-ports {
 				port {
 					etb_in: endpoint {
 						remote-endpoint =
diff --git a/arch/arm64/boot/dts/sprd/sc9863a.dtsi b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
index e97000e560e7..31799579d7f2 100644
--- a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
@@ -110,7 +110,7 @@ CPU7: cpu@700 {
 
 	idle-states {
 		entry-method = "psci";
-		CORE_PD: core-pd {
+		CORE_PD: cpu-pd {
 			compatible = "arm,idle-state";
 			entry-latency-us = <4000>;
 			exit-latency-us = <4000>;
@@ -545,7 +545,7 @@ etm7_out: endpoint {
 			};
 		};
 
-		ap-ahb {
+		ahb {
 			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/sprd/sharkl64.dtsi b/arch/arm64/boot/dts/sprd/sharkl64.dtsi
index bf58702c4e07..1c8c23e04136 100644
--- a/arch/arm64/boot/dts/sprd/sharkl64.dtsi
+++ b/arch/arm64/boot/dts/sprd/sharkl64.dtsi
@@ -16,7 +16,7 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
-		ap-apb {
+		apb {
 			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index 2ecaa56001b8..87a834d4640c 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -81,7 +81,7 @@ apapb_gate: clock-controller@70b00000 {
 			#clock-cells = <1>;
 		};
 
-		ap-apb@70000000 {
+		apb@70000000 {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -136,7 +136,7 @@ uart3: serial@300000 {
 			};
 		};
 
-		ap-ahb {
+		ahb {
 			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -183,7 +183,7 @@ sdio3: mmc@50430000 {
 			};
 		};
 
-		aon {
+		aon-bus {
 			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -285,7 +285,7 @@ watchdog@40310000 {
 			};
 		};
 
-		agcp {
+		agcp-bus {
 			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
-- 
2.51.0

