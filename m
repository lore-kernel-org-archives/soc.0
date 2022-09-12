Return-Path: <SRS0=ZTeZ=ZP=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE993C6FA90
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 07:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99D3EC433D7; Mon, 12 Sep 2022 07:16:27 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 80942C433D6;
	Mon, 12 Sep 2022 07:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80942C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 12 Sep 2022 16:15:14 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 68B2F20584CE;
	Mon, 12 Sep 2022 16:15:14 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 12 Sep 2022 16:15:14 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 08025B62A4;
	Mon, 12 Sep 2022 16:15:14 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 2/8] ARM: dts: uniphier: Rename usb-phy node to usb-glue
Date: Mon, 12 Sep 2022 16:15:05 +0900
Message-Id: <20220912071511.1385-3-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912071511.1385-1-hayashi.kunihiko@socionext.com>
References: <20220912071511.1385-1-hayashi.kunihiko@socionext.com>

Actual phy nodes are each child node. The parent node should be usb-glue
node. This applies to the devicetre for Pro4 SoC.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-pro4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
index a53b73ee93e9..cf62821c69ca 100644
--- a/arch/arm/boot/dts/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
@@ -376,7 +376,7 @@ pinctrl: pinctrl {
 				compatible = "socionext,uniphier-pro4-pinctrl";
 			};
 
-			usb-phy {
+			usb-glue {
 				compatible = "socionext,uniphier-pro4-usb2-phy";
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.25.1

