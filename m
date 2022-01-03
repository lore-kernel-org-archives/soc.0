Return-Path: <SRS0=jcq3=RT=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E862C4332F
	for <soc@archiver.kernel.org>; Mon,  3 Jan 2022 23:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5746BC36AEF; Mon,  3 Jan 2022 23:39:55 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5ADE7C36AED;
	Mon,  3 Jan 2022 23:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5ADE7C36AED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id v4so29883824qtk.0;
        Mon, 03 Jan 2022 15:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ncIb+jsBpIyCNEYUkcWgxTVrjUDrQlT+MkVhne4ZvLE=;
        b=AhNExDjlZr0Cr/wqfi4QgBYnjpLlj4w9ooRQGVL/HmDhwd3vOxI6aQCTLBNIpYdE2r
         01xZMDT0W9oloVXiF037pq0bgpMYd6Zv4bAvqe9dtP9WkGCjWPiFN46GQUBmtO4XU1CW
         7L8WlS8jIRVUzPYGVdQVHTgH4WH0lGoWchoWjupriPBWkCXi/vR+SkmJl860Vu6XpkE8
         5PAms71xLgNRduWbSU+iAUgGDBY4sm2IUb6bIPaZBYRWVOgRJzpHT3U+JfiFgJRgCvFb
         LXn7/biyJBAF9P2J8YVpOoom/cN5erMNdKlHe0VYzhQBbZUE3IhakJVJIqIPz02xHXCJ
         sePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ncIb+jsBpIyCNEYUkcWgxTVrjUDrQlT+MkVhne4ZvLE=;
        b=bw8BEF8AeJIpdxwkjV8nNxeouUTiLoP9itfebLY21RM5IQ/gM0AxfksuAYBkyes2y0
         8sxIsRREcG2HRvRwRaCL4pIGGztQ/AUACxiUfLiKMIK9LpIVtzOYhr+3UrrVFJE40W7I
         jJcQq2qOGQ8sCaNLv/tZHj1E+lOiyG/kZO9Vv1JyYDH+COTnrfAL/GpFiAqYGOMIcvp/
         uxO1NVJ1gk56M8Gei80RPXl5HdyiMbtnAgWyleBPNo1EgqRmKJmJK6ke1WdL0BiuMCHf
         qPvGRkajIpsiCIk2bZA/p9WKNfMKRXH9YtjiR5IttafIor41a3g9vJ7v2FGwc2T8awPR
         SzYw==
X-Gm-Message-State: AOAM530imtJ2EfSDunRzlGcj7uSzPShjrZDdoa4tq983ib5Nbz0I3rUu
	p5jIYixLaQHLS97DMxtAzCE=
X-Google-Smtp-Source: ABdhPJwyivGdR7q9+zaDnfGWeABqmK/GVvYLJN2XUeKHTqiNrQH8RZesfXihw6vh+4esqH/03amT0A==
X-Received: by 2002:ac8:58cc:: with SMTP id u12mr42787952qta.385.1641253193349;
        Mon, 03 Jan 2022 15:39:53 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id o5sm26965991qkp.132.2022.01.03.15.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 15:39:53 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	ulf.hansson@linaro.org,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	adrian.hunter@intel.com,
	jirislaby@kernel.org,
	giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp,
	Mr.Bossman075@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v7 0/7] Add initial support for the i.MXRTxxxx SoC family starting from i.IMXRT1050 SoC.
Date: Mon,  3 Jan 2022 18:39:41 -0500
Message-Id: <20220103233948.198119-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset contains:
- i.MXRT10xx family infrastructure
- i.MXRT1050 pinctrl driver adaption
- i.MXRT1050 clock driver adaption
- i.MXRT1050 sd-card driver adaption
- i.MXRT1050 uart driver adaption
- i.MXRT1050-evk basic support

The i.MXRTxxxx family that could have support by Linux actually spreads
from i.MXRT1020 to i.MXRT1170 with the first one supporting 1 USB OTG &
100M ethernet with a cortex-M7@500Mhz up to the latter with i.MXRT1170
with cortex-M7@1Ghz and cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU,
2x 1Gb and 1x 100Mb ENET. The i.MXRT family is NXP's answer to
STM32F7XX, as it uses only simple SDRAM, it gives the chance of a 4 or
less layer PCBs. Seeing that these chips are comparable to the
STM32F7XXs which have linux ported to them it seems reasonable to add
support for them.

Giving Linux support to this family should ease the development process,
instead of using a RTOS they could use Embedded Linux allowing for more
portability, ease of design and will broaden the scope of people using
embedded linux.

The EVK has very little SDRAM, generally 32MB starting from
i.MXRT1020(the lowest P/N), although the i.MXRT1160/70 provide instead
64MB of SDRAM for more functionality.

At the moment we do not support XIP for either u-boot or Linux but it
should be done in the future. XIP will also save SDRAM.

Another interesting fact is the amount of internal SRAM, as the P/N
increases the SRAM will reach up to 2MB(some could be for cache and
some would be for video).

Also, some parts have embed flash of 4MB that can be used for
u-boot/Linux, if both correctly sized it will leave the SDRAM free.

External flash can be Quad SPI and HyperFlash, so throughput would be
decent.

The i.MXRT11xx series supports MIPI interface too.

The family in general provide CAN bus, audio I/O, 1 or more
USB(otg/host), 1 or more 100Mb/1Gb ethernet, camera interface, sd-card.

All this can be used for simple GUIs, web-servers, point-of-sale
stations, etc.


Giulio Benetti (4):
  ARM: imx: Add initial support for i.MXRT10xx family
  dt-bindings: imx: Add clock binding for i.MXRT1050
  ARM: dts: imx: Add i.MXRT1050-EVK support
  ARM: imxrt_defconfig: Add i.MXRT family defconfig

Jesse Taube (3):
  ARM: dts: imxrt1050-pinfunc: Add pinctrl binding header
  dt-bindings: clock: imx: Add documentation for i.MXRT1050 clock
  clk: imx: Add initial support for i.MXRT1050 clock driver

 .../bindings/clock/imxrt1050-clock.yaml       |  67 ++
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/imxrt1050-evk.dts           |  72 ++
 arch/arm/boot/dts/imxrt1050-pinfunc.h         | 993 ++++++++++++++++++
 arch/arm/boot/dts/imxrt1050.dtsi              | 160 +++
 arch/arm/configs/imxrt_defconfig              |  35 +
 arch/arm/mach-imx/Kconfig                     |   7 +
 arch/arm/mach-imx/Makefile                    |   2 +
 arch/arm/mach-imx/mach-imxrt.c                |  19 +
 drivers/clk/imx/Kconfig                       |   5 +
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imxrt1050.c               | 181 ++++
 include/dt-bindings/clock/imxrt1050-clock.h   |  72 ++
 13 files changed, 1616 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
 create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi
 create mode 100644 arch/arm/configs/imxrt_defconfig
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c
 create mode 100644 drivers/clk/imx/clk-imxrt1050.c
 create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h

-- 
2.34.1

