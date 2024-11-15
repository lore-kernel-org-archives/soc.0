Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223411E283F
	for <soc@lists.linux.dev>; Fri, 15 Nov 2024 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731699530; cv=none; b=H6Jgd97JQqZMdUVdgU4H8gWar8ftEOUjRpzLsp4cITcUMN/pZ49W1KFddk7CeTJFMvIBWqDveZgLun+PzVy4ybzSjZSwspNVMbEU5slcOrJx4ZPseWql4Sy6cFe7mCnBR4hZEZg3pK21cUMbAbYJsyllkQ253dtOxMxDRep54I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731699530; c=relaxed/simple;
	bh=Ta89hoZlKOxfpyHkQBO+QgPfHl3czdx7coDCK9JfVdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dz3ivDR46KZNqTLWMclBkdIjcfy1fxhxNpVt+iL6vNnxcZ9kzE+fBZn4QtsA+fnmSseQjIaKWu6vU59AJ90uqxY5KC7PBoMVACQz5dDO084bA2/ue5TPxkF5GhgjU66O5rJJBEH4PuNf62UlG4Nlc9vCBKoUxiBBYodMF1R8YYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvWXf89i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvWXf89i"
Received: by smtp.kernel.org (Postfix)
	id D127EC4CED4; Fri, 15 Nov 2024 19:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97599C4CECF;
	Fri, 15 Nov 2024 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699529;
	bh=Ta89hoZlKOxfpyHkQBO+QgPfHl3czdx7coDCK9JfVdg=;
	h=From:To:Cc:Subject:Date:From;
	b=jvWXf89iDBZYVTcgpi+pQFVPTvIpHvirLtmIYLVWZlgbmXfrQQL6qCw4qt1BPniWd
	 mEaamc16R/c6CXqA83+XEoBlEQ6kLUb2Ca32qel26gBp09bx+VbsSLgP3JzhsGM7xJ
	 1ia7enQ+S+YHGpHcS/sUKyOoAZmCbxFZVWJOUgkpk0vqgn/FJ708frTIyBne9SLDXd
	 MYQpXwiygwPHuFhRi08geoipFfFn2D50gI7W0qsSr6vOqUdkRa5P9D+NoHL9zRL4vP
	 r40rQOyDo4FdVCdG0M4lkJGZ5ixfnFWHZGEzukVFbA4uvdxbuPkFBnwwe0EJgVGivY
	 kyyI3jqBsC9yg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: spear13xx: Remove unused and undocumented "pl022,slave-tx-disable" property
Date: Fri, 15 Nov 2024 13:38:34 -0600
Message-ID: <20241115193835.3623725-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove "pl022,slave-tx-disable" property which is both unused in the kernel
and undocumented. Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/st/spear1310-evb.dts | 2 --
 arch/arm/boot/dts/st/spear1340-evb.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
index 18191a87f07c..ad216571ba57 100644
--- a/arch/arm/boot/dts/st/spear1310-evb.dts
+++ b/arch/arm/boot/dts/st/spear1310-evb.dts
@@ -353,7 +353,6 @@ stmpe610@0 {
 					spi-max-frequency = <1000000>;
 					spi-cpha;
 					pl022,interface = <0>;
-					pl022,slave-tx-disable;
 					pl022,com-mode = <0>;
 					pl022,rx-level-trig = <0>;
 					pl022,tx-level-trig = <0>;
@@ -385,7 +384,6 @@ flash@1 {
 					spi-cpol;
 					spi-cpha;
 					pl022,interface = <0>;
-					pl022,slave-tx-disable;
 					pl022,com-mode = <0x2>;
 					pl022,rx-level-trig = <0>;
 					pl022,tx-level-trig = <0>;
diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index cea624fc745c..9b515b21a633 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -446,7 +446,6 @@ flash@0 {
 					spi-cpol;
 					spi-cpha;
 					pl022,interface = <0>;
-					pl022,slave-tx-disable;
 					pl022,com-mode = <0x2>;
 					pl022,rx-level-trig = <0>;
 					pl022,tx-level-trig = <0>;
@@ -461,7 +460,6 @@ stmpe610@1 {
 					spi-cpha;
 					reg = <1>;
 					pl022,interface = <0>;
-					pl022,slave-tx-disable;
 					pl022,com-mode = <0>;
 					pl022,rx-level-trig = <0>;
 					pl022,tx-level-trig = <0>;
-- 
2.45.2

