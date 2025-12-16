Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA233858E
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 20:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765916879; cv=none; b=toEI73Jek2tjL4Y3QY+7B6dmCUrk6ZacAe46wds9gl+wo975UCj3CvZ9g2/AY1dfGGI33UbIkruNdxMXwSvnq9fKxh9JlT+4/HUU6c4lIHMpq5yyeed5j3QTLpEXSna/M2NASqpWZpm4v6WeewRM+4ZbXbD32OUUWrN1D+YLYNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765916879; c=relaxed/simple;
	bh=Nxrh4WtaBec4SxFEiucTh00WEuixeOysyLN093Fm1dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYxlbkilMcYTfHb43D061pP+mZkj+rYBf6dWZD/fFiQSEGAg1umIhBeQZlkYOni5knWGsE11hxkEpkBMdVUpdjOHUvw4Z4orz9kCFgpRBpEkcuGBJwblQm3sLZvx2uoFkgvTc/BHWRlHPLzW2++jjGrQb4qH6o7K/5xPaJ5lyUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzZJ2vX2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzZJ2vX2"
Received: by smtp.kernel.org (Postfix)
	id 07B2EC4CEFB; Tue, 16 Dec 2025 20:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C325EC113D0;
	Tue, 16 Dec 2025 20:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765916878;
	bh=Nxrh4WtaBec4SxFEiucTh00WEuixeOysyLN093Fm1dE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LzZJ2vX2DqtHVnZPdWl8wE+Q8w3eoY1UTToCF5+srrskt4gt/ZWUe6SlOY8sXWzEz
	 J0Q+PcteGcUas9rlVBDUscS5IMVmSAv3ctkdW4L73lAZNDiddiaZPd0nTQ5i7JoaLh
	 XotUwrJoXa58YDKmXfbeQIjIFO0yjErH/PtHVu/wbuVB2SyljxD9tDh9cQf80xOM0D
	 2lzQmQGXlVQfL1YzrV75Lw4j/w+Ey4OM5i22EVaUtoeehlFh9uy2j3TDqkgeVe2kmv
	 QGxoq21YgA+Iagc71i73l1+mHXYCaTqkjIttn1wqdcJ/UMkdqKVxjfnL4cR2tVi78z
	 xYjflStrM+RIg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 16 Dec 2025 14:27:50 -0600
Subject: [PATCH 3/4] arm64: dts: apm: Add "reg" to "syscon-reboot" and
 "syscon-poweroff"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dt-apm-v1-3-0bf2bf8b982c@kernel.org>
References: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
In-Reply-To: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
To: soc@kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

As the nodes already have a unit-address, add the corresponding "reg"
entry which is preferred over "offset".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/apm/apm-merlin.dts     | 1 +
 arch/arm64/boot/dts/apm/apm-mustang.dts    | 1 +
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 1 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-merlin.dts b/arch/arm64/boot/dts/apm/apm-merlin.dts
index b1160780a2a6..4ec05886dd41 100644
--- a/arch/arm64/boot/dts/apm/apm-merlin.dts
+++ b/arch/arm64/boot/dts/apm/apm-merlin.dts
@@ -38,6 +38,7 @@ poweroff_mbox: poweroff_mbox@10548000 {
 
 	poweroff: poweroff@10548010 {
 		compatible = "syscon-poweroff";
+		reg = <0x0 0x10548010 0x0 0x4>;
 		regmap = <&poweroff_mbox>;
 		offset = <0x10>;
 		mask = <0x1>;
diff --git a/arch/arm64/boot/dts/apm/apm-mustang.dts b/arch/arm64/boot/dts/apm/apm-mustang.dts
index 2ef658796746..8f7eeba56dc4 100644
--- a/arch/arm64/boot/dts/apm/apm-mustang.dts
+++ b/arch/arm64/boot/dts/apm/apm-mustang.dts
@@ -38,6 +38,7 @@ poweroff_mbox: poweroff_mbox@10548000 {
 
 	poweroff: poweroff@10548010 {
 		compatible = "syscon-poweroff";
+		reg = <0x0 0x10548010 0x0 0x4>;
 		regmap = <&poweroff_mbox>;
 		offset = <0x10>;
 		mask = <0x1>;
diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index 95281268fb7f..e930f2f26f4b 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -417,6 +417,7 @@ scu: system-clk-controller@17000000 {
 
 		reboot: reboot@17000014 {
 			compatible = "syscon-reboot";
+			reg = <0x0 0x17000014 0x0 0x4>;
 			regmap = <&scu>;
 			offset = <0x14>;
 			mask = <0x1>;
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 85ad18b63038..3bb59704fcb2 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -462,6 +462,7 @@ scu: system-clk-controller@17000000 {
 
 		reboot: reboot@17000014 {
 			compatible = "syscon-reboot";
+			reg = <0x0 0x17000014 0x0 0x4>;
 			regmap = <&scu>;
 			offset = <0x14>;
 			mask = <0x1>;

-- 
2.51.0

