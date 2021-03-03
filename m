Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0601C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Mar 2021 18:28:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AAAAE64F0A; Wed,  3 Mar 2021 18:28:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C78464EF3;
	Wed,  3 Mar 2021 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614796103;
	bh=prsVG/qhvgCCdE9CrULapjEh2VPg8F1aWyfx/efhJus=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=VllzeKMcZeCqhq9Fg2LtGKb/RvNaNjrZQ6kljK3ZN6Mf9SCct062HwmDvzWlqdp1C
	 qoM0khq1eqvLBiKm9SCwY2AaIr2Yv6uvrZ/29Lmjno7/DjMVftIfqmgUk/V7PvxDJ+
	 DeIRBticvqLyIiqMEauwD5s4fbeduthY+C3kcaA+AyM4IdaqMb3rd5w4wE9BhbOnee
	 u+TuArdUD4vUTtTkL4M6UaULjbC4US29PZGmhmKyvpw6vyZDQDeY57RPS839t0Y6/n
	 TMd71tM9Ss829dOvrp4ZE1aTnrpRxeoFRznuqHU0C9Z+MQn3rdqe9uPsDN1TwIuZw+
	 FcjBm/TArtuHg==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Iskren Chernev <iskren.chernev@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND 1/2] ARM: dts: qcom: msm8974-lge-nexus5: correct fuel gauge interrupt trigger level
Date: Wed,  3 Mar 2021 19:28:15 +0100
Message-Id: <20210303182816.137255-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maxim fuel gauge datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU.  The falling edge
interrupt will mostly work but it's not correct.

Fixes: 45dfa741df86 ("ARM: dts: qcom: msm8974-lge-nexus5: Add fuel gauge")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 0cda654371ae..56ee02ceba7d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -575,7 +575,7 @@ fuelgauge: max17048@36 {
 			maxim,rcomp = /bits/ 8 <0x4d>;
 
 			interrupt-parent = <&msmgpio>;
-			interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&fuelgauge_pin>;
-- 
2.25.1

