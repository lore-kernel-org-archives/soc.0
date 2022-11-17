Return-Path: <SRS0=ZlBq=3R=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE1C4332F
	for <soc@archiver.kernel.org>; Thu, 17 Nov 2022 16:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91AD8C433D6; Thu, 17 Nov 2022 16:32:33 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id 53A2CC433C1;
	Thu, 17 Nov 2022 16:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53A2CC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 18 Nov 2022 01:32:23 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id C421B2058B4F;
	Fri, 18 Nov 2022 01:32:23 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 18 Nov 2022 01:32:23 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 5E861B62A4;
	Fri, 18 Nov 2022 01:32:23 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/2] Add UniPhier Pro5 boards support
Date: Fri, 18 Nov 2022 01:32:17 +0900
Message-Id: <20221117163219.3673-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the boards with Pro5 SoC.
These boards have UART, I2C, USB, eMMC and PCI endpoint.

This series is part of the previous series shown below:
https://lore.kernel.org/linux-arm-kernel/20221107103410.3443-1-hayashi.kunihiko@socionext.com

Kunihiko Hayashi (2):
  dt-bindings: arm: uniphier: Add Pro5 boards
  ARM: dts: uniphier: Add Pro5 board support

 .../bindings/arm/socionext/uniphier.yaml      |  6 ++
 arch/arm/boot/dts/Makefile                    |  2 +
 arch/arm/boot/dts/uniphier-pro5-epcore.dts    | 76 +++++++++++++++++++
 arch/arm/boot/dts/uniphier-pro5-proex.dts     | 59 ++++++++++++++
 4 files changed, 143 insertions(+)
 create mode 100644 arch/arm/boot/dts/uniphier-pro5-epcore.dts
 create mode 100644 arch/arm/boot/dts/uniphier-pro5-proex.dts

-- 
2.25.1

