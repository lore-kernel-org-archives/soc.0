Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78182272E54
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 19:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765912369; cv=none; b=KoeZVKIYDAJgWgb+msfSj1+26gqow+78zDupT9mGNrIT9GUp2MNm550Qprv/7fzc46rB7vHSJCWz05UlFSccKd5n7z038PhyvVOhtZoGidRw5YHBIUKsaWOc77IZpSVFtdFzv0Xf9BTpGOzcWwizP0RiVfHGVckosSv6kutRXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765912369; c=relaxed/simple;
	bh=lZ1L36MMIvqC3ItTAU11Z5ZidG2aFDbgBmoFw5G5xis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kihes6y8w/j3OBq5nRMn1CtDsk7vvDE+f5t8PafcGO3PfTOfb3gj9G0UE/8YFuTS8hoU4aoG6zGq675xlNN+vbU8csvZsGCHZ/rLYaHdeaqeln7NBWLoeEYsMRZJaaTiUkZ4n3dzRHUIsn4XbSfiWO7gEXK5MqkXBkaONlRoP58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5obNDte; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5obNDte"
Received: by smtp.kernel.org (Postfix)
	id 6DCE2C4CEFB; Tue, 16 Dec 2025 19:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353A2C4CEF1;
	Tue, 16 Dec 2025 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765912369;
	bh=lZ1L36MMIvqC3ItTAU11Z5ZidG2aFDbgBmoFw5G5xis=;
	h=From:To:Cc:Subject:Date:From;
	b=M5obNDteU4o4mV8OFBa77Oiq9OosbnLYuPXvNuf/t2eZ5LnDMYbp0k/NA+X1Nd1uZ
	 4jQ6S60XdmhsZAfHWvJrcol4iA51yqLNhcgEV6CjfWmnt148IxJhYMf88n+JB02GUG
	 w7Z0kgXNKmBkT5/pFpd+MUL2H6VDFex0veX4kmPAi+GTM7h2xNvDU6GDBAD8fAV46G
	 +z64gtwrmsaGqf+rSBHLeaAvV2VP153wzq0deDtxs50FtccrqXnq1z3ngsYZcQubyC
	 G0mtPXAC7Sihk4D2nBjXBHLwCsrrNc2jkrLC23r1cyimf0cAgjVfQEwoFwmaYPFNhU
	 Ct9a3Pp2ib5sQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: vexpress/v2m-rs1: Use documented arm,vexpress,config-bus child node names
Date: Tue, 16 Dec 2025 13:12:12 -0600
Message-ID: <20251216191212.2879226-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the arm,vexpress,config-bus child node names to use the
documented ones. Most of these were updated a while back, but I missed
these.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers may want to take this directly?

 arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
index 158b3923eae3..248b8e492d43 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi
@@ -420,7 +420,7 @@ mcc {
 					compatible = "arm,vexpress,config-bus";
 					arm,vexpress,config-bridge = <&v2m_sysreg>;
 
-					oscclk0 {
+					clock-controller-0 {
 						/* MCC static memory clock */
 						compatible = "arm,vexpress-osc";
 						arm,vexpress-sysreg,func = <1 0>;
@@ -429,7 +429,7 @@ oscclk0 {
 						clock-output-names = "v2m:oscclk0";
 					};
 
-					v2m_oscclk1: oscclk1 {
+					v2m_oscclk1: clock-controller-1 {
 						/* CLCD clock */
 						compatible = "arm,vexpress-osc";
 						arm,vexpress-sysreg,func = <1 1>;
@@ -438,7 +438,7 @@ v2m_oscclk1: oscclk1 {
 						clock-output-names = "v2m:oscclk1";
 					};
 
-					v2m_oscclk2: oscclk2 {
+					v2m_oscclk2: clock-controller-2 {
 						/* IO FPGA peripheral clock */
 						compatible = "arm,vexpress-osc";
 						arm,vexpress-sysreg,func = <1 2>;
@@ -447,7 +447,7 @@ v2m_oscclk2: oscclk2 {
 						clock-output-names = "v2m:oscclk2";
 					};
 
-					volt-vio {
+					regulator-vio {
 						/* Logic level voltage */
 						compatible = "arm,vexpress-volt";
 						arm,vexpress-sysreg,func = <2 0>;
-- 
2.51.0

