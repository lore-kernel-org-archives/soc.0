Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C898C433E6
	for <soc@archiver.kernel.org>; Wed,  3 Mar 2021 18:28:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4A9F764F0B; Wed,  3 Mar 2021 18:28:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0213064EF8;
	Wed,  3 Mar 2021 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614796106;
	bh=5N8vp/LmJHYeWFsIHJ+ReAQNV4KmGtjrpFWQPdN4USs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZMzl7J+BSt4YD+V/ZPUuohztcmrcxq+4T2+plihq1DNIjtTxThK5ZRBI8CkssAVa1
	 f24YHL3LqT5BRFufzLyKqRhFDZvjP+kmwpmEktTYFdF1JwdcDI9hfACSZbFtfcRpwn
	 rg8w4YoKZviECZ+71+xLdb9MnQ2M0VwGoS2cMDjfIz25UNYppd0HOKbSwBveDuwRBe
	 4e/TmchssuOOfFluDJptU4rq7Ewyht5kX5hbP0Okc8mCdw9OQQXwiQVV76ydgpDKvY
	 R4w392cF8gCbNCfnZGPRsoP/HpQge7DGNNeQJMvhiAEZZDGKOR0vnG/oaCJrInZ8jV
	 L/I5Ip3Y8PPew==
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
Subject: [RESEND 2/2] ARM: dts: qcom: msm8974-samsung-klte: correct fuel gauge interrupt trigger level
Date: Wed,  3 Mar 2021 19:28:16 +0100
Message-Id: <20210303182816.137255-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303182816.137255-1-krzk@kernel.org>
References: <20210303182816.137255-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maxim fuel gauge datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU.  The falling edge
interrupt will mostly work but it's not correct.

Fixes: da8d46992e67 ("ARM: dts: qcom: msm8974-klte: Add fuel gauge")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-By: Iskren Chernev <iskren.chernev@gmail.com>
Tested-By: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index a0f7f461f48c..2dadb836c5fe 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -717,7 +717,7 @@ fuelgauge@36 {
 			maxim,rcomp = /bits/ 8 <0x56>;
 
 			interrupt-parent = <&pma8084_gpios>;
-			interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&fuelgauge_pin>;
-- 
2.25.1

