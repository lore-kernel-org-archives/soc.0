Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7640BC433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AD80C385B8; Tue, 17 May 2022 03:27:14 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69296C385AA;
	Tue, 17 May 2022 03:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69296C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id x9so13521827qts.6;
        Mon, 16 May 2022 20:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8OzbVhmvKVxK/u+pL6n9TauT5Oh9WvboLvLjjb1RlRk=;
        b=BgCdYpYNXu306BHOTvnmSonHejrzK3ESYT7NOSQtVzvNTIvHxN5mSL01bvIyRGGhFa
         ioL91MflFY14b5O/5cHLeEVG01wLAh9mZg2Wtv/V8pagexAb06ewVp6oMkdqN95gvBKs
         qQ6faSSfzJBMQGbrUsiEX+I05IDGLilf8TIx37xF8NWsL/CyIVo04R/b2dFQ5ta528Mn
         BvmbVVR2CSLhuwiO0a29ZHqef8p2IbCPGIM8aBW6t/81IILmjkTVzThAlUYZHO8o5k9Q
         19RQhofoUzml4kdOzKb6ifw+UxO0BGmoQDfTqugajrz/knh7Zs426k9PYZWettfylOfi
         VTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8OzbVhmvKVxK/u+pL6n9TauT5Oh9WvboLvLjjb1RlRk=;
        b=ol1PtNjVJlCRmlXgPKmnT+V+ulzkxd+5mPoZ0jC++MdJzOwkPQAvDcqNhAJbCz/gXS
         UwUNlOVjsTx9Wbtl1krMvR8iCUgtDzQHW3P2xuQuN9nVIXZjieoxIPLM2Hnnk0mj6whZ
         lZ7Cocwk5qbrJA+aJhnP1tBN37hKE8Pz3H9trEgmJoE038kC7Qyu2BNN5cHpfL1kTrdT
         7YR7bULHv8XxTEkEVdqVeRSHQugbEKU8lhV0/utRVRb6pZ2XHIwpPhxPV7G8mQVd9HBR
         2z+Zwmh+zYL2zp7LW0/3H4dNpLHffATCXJ6vuFC3GXsorgcyx2CTAHqJF6IbETUSK0o6
         JoHg==
X-Gm-Message-State: AOAM531u2JdeHhnwaeipXQVHlrsBEGQwZj6eNgGwm7VS5pT8+dSZWoYD
	UAngSUKepq+CkUNTj1k1E90=
X-Google-Smtp-Source: ABdhPJxFWj/rbR+PTt40M4n8xOok0WUFw9aKcl5QAMJEV26x9rlDKi1QCzRlm3in97mSogBX6aCT/Q==
X-Received: by 2002:a05:622a:392:b0:2f3:d303:dd6b with SMTP id j18-20020a05622a039200b002f3d303dd6bmr18263879qtx.484.1652758032360;
        Mon, 16 May 2022 20:27:12 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u129-20020a372e87000000b0069fc13ce1f6sm6893635qkh.39.2022.05.16.20.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:27:11 -0700 (PDT)
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
Subject: [PATCH v3 00/15] Add support for the i.MXRT1170-evk
Date: Mon, 16 May 2022 23:26:55 -0400
Message-Id: <20220517032710.451537-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
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
  clk: imx: Update pllv3 to support i.MXRT1170
  dt-bindings: imx: Add clock binding for i.MXRT1170
  clk: imx: Add initial support for i.MXRT1170 clock driver
  pinctrl: freescale: Add i.MXRT1170 pinctrl driver support
  ARM: dts: imxrt1170-pinfunc: Add pinctrl binding header
  ARM: dts: imx: Add i.MXRT1170-EVK support
  ARM: imxrt_defconfig: Add i.MXRT1170

 .../devicetree/bindings/arm/fsl.yaml          |   12 +
 .../bindings/clock/fsl,imxrt1170-clock.yaml   |   57 +
 .../bindings/gpio/fsl-imx-gpio.yaml           |    2 +
 .../bindings/mmc/fsl-imx-esdhc.yaml           |    4 +
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
 drivers/clk/imx/clk-imxrt1170.c               |  451 +++++
 drivers/clk/imx/clk-pllv3.c                   |   57 +-
 drivers/clk/imx/clk.h                         |    4 +
 drivers/pinctrl/freescale/Kconfig             |    7 +
 drivers/pinctrl/freescale/Makefile            |    1 +
 drivers/pinctrl/freescale/pinctrl-imxrt1170.c |  349 ++++
 include/dt-bindings/clock/imxrt1170-clock.h   |  282 +++
 22 files changed, 3282 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
 create mode 100644 arch/arm/boot/dts/imxrt1170-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1170-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imxrt1170.dtsi
 create mode 100644 drivers/clk/imx/clk-imxrt1170.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imxrt1170.c
 create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h

-- 
2.36.1

