Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D34C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 22:58:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6941D601FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 22:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6941D601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HKve45B0YyTbrSZKYZsjHqiDlYBxmJNwTpjr7YPCMxU=; b=H3+finlp2qZ8dA
	iOXoEAVGShJcVNu3jTes6FDHW6w4zEN+Nqmql0Lofr9Nmh39EzutAbaPR4qw1VGHCbIGuM6hZHea2
	Ig+iidcWpSJZ7qQXM6Iy3zGMoaRdVvEyOEv2VBa87UcTx2WVCjxpXwoSlWC6Rbnit+GUUB+yUKekt
	yngv3iXJqY9tFs9aGbIabIG41VqrNcoMeRE8tsnJN063M3/B2LWelx/RA9cJuyMczxggF7oaW/gCY
	1wjkrhl/iSeaG8vtSPkxhffIIT3ddB6TKIgZOitlAxhBSbgDkhwm3tbuAPQDh9mxbhyl+L1mZrehH
	n3QBX2ct+nmKFiRPScGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2iL-003Eit-9S; Tue, 02 Nov 2021 22:57:09 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2iH-003EiB-Rd
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 22:57:07 +0000
Received: by mail-qk1-x730.google.com with SMTP id bm28so580234qkb.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 15:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KIYisbZsaWO2J//hyz2WxZPwqBd239vjWte2s5yR2ys=;
 b=LL2bPORTmHw5LJecj4U/ZA0GNrmoo7CQe0IRKm7B8NabGS0i4Zmp0WLIxzChPUQSgq
 AeU4nFkaupYIQzpLkKphcy0RuzmbeMDUx/WuoBOWfIREIWo4U0JZ6Pm64KI7qQ+y7nLk
 T4++3+zUDvm2qtP5zFRZGvLElcEzTfyt1MBCpvx2/+jSTFkdzQbezCl9+pPU1/+3u7G3
 xcEs7R/s00fiiXVExSt6uBoUu5jIr0z9FyfEzIke42ETx3Vt6QDOTBj3u6lo5a4NqpHt
 WdzG1aCWfdpxFqZX8Gk195mbhQTaar8LeuBmJv4Z6xUJPN0tGNh1333R7biHfaTBfRBH
 BFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KIYisbZsaWO2J//hyz2WxZPwqBd239vjWte2s5yR2ys=;
 b=6HDIhSJow9CwIcHq2qHihLvdOGr/BZ1vfZ8pSC1lXOZNDzFZjLTI4Q9JTnslL8hOYE
 c8qNKkFeyh80C6y0vzwL0usveBRPipmtmdX0g+X5sG5zxFroqX8EHSSimXIFAlMxhwIb
 Xc52S5I+q8XY1Gt1ScZQ7fgHn1LZR+kt4vA081ziqqDkN2/dqaym03SbSD/nnQs3wntV
 Y41hP+slxdGCJ8u63AwHodT59E6lLrn9LZJsAW4BNFjrw2zvwe5XaPTyQYaSjTrwmJqo
 otuy67QKyelJ+VtZr4SIs/+NXwpGaKvHCaJRLRj1MZQGj2wa+cGP4JzUKOUk8q6i8VVy
 ekig==
X-Gm-Message-State: AOAM531BherX6Kildyi7ezWqcuswHG0NWJhF8ZTtrWInsbSPl9VmJPNu
 TTPW/xwA37y3WfLIPwQ0mjw=
X-Google-Smtp-Source: ABdhPJz6W+2d5SZUl1RkGSRUkSfqY9CHmb9HCjjkEoKiGlQNTqAyGyj8o91AAI6XjdcklmMMiXHbnQ==
X-Received: by 2002:a05:620a:40c4:: with SMTP id
 g4mr25496206qko.14.1635893824295; 
 Tue, 02 Nov 2021 15:57:04 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:57:03 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v2 00/13] Add initial support for the i.MXRTxxxx SoC family
 starting from i.IMXRT1050 SoC.
Date: Tue,  2 Nov 2021 18:56:48 -0400
Message-ID: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155705_938025_936A5461 
X-CRM114-Status: GOOD (  21.40  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211102225648.PSn1OO_M1KuPWvgejA2SKX60FaCyOpb9odXSPTZssRs@z>

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

Giulio Benetti (5):
  ARM: imx: add initial support for i.MXRT10xx family
  pinctrl: freescale: Add i.MXRT1050 pinctrl driver support
  dt-bindings: imx: Add clock binding for i.MXRT1050
  ARM: dts: imx: add i.MXRT1050-EVK support
  ARM: imxrt_defconfig: add i.MXRT family defconfig

Jesse Taube (8):
  dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
  ARM: dts: imxrt1050-pinfunc: Add pinctrl binding header
  dt-bindings: clock: imx: Add documentation for i.MXRT clock
  clk: imx: Add initial support for i.MXRT clock driver
  dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
  tty: serial: fsl_lpuart: add i.MXRT support
  dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
  mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series

 .../bindings/clock/imxrt-clock.yaml           |  70 ++
 .../bindings/mmc/fsl-imx-esdhc.yaml           |   1 +
 .../bindings/pinctrl/fsl,imxrt1050.yaml       |  83 ++
 .../bindings/serial/fsl-lpuart.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/imxrt1050-evk.dts           |  89 ++
 arch/arm/boot/dts/imxrt1050-pinfunc.h         | 993 ++++++++++++++++++
 arch/arm/boot/dts/imxrt1050.dtsi              | 187 ++++
 arch/arm/configs/imxrt_defconfig              | 157 +++
 arch/arm/mach-imx/Kconfig                     |   7 +
 arch/arm/mach-imx/Makefile                    |   2 +
 arch/arm/mach-imx/mach-imxrt.c                |  19 +
 drivers/clk/imx/Kconfig                       |   4 +
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imxrt.c                   | 149 +++
 drivers/mmc/host/sdhci-esdhc-imx.c            |   7 +
 drivers/pinctrl/freescale/Kconfig             |   7 +
 drivers/pinctrl/freescale/Makefile            |   1 +
 drivers/pinctrl/freescale/pinctrl-imxrt1050.c | 349 ++++++
 drivers/tty/serial/fsl_lpuart.c               |   8 +
 include/dt-bindings/clock/imxrt1050-clock.h   |  72 ++
 21 files changed, 2209 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
 create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
 create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi
 create mode 100644 arch/arm/configs/imxrt_defconfig
 create mode 100644 arch/arm/mach-imx/mach-imxrt.c
 create mode 100644 drivers/clk/imx/clk-imxrt.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imxrt1050.c
 create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h

-- 
2.33.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
