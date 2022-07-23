Return-Path: <SRS0=T1wL=X4=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2F4C43334
	for <soc@archiver.kernel.org>; Sat, 23 Jul 2022 16:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6F6BC341C7; Sat, 23 Jul 2022 16:05:18 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EABA2C341C0;
	Sat, 23 Jul 2022 16:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EABA2C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id i13so5464824qvo.3;
        Sat, 23 Jul 2022 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NiBXHZtiNNzM7sHjjwSiAophF4Tu0dmf3XqMGID1JOM=;
        b=gRlQXzeTLOdtN2sYz2mwN+kdfbohHDPBoWrR0vt1QqZOpEJf8qWYqJRApWT4AkkEHB
         6ZoJLwk8Y1qqD13NypUe8ZMHXPlF1Xwmc2i5NmYyBHI0y4TvgsSgalxdx6dUL8EywhSp
         4/aWAKZZgvp04WaLmJDXV8yuQuriLEYblcQYgGrLRJ7xeGvJeIP0wPmXhABQ5YVhoRE0
         xhfn+BdA2s6sKDw+gBi5LY99iqqIAfJY7rdx8YiiaWSGvGoeS8/iG04REyKb6sydRN1E
         TH+iAD9qOBlL+3KlUuK3K7/tqGMQOF4YBW0rbsfTla3SQYI9WhINmzVgIMgDTDwmVJs8
         uQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NiBXHZtiNNzM7sHjjwSiAophF4Tu0dmf3XqMGID1JOM=;
        b=mxo0SLFjrSR0j6VLSdf3Hqa5knkUmG9ygXMyuvF7OIahjFMIQ/IenwG9Cl7+orrYnl
         /YXzC1xmxStCP4qItxnhyQj0R5/BCa/P0V7ippldkJeCKeSEMSxF6We7dL2TDtQ5rslq
         jd4eBGCk+eu1q0mc6M9E6lPmeA5Igj9V9WNEkZBG3eCbAE9lcHQu9BTVqf+22kIOlYyq
         mI9JhZQoi8q4GA7jBvYIih6pf6UMP8XRfWWZPp1wSZLx6FRHlZt/fgYr0CLzGBAN8IgI
         bJe95ElgvaKORajvqARsJUMUb5KOLVNglrP37olE1zo6h/FUVVFmWduySpoKPNi8LfR9
         AR/A==
X-Gm-Message-State: AJIora9zBZRt/olaUAALt5qAhqAfqnWKrFlrkDDrHahkhRPOq/ZUqmP5
	ZdzYWkkNJmMR+uXqd3+rEk0=
X-Google-Smtp-Source: AGRyM1tFGvEAl9/tyu4hF4NNXrnTxNm3w9+iEprFORt+uxL5yPCUzTz4QtHT1LgBfv2VcIgWE/nRvw==
X-Received: by 2002:ad4:5c62:0:b0:473:4585:292f with SMTP id i2-20020ad45c62000000b004734585292fmr4330419qvh.16.1658592316875;
        Sat, 23 Jul 2022 09:05:16 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87f44000000b0031eb3af3ffesm4935046qtk.52.2022.07.23.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 09:05:15 -0700 (PDT)
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
Subject: [PATCH v5 00/12] Add support for the i.MXRT1170-evk
Date: Sat, 23 Jul 2022 12:05:01 -0400
Message-Id: <20220723160513.271692-1-Mr.Bossman075@gmail.com>
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

Jesse Taube (12):
  dt-bindings: arm: imx: Add i.MXRT compatible Documentation
  dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
  dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles
  dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170 compatible
  dt-bindings: serial: fsl-lpuart: add i.MXRT1170 compatible
  ARM: mach-imx: Add support for i.MXRT1170
  clk: imx: Update pllv3 to support i.MXRT1170
  dt-bindings: imx: Add clock binding for i.MXRT1170
  clk: imx: Add initial support for i.MXRT1170 clock driver
  ARM: dts: imxrt1170-pinfunc: Add pinctrl binding header
  ARM: dts: imx: Add i.MXRT1170-EVK support
  ARM: imxrt_defconfig: Add i.MXRT1170

 .../devicetree/bindings/arm/fsl.yaml          |   12 +
 .../bindings/gpio/fsl-imx-gpio.yaml           |    2 +
 .../bindings/mmc/fsl-imx-esdhc.yaml           |    4 +
 .../bindings/serial/fsl-lpuart.yaml           |    3 +
 .../devicetree/bindings/timer/fsl,imxgpt.yaml |    2 +
 arch/arm/boot/dts/Makefile                    |    3 +-
 arch/arm/boot/dts/imxrt1170-evk.dts           |  110 ++
 arch/arm/boot/dts/imxrt1170-pinfunc.h         | 1561 +++++++++++++++++
 arch/arm/boot/dts/imxrt1170.dtsi              |  276 +++
 arch/arm/configs/imxrt_defconfig              |   17 +
 arch/arm/mach-imx/mach-imxrt.c                |    1 +
 drivers/clk/imx/Kconfig                       |    7 +
 drivers/clk/imx/Makefile                      |    1 +
 drivers/clk/imx/clk-imxrt1170.c               |  749 ++++++++
 drivers/clk/imx/clk-pllv3.c                   |   57 +-
 drivers/clk/imx/clk.h                         |   11 +
 include/dt-bindings/clock/imxrt1170-clock.h   |  282 +++
 17 files changed, 3091 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/imxrt1170-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1170-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imxrt1170.dtsi
 create mode 100644 drivers/clk/imx/clk-imxrt1170.c
 create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h

-- 
2.36.1

