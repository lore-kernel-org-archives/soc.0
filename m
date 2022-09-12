Return-Path: <SRS0=ZTeZ=ZP=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA364ECAAA1
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 07:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE7C4C43470; Mon, 12 Sep 2022 07:16:00 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 3FE86C433C1;
	Mon, 12 Sep 2022 07:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FE86C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 12 Sep 2022 16:15:57 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id A08F820584CE;
	Mon, 12 Sep 2022 16:15:57 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 12 Sep 2022 16:15:57 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 57951B62A4;
	Mon, 12 Sep 2022 16:15:57 +0900 (JST)
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
Subject: [PATCH v2 0/9] Update UniPhier armv8 devicetree
Date: Mon, 12 Sep 2022 16:15:45 +0900
Message-Id: <20220912071554.1480-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.17.1

Update devicetree sources for UniPhier armv8 SoCs to remove dtschema
warnings, add support existing features that haven't yet been
described, and replace constants with macros.

Changes since v1:
- Exclue usb fixed patch (already applied)
- Describe the reason why removing generic pcie compatible
- Add L2 cache node patch

Kunihiko Hayashi (9):
  arm64: dts: uniphier: Rename pvtctl node to thermal-sensor
  arm64: dts: uniphier: Rename usb-phy node to usb-glue
  arm64: dts: uniphier: Rename gpio-hog nodes
  arm64: dts: uniphier: Use GIC interrupt definitions
  arm64: dts: uniphier: Add ahci controller and glue layer nodes for
    PXs3
  arm64: dts: uniphier: Add USB-device support for PXs3 reference board
  arm64: dts: uniphier: Fix opp-table node name for LD20
  arm64: dts: uniphier: Remove compatible "snps,dw-pcie" from pcie node
  arm64: dts: uniphier: Add L2 cache node

 arch/arm/boot/dts/uniphier-pinctrl.dtsi       |  10 ++
 arch/arm64/boot/dts/socionext/Makefile        |   4 +-
 .../boot/dts/socionext/uniphier-ld11-ref.dts  |   6 +-
 .../boot/dts/socionext/uniphier-ld11.dtsi     |  59 ++++---
 .../dts/socionext/uniphier-ld20-akebi96.dts   |   6 +-
 .../boot/dts/socionext/uniphier-ld20-ref.dts  |   6 +-
 .../boot/dts/socionext/uniphier-ld20.dtsi     |  80 ++++++----
 .../socionext/uniphier-pxs3-ref-gadget0.dts   |  41 +++++
 .../socionext/uniphier-pxs3-ref-gadget1.dts   |  40 +++++
 .../boot/dts/socionext/uniphier-pxs3-ref.dts  |  14 +-
 .../boot/dts/socionext/uniphier-pxs3.dtsi     | 148 ++++++++++++++----
 11 files changed, 313 insertions(+), 101 deletions(-)
 create mode 100644 arch/arm64/boot/dts/socionext/uniphier-pxs3-ref-gadget0.dts
 create mode 100644 arch/arm64/boot/dts/socionext/uniphier-pxs3-ref-gadget1.dts

-- 
2.25.1

