Return-Path: <SRS0=HV0T=ZE=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411C2ECAAD3
	for <soc@archiver.kernel.org>; Thu,  1 Sep 2022 18:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05DCDC433C1; Thu,  1 Sep 2022 18:33:49 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EE45C433D6;
	Thu,  1 Sep 2022 18:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EE45C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id j17so14131977qtp.12;
        Thu, 01 Sep 2022 11:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=t4MOz4hyFM7udJrYf7fDh0BfCZhkVhHzgWpksUtpi5s=;
        b=erTAgaZdSIzj2sCqSc9m32MKjOfn5KYlQQfGZKlS0tOKgOvXNpOYRvItMFB7gJoTxm
         Et7RPS1etxX4HgAQpTeqJHU2ZEZOG0g9BC38gUsFbh553sbiDjqLCmJ4enAKjOc12lVx
         O3xviAmhEHWAifpiUlj8tuZQogj2CgvT7AId/mFpcnJxM7v5fx8jmzKOHKuX6eterJtB
         XCKdzzIu1gF5GKCdEm+X0ZNbCaRYYdCZzCg56R8PM7Dg4ME1mPEMLcZJXDQUSGFc0Q4k
         B4T5w+e/biuFf+IRDH4nNDPHp5Vxgi7FeUvnFbTQyc/H3hH+E3KyHenEdJmYEjPHEZNg
         VUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=t4MOz4hyFM7udJrYf7fDh0BfCZhkVhHzgWpksUtpi5s=;
        b=GreN9+OaE7jj0bZ0va3XL2FcCjWl9y4FWt4naavszYobvFKleHOV2uo7vVqdyo/vbK
         DRM2q3s08gE7n8Se5tpqJJcqjvbfxmFYh75dVpFU5RLRml9+Xx39NRaNpZShMtehx6pa
         ziwBWZ4+WR1qwmJ7Ttm6DFWZ4QDKEMZWdpB8uw2wSmbVPG/416VJEvIg7FkQSi6JiaqR
         8/hhJFxdfFY6w++53sUNUnlEpnLEfkWb88AAa2DUWNMwPg6paQ1sfqsVIje75dIoVZ+v
         O9Mg6pkvqJQQloDDRKWAW/+LxjN6TPkCgm4ty7z914RSrtrvnOs94P0HKhKZkNFVH8NI
         4QVQ==
X-Gm-Message-State: ACgBeo2FgB2I2Kd51bg8tKWS2DGM/oyQKANgIm6KKRvw+hBH+gDIMBVs
	Q7bU/L2BUjTyEw+wSPSxT5M=
X-Google-Smtp-Source: AA6agR6xpDwOMPSvTKBAaMMhdvQUxT30aSC5TWYUPsxs76GlD60pP91bDsz2MOK3LAfdx0ZLpGnBMA==
X-Received: by 2002:ac8:5b91:0:b0:344:55f7:da72 with SMTP id a17-20020ac85b91000000b0034455f7da72mr25122323qta.542.1662057226843;
        Thu, 01 Sep 2022 11:33:46 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u20-20020ac87514000000b00342e86b3bdasm10563343qtq.12.2022.09.01.11.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:33:45 -0700 (PDT)
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
Subject: [PATCH v6 00/10]  Add support for i.MXRT1170-evk
Date: Thu,  1 Sep 2022 14:33:33 -0400
Message-Id: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch continues support for the imxrt series now adding the imxrt1170

This patch contains:
- Update to imxrt_defconfig
- Devicetree
- Clock driver
- Pinctrl driver
- New pll

This patch also updates some documentation for both imxrt1170 an 1050.

The i.MXRT1170 has a vast array of features including two cores,
2 Ethernet, 2 USB phy, and a 2d gpu.

It also is featured in a new google coral board
https://coral.ai/products/dev-board-micro
Not affiliated unfortunately.

---
V1 -> V2:
 - Add 3 new commits in documentation
 - Fix spelling
---

Jesse Taube (10):
  dt-bindings: arm: imx: Add i.MXRT compatible Documentation
  dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
  dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT1170 compatible
  dt-bindings: serial: fsl-lpuart: add i.MXRT1170 compatible
  ARM: mach-imx: Add support for i.MXRT1170
  clk: imx: Update pllv3 to support i.MXRT1170
  dt-bindings: imx: Add clock binding for i.MXRT1170
  clk: imx: Add initial support for i.MXRT1170 clock driver
  ARM: dts: imx: Add i.MXRT1170-EVK support
  ARM: imxrt_defconfig: Add i.MXRT1170

 .../devicetree/bindings/arm/fsl.yaml          |  12 +
 .../bindings/mmc/fsl-imx-esdhc.yaml           |   4 +
 .../bindings/serial/fsl-lpuart.yaml           |   3 +
 .../devicetree/bindings/timer/fsl,imxgpt.yaml |   2 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/imxrt1170-evk.dts           | 110 +++
 arch/arm/boot/dts/imxrt1170.dtsi              | 276 +++++++
 arch/arm/configs/imxrt_defconfig              |  17 +
 arch/arm/mach-imx/mach-imxrt.c                |   1 +
 drivers/clk/imx/Kconfig                       |   7 +
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imxrt1170.c               | 749 ++++++++++++++++++
 drivers/clk/imx/clk-pllv3.c                   |  57 +-
 drivers/clk/imx/clk.h                         |  11 +-
 include/dt-bindings/clock/imxrt1170-clock.h   | 282 +++++++
 15 files changed, 1526 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/imxrt1170-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1170.dtsi
 create mode 100644 drivers/clk/imx/clk-imxrt1170.c
 create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h

-- 
2.36.1

