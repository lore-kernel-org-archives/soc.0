Return-Path: <SRS0=xV2k=ZQ=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00570C6FA86
	for <soc@archiver.kernel.org>; Tue, 13 Sep 2022 04:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD252C43470; Tue, 13 Sep 2022 04:22:55 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id B8CA3C433C1;
	Tue, 13 Sep 2022 04:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8CA3C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Sep 2022 13:22:52 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 60CE320584CE;
	Tue, 13 Sep 2022 13:22:52 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 13 Sep 2022 13:22:52 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 1301DB62A4;
	Tue, 13 Sep 2022 13:22:52 +0900 (JST)
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
Subject: [PATCH v3 0/9] Update UniPhier armv7 devicetree
Date: Tue, 13 Sep 2022 13:22:40 +0900
Message-Id: <20220913042249.4708-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1

Update devicetree sources for UniPhier armv7 SoCs to remove dtschema
warnings, add support existing features that haven't yet been
described, and replace constants with macros.

Changes since v2:
- Rename the nodes for usb external controller to "usb-controller"
- Fix the node names for sata

Changes since v1:
- Exclude usb fixed patch (already applied)
- Describe the reason why removing generic pcie-ep compatible

Kunihiko Hayashi (9):
  ARM: dts: uniphier: Rename pvtctl node to thermal-sensor
  ARM: dts: uniphier: Rename usb-phy node for USB2 to usb-controller
  ARM: dts: uniphier: Rename usb-glue node for USB3 to usb-controller
  ARM: dts: uniphier: Rename gpio-hog node
  ARM: dts: uniphier: Use GIC interrupt definitions
  ARM: dts: uniphier: Add ahci controller nodes for Pro4
  ARM: dts: uniphier: Add ahci controller nodes for PXs2
  ARM: dts: uniphier: Move interrupt-parent property to each child node
    in uniphier-support-card
  ARM: dts: uniphier: Remove compatible "snps,dw-pcie-ep" from pcie-ep
    node

 arch/arm/boot/dts/uniphier-ld4-ref.dts       |   6 +-
 arch/arm/boot/dts/uniphier-ld4.dtsi          |  49 +++---
 arch/arm/boot/dts/uniphier-ld6b-ref.dts      |   6 +-
 arch/arm/boot/dts/uniphier-pro4-ace.dts      |   8 +
 arch/arm/boot/dts/uniphier-pro4-ref.dts      |  14 +-
 arch/arm/boot/dts/uniphier-pro4.dtsi         | 167 +++++++++++++++----
 arch/arm/boot/dts/uniphier-pro5.dtsi         |  57 ++++---
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts   |   4 +
 arch/arm/boot/dts/uniphier-pxs2.dtsi         | 102 +++++++----
 arch/arm/boot/dts/uniphier-sld8-ref.dts      |   6 +-
 arch/arm/boot/dts/uniphier-sld8.dtsi         |  49 +++---
 arch/arm/boot/dts/uniphier-support-card.dtsi |   3 +-
 12 files changed, 335 insertions(+), 136 deletions(-)

-- 
2.25.1

