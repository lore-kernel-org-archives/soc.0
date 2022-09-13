Return-Path: <SRS0=xV2k=ZQ=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30753C6FA82
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 04:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16923C433C1; Tue, 13 Sep 2022 04:22:58 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 6B7F9C433D6;
	Tue, 13 Sep 2022 04:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B7F9C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 13 Sep 2022 13:22:54 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 700982059027;
	Tue, 13 Sep 2022 13:22:54 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 13 Sep 2022 13:22:54 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id DF23AB62AE;
	Tue, 13 Sep 2022 13:22:53 +0900 (JST)
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
Subject: [PATCH v3 9/9] ARM: dts: uniphier: Remove compatible "snps,dw-pcie-ep" from pcie-ep node
Date: Tue, 13 Sep 2022 13:22:49 +0900
Message-Id: <20220913042249.4708-10-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>
References: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>

The generic platform driver pcie-designware-plat.c doesn't work for
UniPhier PCIe endpoint controller, because the controller has some
necessary initialization sequence for the controller-specific logic.

Currently the controller doesn't use "snps,dw-pcie-ep" compatible,
so this is no longer needed. Remove the compatible string from the
pcie-ep node.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-pro5.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
index 33221d7130f1..100edd7438d8 100644
--- a/arch/arm/boot/dts/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
@@ -620,8 +620,7 @@ usb1_ssphy0: ss-phy@380 {
 		};
 
 		pcie_ep: pcie-ep@66000000 {
-			compatible = "socionext,uniphier-pro5-pcie-ep",
-				     "snps,dw-pcie-ep";
+			compatible = "socionext,uniphier-pro5-pcie-ep";
 			status = "disabled";
 			reg-names = "dbi", "dbi2", "link", "addr_space";
 			reg = <0x66000000 0x1000>, <0x66001000 0x1000>,
-- 
2.25.1

