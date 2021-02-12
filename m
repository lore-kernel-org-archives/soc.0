Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25602C433E0
	for <soc@archiver.kernel.org>; Fri, 12 Feb 2021 16:26:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A7744601FF; Fri, 12 Feb 2021 16:26:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64F1660202;
	Fri, 12 Feb 2021 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613147213;
	bh=OwGW8enKxldd+NnFAPWb0VZSuZRCA3SF/WgjgHhPiiY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=SQTDafnT8McoSJ5ZcbYQEDJhip3MkEiOZUcWfhoXXp1zQoRv0mPtxIWkoMdQ3qN+p
	 yQM+DR29AtgFIVU3L747LtfIe86KUEjydKOXuwpq0FbyqoZQcHSRP71O83XeBv9jad
	 NVM5HVYEJQ8H0EgKcGuaUrFQWRyEe6IlMfTXh5Uot14RlPQQTiM9HbPlt5o0KBy8Z3
	 nVuX4636W+cnNZwrK388RxwL07dOR/XDvVF9Ginw4uCQDdZPiBPTxIckkNIgQ3AD0X
	 v6+r9Uo57qbabkmO2nqF+EHeqYgMHeJXfgdYXPx8Q5JA0H2SCocXzfdLWGWPCGndf6
	 iNaYxEVUTxzaQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH v3 1/2] ARM: dts: aspeed: fix PCA95xx GPIO expander properties on Portwell
Date: Fri, 12 Feb 2021 17:26:39 +0100
Message-Id: <20210212162640.66677-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCA95xx GPIO expander requires GPIO controller properties to operate
properly.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Joel Stanley <joel@jms.id.au>
---

Hi Arnd and Olof,

This is 5-months old patchset which was not picked up by Aspeed
maintainers, so could you take it directly?

Best regards,
Krzysztof


 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
index 4a1ca8f5b6a7..03c161493ffc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -121,6 +121,8 @@ &i2c5 {
 	pca9555@27 {
 		compatible = "nxp,pca9555";
 		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
 };
 
-- 
2.25.1

