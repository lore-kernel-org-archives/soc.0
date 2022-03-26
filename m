Return-Path: <SRS0=yj5T=UF=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B80AC433EF
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 14:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06BF8C36AE2; Sat, 26 Mar 2022 14:43:22 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37F0FC2BBE4;
	Sat, 26 Mar 2022 14:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37F0FC2BBE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id v2so8797521qtc.5;
        Sat, 26 Mar 2022 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4EjMh1BXc6L+8+2yCB/wSo589PUQ7VAWNTCQaSkJ5DQ=;
        b=bX5hy0vhjxCbMhu+7P8AdpCsHwvPtkAzjWp8oIILb7PvQEqQPvSkMEtE8wD/zI+b4O
         A1iLDSA6UOIia18J1ieodiovWaDGODX2GAmQ03CXwXeBvvVIzteKT79vqPh1bBzg5Ov8
         1YeVjJgC+UlAujDFCZi/pcIqjXhKnbdFXi5V5ojTesq7e+tVoxZQXtTrPo6bzdprd0vh
         0J6fco6DGwJU7HGK5Ll5duDmf3vyzmPGSbla+z5IQ9HSUs8IqBCwY4CYWV36fcevaecN
         osbk0AMuA1eD9384huE9v64oB9jQDCGnctVakdgcHBnNVsj2O2hbDll3VrobpLyoLY/O
         MZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4EjMh1BXc6L+8+2yCB/wSo589PUQ7VAWNTCQaSkJ5DQ=;
        b=R2oDkacEh6bt4TJ3GvFCcRZNi1FcKD0wUHBbDL1NzyOV147qrJCT/cbnW0DXI3dScj
         tuyjGizCO3x8/HUt78kfOnwzVVdgyob9AfVS8EVyImR8j0bdgBnFNCiXMdK9ds208z/P
         mvv4w6obX3YjjnySQTF2Abwvk0C6oBEHOk8YQX5L+60KBamZHRSkbZLABKARwIbrvfH/
         OACBFukE+XzKmlHBtn/bHe9yhwUdWcrwcGRu+KdhDGISk4mzh1dJvLsCYGlsviUoZdrk
         svL1P/8FatyfNr5mEZ8g+tow6Q5izvGUiqZx3/TYwUmueF0o532WP+MqprJm6rbzMNSN
         T97g==
X-Gm-Message-State: AOAM530Wg9t74sldRgGesRBGK+Lu3o2sNTnukWrmi3lF4IRxmWkSUyG3
	Qe5eYNj1NvpZQnL/xt/4nJw=
X-Google-Smtp-Source: ABdhPJxlSMIB6q5kWqyaMQn/pan1GzoHN8bORyLMAqLixcIUaE8/0GbyYu4Eju9FJ1kveap/pQmo3Q==
X-Received: by 2002:a05:622a:155:b0:2e1:cc60:8947 with SMTP id v21-20020a05622a015500b002e1cc608947mr13974558qtw.243.1648305800092;
        Sat, 26 Mar 2022 07:43:20 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 70-20020a370649000000b0067b4cd8ffbasm4908918qkg.60.2022.03.26.07.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 07:43:18 -0700 (PDT)
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
Subject: [PATCH v1 00/12] Add support for the i.MXRT1170-evk
Date: Sat, 26 Mar 2022 10:43:01 -0400
Message-Id: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The i.MXRT1170 has a vast array of fetures includeing two cores. 2 Ethernet, 2 USB phy, and a 2d gpu.

It also is fetured in a new google coral board
https://coral.ai/products/dev-board-micro
Not affiliated unfortunaly.

Jesse Taube (12):
  dt-bindings: arm: imx: Add i.MXRT compatible Documentation
  dt-bindings: timer: gpt: Add i.MXRT compatible Documentation
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
 .../bindings/clock/imxrt1170-clock.yaml       |   59 +
 .../bindings/pinctrl/fsl,imxrt1170.yaml       |   77 +
 .../devicetree/bindings/timer/fsl,imxgpt.yaml |    2 +
 arch/arm/boot/dts/Makefile                    |    3 +-
 arch/arm/boot/dts/imxrt1170-evk.dts           |  126 ++
 arch/arm/boot/dts/imxrt1170-pinfunc.h         | 1561 +++++++++++++++++
 arch/arm/boot/dts/imxrt1170.dtsi              |  278 +++
 arch/arm/configs/imxrt_defconfig              |   26 +
 arch/arm/mach-imx/mach-imxrt.c                |    1 +
 drivers/clk/imx/Kconfig                       |    7 +
 drivers/clk/imx/Makefile                      |    1 +
 drivers/clk/imx/clk-imxrt1170.c               |  391 +++++
 drivers/clk/imx/clk-pllv3.c                   |   57 +-
 drivers/clk/imx/clk.h                         |    4 +
 drivers/pinctrl/freescale/Kconfig             |    7 +
 drivers/pinctrl/freescale/Makefile            |    1 +
 drivers/pinctrl/freescale/pinctrl-imxrt1170.c |  349 ++++
 include/dt-bindings/clock/imxrt1170-clock.h   |  282 +++
 19 files changed, 3241 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
 create mode 100644 arch/arm/boot/dts/imxrt1170-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1170-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imxrt1170.dtsi
 create mode 100644 drivers/clk/imx/clk-imxrt1170.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imxrt1170.c
 create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h

-- 
2.34.1

