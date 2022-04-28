Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFDCC433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 004B8C385AD; Thu, 28 Apr 2022 21:48:43 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39A88C385A9;
	Thu, 28 Apr 2022 21:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39A88C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id fu47so4495344qtb.5;
        Thu, 28 Apr 2022 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIMlgJSaKUPK/7h5zWJY806lZYuOHK/ks0bPYi8ucDM=;
        b=Zt+bvY76wYsDI7E65dSTCp/J1neJLwfZf2/lF6fJGOA/G2XNDh7bjU/T6Tv+A2Yhs9
         EaRuU79TNxPgDfBuT6bJ+DKsaBxyMjmBoMAEUgM4KF0268I0ycwxRulpOrw7oP4o0lN+
         DPPufuljc49giVM20JXEN36af3Lo8IyoTn4WaLzAczKDgKASWEs2r6qFMcApTnKrPpG5
         TFplqrhLRbjO24cU34qw28nkfxL198FO9T0Y4/zGT5cpHAnzFBPmPY4fye8LDXfO/0Fn
         EJYTIRtB3TCX4E5OMrvVgeSla7/eIxn6xJTABUBRqH6c7Y9i8woYuOCJ4eRPtSHumMkF
         SX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIMlgJSaKUPK/7h5zWJY806lZYuOHK/ks0bPYi8ucDM=;
        b=RDJnpljxtPgkGwyj3b5mzg0++uOZbsEuBZgq/Xh0J4k1WpFjIG3nrckLlsafEadEeB
         l3cDvYaE1v0k+tVjZ49VVGARdi0FNFqjysd0ksRm2Sd3lfMkDZnX5e13NU3jOjaeSTnL
         1ky1TxzL2fZPf1PdcZSktCQlVNw42ttaB2qYY2DRNretDkmFqkcJKcCUab2xjN7NT6Xb
         0us00mKnchJxUSpMUcw1Dw2g42rEsizNWht71u+z7AGksj4icdyIpW2xQzATGy0yT9CD
         dp/tpfd/dBJPgHXaqJaoL60DLgHiiiFoa5TPOOONBlPGeiLx8N7lv92d33nMxVSStj04
         mzUw==
X-Gm-Message-State: AOAM5313w8HFTrj5mEZh0N9o5aBy5mIin56kE5raeVvRjw1+oRKPIE3O
	ZwiAWgMqR04SG5kRkoFNv6M=
X-Google-Smtp-Source: ABdhPJwv7QoELiYIxAsHxP9fTnCc+z0UzfaWK8FSssVnSNQhwArB1XB1ki5jmvztP7lDwMwP6f1u/g==
X-Received: by 2002:ac8:7fcc:0:b0:2f2:5bf:6c with SMTP id b12-20020ac87fcc000000b002f205bf006cmr24992257qtk.655.1651182521178;
        Thu, 28 Apr 2022 14:48:41 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:48:40 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	dev@lynxeye.de,
	marcel.ziswiler@toradex.com,
	tharvey@gateworks.com,
	leoyang.li@nxp.com,
	sebastian.reichel@collabora.com,
	cniedermaier@dh-electronics.com,
	Mr.Bossman075@gmail.com,
	clin@suse.com,
	giulio.benetti@benettiengineering.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 00/15] Add support for the i.MXRT1170-evk
Date: Thu, 28 Apr 2022 17:48:23 -0400
Message-Id: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch continues support for the imxrt series now with the imxrt1170

This patch contains:
- Update to imxrt_defconfig
- Devicetree
- Clock driver
- Pinctrl driver
- New pll

This patch also updates some documentation for both imxrt1170 an 1050.

The i.MXRT1170 has a vast array of features including two cores. 2 Ethernet, 2 USB phy, and a 2d gpu.

It also is featured in a new google coral board
https://coral.ai/products/dev-board-micro
Not affiliated unfortunately.

---
V1 -> V2:
 - Add 3 new commits in documentation
 - Fix spelling
---
Jesse Taube (15):
  dt-bindings: arm: imx: Add i.MXRT compatible Documentation
  dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
  dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles
  dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170 compatible
  dt-bindings: serial: fsl-lpuart: add i.MXRT1170 compatible
  dt-bindings: pinctrl: add i.MXRT1170 pinctrl Documentation
  dt-bindings: clock: imx: Add documentation for i.MXRT1170 clock
  ARM: mach-imx: Add support for i.MXRT1170
  ARM: clk: imx: Update pllv3 to support i.MXRT1170
  dt-bindings: imx: Add clock binding for i.MXRT1170
  clk: imx: Add initial support for i.MXRT1170 clock driver
  pinctrl: freescale: Add i.MXRT1170 pinctrl driver support
  ARM: dts: imxrt1170-pinfunc: Add pinctrl binding header
  ARM: dts: imx: Add i.MXRT1170-EVK support
  ARM: imxrt_defconfig: Add i.MXRT1170

 .../devicetree/bindings/arm/fsl.yaml          |   12 +
 .../bindings/clock/fsl,imxrt1170-clock.yaml   |   59 +
 .../bindings/gpio/fsl-imx-gpio.yaml           |    2 +
 .../bindings/mmc/fsl-imx-esdhc.yaml           |    6 +
 .../bindings/pinctrl/fsl,imxrt1170.yaml       |   77 +
 .../bindings/serial/fsl-lpuart.yaml           |    4 +
 .../devicetree/bindings/timer/fsl,imxgpt.yaml |    2 +
 arch/arm/boot/dts/Makefile                    |    3 +-
 arch/arm/boot/dts/imxrt1170-evk.dts           |  110 ++
 arch/arm/boot/dts/imxrt1170-pinfunc.h         | 1561 +++++++++++++++++
 arch/arm/boot/dts/imxrt1170.dtsi              |  276 +++
 arch/arm/configs/imxrt_defconfig              |   17 +
 arch/arm/mach-imx/mach-imxrt.c                |    1 +
 drivers/clk/imx/Kconfig                       |    7 +
 drivers/clk/imx/Makefile                      |    1 +
 drivers/clk/imx/clk-imxrt1170.c               |  536 ++++++
 drivers/clk/imx/clk-pllv3.c                   |   57 +-
 drivers/clk/imx/clk.h                         |    4 +
 drivers/pinctrl/freescale/Kconfig             |    7 +
 drivers/pinctrl/freescale/Makefile            |    1 +
 drivers/pinctrl/freescale/pinctrl-imxrt1170.c |  349 ++++
 include/dt-bindings/clock/imxrt1170-clock.h   |  282 +++
 22 files changed, 3371 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
 create mode 100644 arch/arm/boot/dts/imxrt1170-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1170-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imxrt1170.dtsi
 create mode 100644 drivers/clk/imx/clk-imxrt1170.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imxrt1170.c
 create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h

-- 
2.35.1

