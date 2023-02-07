Return-Path: <SRS0=fIlS=6D=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A82C05027
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 02:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E649C4339B; Tue,  7 Feb 2023 02:35:21 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 327B3C433EF;
	Tue,  7 Feb 2023 02:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 327B3C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 07 Feb 2023 11:35:17 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id CA0ED2020780;
	Tue,  7 Feb 2023 11:35:17 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 7 Feb 2023 11:35:11 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 864D2A8556;
	Tue,  7 Feb 2023 11:35:17 +0900 (JST)
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
Subject: [PATCH 0/8] Update UniPhier devicetree for 6.3
Date: Tue,  7 Feb 2023 11:35:06 +0900
Message-Id: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update devicetree sources for UniPhier SoCs to align node names
to generic, add missing properties and compatible strings,
and add SD UHS property.

The SD UHS mode patches are related to the series:
https://lore.kernel.org/lkml/20230125010201.28246-4-hayashi.kunihiko@socionext.com/

Kunihiko Hayashi (8):
  ARM: dts: uniphier: Align node names for SoC-dependent controller and
    PHYs with bindings
  ARM: dts: uniphier: Add missing reg properties for glue layer
  ARM: dts: uniphier: Add syscon compatible string to soc-glue-debug
  ARM: dts: uniphier: Add syscon-uhs-mode to SD node
  arm64: dts: uniphier: Align node names for SoC-dependent controller
    and PHYs with bindings
  arm64: dts: uniphier: Add missing reg properties for glue layer nodes
  arm64: dts: uniphier: Add syscon compatible string to soc-glue-debug
  arm64: dts: uniphier: Add syscon-uhs-mode to SD node

 arch/arm/boot/dts/uniphier-ld4.dtsi           | 25 +++++-----
 arch/arm/boot/dts/uniphier-pro4.dtsi          | 44 ++++++++++-------
 arch/arm/boot/dts/uniphier-pro5.dtsi          | 42 +++++++++-------
 arch/arm/boot/dts/uniphier-pxs2.dtsi          | 49 ++++++++++---------
 arch/arm/boot/dts/uniphier-sld8.dtsi          | 26 +++++-----
 .../boot/dts/socionext/uniphier-ld11.dtsi     | 35 ++++++-------
 .../boot/dts/socionext/uniphier-ld20.dtsi     | 45 +++++++++--------
 .../boot/dts/socionext/uniphier-pxs3.dtsi     | 48 ++++++++++--------
 8 files changed, 171 insertions(+), 143 deletions(-)

-- 
2.25.1

