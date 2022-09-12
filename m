Return-Path: <SRS0=ZTeZ=ZP=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E69ECAAD5
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 07:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACF26C433D6; Mon, 12 Sep 2022 07:16:07 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 0AEA5C433B5;
	Mon, 12 Sep 2022 07:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AEA5C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 12 Sep 2022 16:15:59 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 63B6220584CE;
	Mon, 12 Sep 2022 16:15:59 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 12 Sep 2022 16:15:59 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 02DA4B62A4;
	Mon, 12 Sep 2022 16:15:58 +0900 (JST)
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
Subject: [PATCH v2 8/9] arm64: dts: uniphier: Remove compatible "snps,dw-pcie" from pcie node
Date: Mon, 12 Sep 2022 16:15:53 +0900
Message-Id: <20220912071554.1480-9-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912071554.1480-1-hayashi.kunihiko@socionext.com>
References: <20220912071554.1480-1-hayashi.kunihiko@socionext.com>

The generic platform driver pcie-designware-plat.c doesn't work for
UniPhier PCIe host controller, because the controller has some
necessary initialization sequence for the controller-specific logic.

Currently the controller doesn't use "snps,dw-pcie" compatible,
so this is no longer needed. Remove the compatible string from the
pcie node.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 0d75a90d1342..e24784e12b7b 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -896,7 +896,7 @@ usb_ssphy1: ss-phy@310 {
 		};
 
 		pcie: pcie@66000000 {
-			compatible = "socionext,uniphier-pcie", "snps,dw-pcie";
+			compatible = "socionext,uniphier-pcie";
 			status = "disabled";
 			reg-names = "dbi", "link", "config";
 			reg = <0x66000000 0x1000>, <0x66010000 0x10000>,
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index f49a8db3e918..6277be04a974 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -873,7 +873,7 @@ usb1_ssphy0: ss-phy@300 {
 		};
 
 		pcie: pcie@66000000 {
-			compatible = "socionext,uniphier-pcie", "snps,dw-pcie";
+			compatible = "socionext,uniphier-pcie";
 			status = "disabled";
 			reg-names = "dbi", "link", "config";
 			reg = <0x66000000 0x1000>, <0x66010000 0x10000>,
-- 
2.25.1

