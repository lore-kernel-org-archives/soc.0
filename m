Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD31C3DA7F
	for <soc@archiver.kernel.org>; Tue, 30 Jul 2024 21:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D9EEC4AF0B; Tue, 30 Jul 2024 21:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158E0C32782;
	Tue, 30 Jul 2024 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722373300;
	bh=GkvH/3sbCTojDz8X59B3D08RDAYiw6xu367HrjfDwHg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=MjB/OoFm/D8Qb00wxaBsHlOJKIAMSAnsq1fI9CUg838XuMnw8+/6alnQxMPH7mE+4
	 STyJ84AfEfTVNBXJOCAjN3c0/JyGQDO0unx4eHkFrESjQXbTuro/lL/+oOt5Qdelsh
	 q0HTAZh0X+3urlZKlARfIf3hzP0MU/6DfajRZCLtfRAHYWHa7x+4LQDKnRyZGQ/+vQ
	 Ho8CQoXgTxsyqRpEk5OETQ0E+Rn34/z3ZDVurHXM2GUNVnn0ZHpr+gjK7G4pb9R4p7
	 5as2aJg+BBz9UsSnMSYaPNYSEb77ZNw63pkI4QXqYQZFF6afqBkLxqIhM2gTwh0GLs
	 B/ehQyATM9u1g==
From: "Rob Herring (Arm)" <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: arm: versatile-ab: Fix duplicate clock node name
Date: Tue, 30 Jul 2024 15:00:30 -0600
Message-ID: <20240730210030.2150467-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 04f08ef291d4 ("arm/arm64: dts: arm: Use generic clock and
regulator nodenames") renamed nodes and created 2 "clock-24000000" nodes
(at different paths). The kernel can't handle these duplicate names
even though they are at different paths. Fix this by renaming one of
the nodes to "clock-pclk". This name is aligned with other Arm boards
(those didn't have a known frequency to use in the node name).

Fixes: 04f08ef291d4 ("arm/arm64: dts: arm: Use generic clock and regulator nodenames")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, I imagine you can take this directly.

 arch/arm/boot/dts/arm/versatile-ab.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm/versatile-ab.dts b/arch/arm/boot/dts/arm/versatile-ab.dts
index 6fe6b49f5d8e..635ab9268899 100644
--- a/arch/arm/boot/dts/arm/versatile-ab.dts
+++ b/arch/arm/boot/dts/arm/versatile-ab.dts
@@ -157,7 +157,7 @@ timclk: clock-1000000 {
 			clocks = <&xtal24mhz>;
 		};
 
-		pclk: clock-24000000 {
+		pclk: clock-pclk {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <1>;
-- 
2.43.0

