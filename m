Return-Path: <SRS0=V9NH=EP=robh_at_kernel.org=rob@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2381EC83F14
	for <soc@archiver.kernel.org>; Wed, 30 Aug 2023 20:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B9F2C433C8; Wed, 30 Aug 2023 20:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7378C433C7;
	Wed, 30 Aug 2023 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693425903;
	bh=Wee5fYHr4SWN0DFuFy5NVeMamcdWVPp3TBwB0vRmzSM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ubDDqgv8sh4taAI7mhwl2YahS6aEUiWE880R2QiZvPiPKyGz5a73uKZE1n1W3Xlex
	 SDKqwMEASZZGHpATl/dn+eyrZ/D5Hox1RSKoMvVs+zZDU5ydpoYV1+xL2y+PvrOZdy
	 dtKfpaR6Q4bqe1YsX0oVX4/q9oyTiWukYDx3GqM+ZcMCRBQOrbuFFSajR6oF3Txh+Y
	 1a4HuHNaBKwoO5WCLbtB9HhaljfqHbpoz5xyucTnWnKeCdd/3WSICndbIddzGwX7qx
	 eRpDX7ZxpbXkIKbtuwv2ucr3fIoWYGbv2giVt82RbM/nwmUI/q7E2q6CFvFssPc0xG
	 pQ+5NsluEdosA==
Received: (nullmailer pid 721279 invoked by uid 1000);
	Wed, 30 Aug 2023 20:05:01 -0000
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: arm,integrator-ap: Fix PCI node name
Date: Wed, 30 Aug 2023 15:04:25 -0500
Message-Id: <20230830200437.715735-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI bus nodes should be named "pci":

arch/arm/boot/dts/arm/integratorap.dts:161.22-206.4: Warning (pci_bridge): /pciv3@62000000: node name is not "pci" or "pcie"

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/arm/integratorap.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm/integratorap.dts b/arch/arm/boot/dts/arm/integratorap.dts
index 5b52d75bc6be..d9927d3181dc 100644
--- a/arch/arm/boot/dts/arm/integratorap.dts
+++ b/arch/arm/boot/dts/arm/integratorap.dts
@@ -158,7 +158,7 @@ pic: pic@14000000 {
 		valid-mask = <0x003fffff>;
 	};
 
-	pci: pciv3@62000000 {
+	pci: pci@62000000 {
 		compatible = "arm,integrator-ap-pci", "v3,v360epc-pci";
 		device_type = "pci";
 		#interrupt-cells = <1>;
-- 
2.40.1

