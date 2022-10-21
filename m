Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2860DC433FE
	for <soc@archiver.kernel.org>; Fri, 21 Oct 2022 20:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5A1FC43470; Fri, 21 Oct 2022 20:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2C8C433C1;
	Fri, 21 Oct 2022 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666384431;
	bh=YnCwSftB/KbupYL25D1QvzUGIAajZetFy9CvCE1cdK8=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=JQw6AFZ4aFk6Ppysi5A4ik1RjRO3r060cctwzFT9HYCdr9ykvNc9cxZQVVLduk3Nl
	 +EJBG2m0IxJJUFCkON+pwwkANlVAGJq1KbDFFJMY1t48qOFhaK3ziIFyfqb0BI7HD3
	 C8sEyzcgjrDir2YRuhl1ZA58rq/0WEP/gqHxYxI/jFWN/nbLYwBLi1gdTxga3j+HwM
	 RhdxMUnrSJI1QaILf7G4b16f21oPa41DdNxH/JUifYnAJAkiAcwkOKw32GLHsVi2Z1
	 48BwB7dHSPUhi1mPVilcxPOAzbtUyVxBCrNEg3zuMbeVMoUpXjSAhl8ucCLUyOXncx
	 Vse5Rfs2iUkow==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ben Dooks <ben-linux@fluff.org>,
	Simtec Linux Team <linux@simtec.co.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnaud Patard <arnaud.patard@rtp-net.org>,
	Christer Weinigel <christer@weinigel.se>,
	Guillaume GOURAT <guillaume.gourat@nexvision.tv>,
	Heiko Stuebner <heiko@sntech.de>,
	openmoko-kernel@lists.openmoko.org,
	Jonathan Corbet <corbet@lwn.net>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-clk@vger.kernel.org
Subject: [PATCH 01/21] ARM: s3c: remove all s3c24xx support
Date: Fri, 21 Oct 2022 22:27:34 +0200
Message-Id: <20221021203329.4143397-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The platform was deprecated in commit 6a5e69c7ddea ("ARM: s3c: mark
as deprecated and schedule removal") and can be removed. This includes
all files that are exclusively for s3c24xx and not shared with s3c64xx,
as well as the glue logic in Kconfig and the maintainer file entries.

Cc: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Christer Weinigel <christer@weinigel.se>
Cc: Guillaume GOURAT <guillaume.gourat@nexvision.tv>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Simtec Linux Team <linux@simtec.co.uk>
Cc: openmoko-kernel@lists.openmoko.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/arm/index.rst                   |    1 -
 Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
 .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
 Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 ---
 Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
 Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
 Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
 .../arm/samsung-s3c24xx/overview.rst          |  311 ----
 Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 --
 Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
 .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
 Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
 .../arm/samsung-s3c24xx/usb-host.rst          |   91 --
 Documentation/arm/samsung/overview.rst        |   13 -
 MAINTAINERS                                   |   16 -
 arch/arm/Kconfig                              |    3 +-
 arch/arm/Kconfig.debug                        |   58 +-
 arch/arm/Makefile                             |    2 -
 arch/arm/boot/dts/Makefile                    |    2 -
 arch/arm/boot/dts/s3c2410-pinctrl.h           |   19 -
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi        |  172 ---
 arch/arm/boot/dts/s3c2416-smdk2416.dts        |   77 -
 arch/arm/boot/dts/s3c2416.dtsi                |  124 --
 arch/arm/boot/dts/s3c24xx.dtsi                |   92 --
 arch/arm/configs/mini2440_defconfig           |  338 -----
 arch/arm/configs/s3c2410_defconfig            |  437 ------
 arch/arm/configs/tct_hammer_defconfig         |   58 -
 arch/arm/mach-s3c/Kconfig                     |   27 +-
 arch/arm/mach-s3c/Kconfig.s3c24xx             |  604 --------
 arch/arm/mach-s3c/Makefile                    |    4 -
 arch/arm/mach-s3c/Makefile.s3c24xx            |  102 --
 arch/arm/mach-s3c/anubis.h                    |   50 -
 arch/arm/mach-s3c/bast-ide.c                  |   82 -
 arch/arm/mach-s3c/bast-irq.c                  |  137 --
 arch/arm/mach-s3c/bast.h                      |  194 ---
 arch/arm/mach-s3c/common-smdk-s3c24xx.c       |  228 ---
 arch/arm/mach-s3c/common-smdk-s3c24xx.h       |   11 -
 arch/arm/mach-s3c/cpufreq-utils-s3c24xx.c     |   94 --
 arch/arm/mach-s3c/dma-s3c24xx.h               |   51 -
 arch/arm/mach-s3c/fb-core-s3c24xx.h           |   24 -
 arch/arm/mach-s3c/gpio-samsung-s3c24xx.h      |  103 --
 arch/arm/mach-s3c/gta02.h                     |   20 -
 arch/arm/mach-s3c/h1940-bluetooth.c           |  140 --
 arch/arm/mach-s3c/h1940.h                     |   52 -
 arch/arm/mach-s3c/hardware-s3c24xx.h          |   14 -
 arch/arm/mach-s3c/iotiming-s3c2410.c          |  472 ------
 arch/arm/mach-s3c/iotiming-s3c2412.c          |  278 ----
 arch/arm/mach-s3c/irq-pm-s3c24xx.c            |  115 --
 arch/arm/mach-s3c/irq-s3c24xx-fiq-exports.c   |    9 -
 arch/arm/mach-s3c/irq-s3c24xx-fiq.S           |  112 --
 arch/arm/mach-s3c/irq-s3c24xx.c               | 1352 -----------------
 arch/arm/mach-s3c/irqs-s3c24xx.h              |  219 ---
 arch/arm/mach-s3c/mach-amlm5900.c             |  248 ---
 arch/arm/mach-s3c/mach-anubis.c               |  422 -----
 arch/arm/mach-s3c/mach-at2440evb.c            |  233 ---
 arch/arm/mach-s3c/mach-bast.c                 |  583 -------
 arch/arm/mach-s3c/mach-gta02.c                |  588 -------
 arch/arm/mach-s3c/mach-h1940.c                |  809 ----------
 arch/arm/mach-s3c/mach-jive.c                 |  693 ---------
 arch/arm/mach-s3c/mach-mini2440.c             |  804 ----------
 arch/arm/mach-s3c/mach-n30.c                  |  682 ---------
 arch/arm/mach-s3c/mach-nexcoder.c             |  162 --
 arch/arm/mach-s3c/mach-osiris-dvs.c           |  178 ---
 arch/arm/mach-s3c/mach-osiris.c               |  405 -----
 arch/arm/mach-s3c/mach-otom.c                 |  124 --
 arch/arm/mach-s3c/mach-qt2410.c               |  375 -----
 arch/arm/mach-s3c/mach-rx1950.c               |  884 -----------
 arch/arm/mach-s3c/mach-rx3715.c               |  213 ---
 arch/arm/mach-s3c/mach-s3c2416-dt.c           |   48 -
 arch/arm/mach-s3c/mach-smdk2410.c             |  112 --
 arch/arm/mach-s3c/mach-smdk2413.c             |  169 ---
 arch/arm/mach-s3c/mach-smdk2416.c             |  248 ---
 arch/arm/mach-s3c/mach-smdk2440.c             |  180 ---
 arch/arm/mach-s3c/mach-smdk2443.c             |  126 --
 arch/arm/mach-s3c/mach-tct_hammer.c           |  157 --
 arch/arm/mach-s3c/mach-vr1000.c               |  364 -----
 arch/arm/mach-s3c/mach-vstms.c                |  166 --
 arch/arm/mach-s3c/map-s3c24xx.h               |  159 --
 arch/arm/mach-s3c/nand-core-s3c24xx.h         |   24 -
 arch/arm/mach-s3c/osiris.h                    |   50 -
 arch/arm/mach-s3c/pll-s3c2410.c               |   83 -
 arch/arm/mach-s3c/pll-s3c2440-12000000.c      |   95 --
 arch/arm/mach-s3c/pll-s3c2440-16934400.c      |  122 --
 arch/arm/mach-s3c/pm-core-s3c24xx.h           |   96 --
 arch/arm/mach-s3c/pm-h1940.S                  |   19 -
 arch/arm/mach-s3c/pm-s3c2410.c                |  170 ---
 arch/arm/mach-s3c/pm-s3c2412.c                |  126 --
 arch/arm/mach-s3c/pm-s3c2416.c                |   81 -
 arch/arm/mach-s3c/pm-s3c24xx.c                |  121 --
 arch/arm/mach-s3c/regs-clock-s3c24xx.h        |  146 --
 arch/arm/mach-s3c/regs-dsc-s3c24xx.h          |   22 -
 arch/arm/mach-s3c/regs-gpio-s3c24xx.h         |  608 --------
 arch/arm/mach-s3c/regs-irq-s3c24xx.h          |   51 -
 arch/arm/mach-s3c/regs-mem-s3c24xx.h          |   53 -
 arch/arm/mach-s3c/regs-s3c2443-clock.h        |  238 ---
 arch/arm/mach-s3c/rtc-core-s3c24xx.h          |   23 -
 arch/arm/mach-s3c/s3c2410.c                   |  130 --
 arch/arm/mach-s3c/s3c2412-power.h             |   34 -
 arch/arm/mach-s3c/s3c2412.c                   |  175 ---
 arch/arm/mach-s3c/s3c2412.h                   |   25 -
 arch/arm/mach-s3c/s3c2416.c                   |  132 --
 arch/arm/mach-s3c/s3c2440.c                   |   71 -
 arch/arm/mach-s3c/s3c2442.c                   |   62 -
 arch/arm/mach-s3c/s3c2443.c                   |  112 --
 arch/arm/mach-s3c/s3c244x.c                   |  128 --
 arch/arm/mach-s3c/s3c24xx.c                   |  687 ---------
 arch/arm/mach-s3c/s3c24xx.h                   |  124 --
 arch/arm/mach-s3c/setup-i2c-s3c24xx.c         |   23 -
 arch/arm/mach-s3c/setup-sdhci-gpio-s3c24xx.c  |   31 -
 arch/arm/mach-s3c/setup-spi-s3c24xx.c         |   27 -
 arch/arm/mach-s3c/setup-ts-s3c24xx.c          |   29 -
 arch/arm/mach-s3c/simtec-audio.c              |   76 -
 arch/arm/mach-s3c/simtec-nor.c                |   74 -
 arch/arm/mach-s3c/simtec-pm.c                 |   60 -
 arch/arm/mach-s3c/simtec-usb.c                |  125 --
 arch/arm/mach-s3c/simtec.h                    |   17 -
 arch/arm/mach-s3c/sleep-s3c2410.S             |   54 -
 arch/arm/mach-s3c/sleep-s3c2412.S             |   53 -
 arch/arm/mach-s3c/sleep-s3c24xx.S             |   69 -
 arch/arm/mach-s3c/spi-core-s3c24xx.h          |   21 -
 arch/arm/mach-s3c/vr1000.h                    |  113 --
 drivers/soc/samsung/Kconfig                   |    4 -
 include/dt-bindings/clock/s3c2410.h           |   59 -
 include/dt-bindings/clock/s3c2412.h           |   70 -
 include/dt-bindings/clock/s3c2443.h           |   91 --
 include/linux/amba/pl093.h                    |   77 -
 126 files changed, 8 insertions(+), 21049 deletions(-)
 delete mode 100644 Documentation/arm/samsung-s3c24xx/cpufreq.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/eb2410itx.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/gpio.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/h1940.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/index.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/nand.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/overview.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/s3c2412.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/s3c2413.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/smdk2440.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/suspend.rst
 delete mode 100644 Documentation/arm/samsung-s3c24xx/usb-host.rst
 delete mode 100644 arch/arm/boot/dts/s3c2410-pinctrl.h
 delete mode 100644 arch/arm/boot/dts/s3c2416-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/s3c2416-smdk2416.dts
 delete mode 100644 arch/arm/boot/dts/s3c2416.dtsi
 delete mode 100644 arch/arm/boot/dts/s3c24xx.dtsi
 delete mode 100644 arch/arm/configs/mini2440_defconfig
 delete mode 100644 arch/arm/configs/s3c2410_defconfig
 delete mode 100644 arch/arm/configs/tct_hammer_defconfig
 delete mode 100644 arch/arm/mach-s3c/Kconfig.s3c24xx
 delete mode 100644 arch/arm/mach-s3c/Makefile.s3c24xx
 delete mode 100644 arch/arm/mach-s3c/anubis.h
 delete mode 100644 arch/arm/mach-s3c/bast-ide.c
 delete mode 100644 arch/arm/mach-s3c/bast-irq.c
 delete mode 100644 arch/arm/mach-s3c/bast.h
 delete mode 100644 arch/arm/mach-s3c/common-smdk-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/common-smdk-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/cpufreq-utils-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/dma-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/fb-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/gpio-samsung-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/gta02.h
 delete mode 100644 arch/arm/mach-s3c/h1940-bluetooth.c
 delete mode 100644 arch/arm/mach-s3c/h1940.h
 delete mode 100644 arch/arm/mach-s3c/hardware-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/iotiming-s3c2410.c
 delete mode 100644 arch/arm/mach-s3c/iotiming-s3c2412.c
 delete mode 100644 arch/arm/mach-s3c/irq-pm-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/irq-s3c24xx-fiq-exports.c
 delete mode 100644 arch/arm/mach-s3c/irq-s3c24xx-fiq.S
 delete mode 100644 arch/arm/mach-s3c/irq-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/irqs-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/mach-amlm5900.c
 delete mode 100644 arch/arm/mach-s3c/mach-anubis.c
 delete mode 100644 arch/arm/mach-s3c/mach-at2440evb.c
 delete mode 100644 arch/arm/mach-s3c/mach-bast.c
 delete mode 100644 arch/arm/mach-s3c/mach-gta02.c
 delete mode 100644 arch/arm/mach-s3c/mach-h1940.c
 delete mode 100644 arch/arm/mach-s3c/mach-jive.c
 delete mode 100644 arch/arm/mach-s3c/mach-mini2440.c
 delete mode 100644 arch/arm/mach-s3c/mach-n30.c
 delete mode 100644 arch/arm/mach-s3c/mach-nexcoder.c
 delete mode 100644 arch/arm/mach-s3c/mach-osiris-dvs.c
 delete mode 100644 arch/arm/mach-s3c/mach-osiris.c
 delete mode 100644 arch/arm/mach-s3c/mach-otom.c
 delete mode 100644 arch/arm/mach-s3c/mach-qt2410.c
 delete mode 100644 arch/arm/mach-s3c/mach-rx1950.c
 delete mode 100644 arch/arm/mach-s3c/mach-rx3715.c
 delete mode 100644 arch/arm/mach-s3c/mach-s3c2416-dt.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2410.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2413.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2416.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2440.c
 delete mode 100644 arch/arm/mach-s3c/mach-smdk2443.c
 delete mode 100644 arch/arm/mach-s3c/mach-tct_hammer.c
 delete mode 100644 arch/arm/mach-s3c/mach-vr1000.c
 delete mode 100644 arch/arm/mach-s3c/mach-vstms.c
 delete mode 100644 arch/arm/mach-s3c/map-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/nand-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/osiris.h
 delete mode 100644 arch/arm/mach-s3c/pll-s3c2410.c
 delete mode 100644 arch/arm/mach-s3c/pll-s3c2440-12000000.c
 delete mode 100644 arch/arm/mach-s3c/pll-s3c2440-16934400.c
 delete mode 100644 arch/arm/mach-s3c/pm-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/pm-h1940.S
 delete mode 100644 arch/arm/mach-s3c/pm-s3c2410.c
 delete mode 100644 arch/arm/mach-s3c/pm-s3c2412.c
 delete mode 100644 arch/arm/mach-s3c/pm-s3c2416.c
 delete mode 100644 arch/arm/mach-s3c/pm-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/regs-clock-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-dsc-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-gpio-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-irq-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-mem-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/regs-s3c2443-clock.h
 delete mode 100644 arch/arm/mach-s3c/rtc-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/s3c2410.c
 delete mode 100644 arch/arm/mach-s3c/s3c2412-power.h
 delete mode 100644 arch/arm/mach-s3c/s3c2412.c
 delete mode 100644 arch/arm/mach-s3c/s3c2412.h
 delete mode 100644 arch/arm/mach-s3c/s3c2416.c
 delete mode 100644 arch/arm/mach-s3c/s3c2440.c
 delete mode 100644 arch/arm/mach-s3c/s3c2442.c
 delete mode 100644 arch/arm/mach-s3c/s3c2443.c
 delete mode 100644 arch/arm/mach-s3c/s3c244x.c
 delete mode 100644 arch/arm/mach-s3c/s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/setup-i2c-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/setup-sdhci-gpio-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/setup-spi-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/setup-ts-s3c24xx.c
 delete mode 100644 arch/arm/mach-s3c/simtec-audio.c
 delete mode 100644 arch/arm/mach-s3c/simtec-nor.c
 delete mode 100644 arch/arm/mach-s3c/simtec-pm.c
 delete mode 100644 arch/arm/mach-s3c/simtec-usb.c
 delete mode 100644 arch/arm/mach-s3c/simtec.h
 delete mode 100644 arch/arm/mach-s3c/sleep-s3c2410.S
 delete mode 100644 arch/arm/mach-s3c/sleep-s3c2412.S
 delete mode 100644 arch/arm/mach-s3c/sleep-s3c24xx.S
 delete mode 100644 arch/arm/mach-s3c/spi-core-s3c24xx.h
 delete mode 100644 arch/arm/mach-s3c/vr1000.h
 delete mode 100644 include/dt-bindings/clock/s3c2410.h
 delete mode 100644 include/dt-bindings/clock/s3c2412.h
 delete mode 100644 include/dt-bindings/clock/s3c2443.h
 delete mode 100644 include/linux/amba/pl093.h

diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
index 8c636d4a061f..ae42fe886f0d 100644
--- a/Documentation/arm/index.rst
+++ b/Documentation/arm/index.rst
@@ -64,7 +64,6 @@ SoC-specific documents
    sunxi
 
    samsung/index
-   samsung-s3c24xx/index
 
    sunxi/clocks
 
diff --git a/Documentation/arm/samsung-s3c24xx/cpufreq.rst b/Documentation/arm/samsung-s3c24xx/cpufreq.rst
deleted file mode 100644
index cd22697cf606..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/eb2410itx.rst b/Documentation/arm/samsung-s3c24xx/eb2410itx.rst
deleted file mode 100644
index 7863c93652f8..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/gpio.rst b/Documentation/arm/samsung-s3c24xx/gpio.rst
deleted file mode 100644
index f4a8c800a457..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/h1940.rst b/Documentation/arm/samsung-s3c24xx/h1940.rst
deleted file mode 100644
index 62a562c178e3..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/index.rst b/Documentation/arm/samsung-s3c24xx/index.rst
deleted file mode 100644
index ccb951a0bedb..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/nand.rst b/Documentation/arm/samsung-s3c24xx/nand.rst
deleted file mode 100644
index 938995694ee7..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/overview.rst b/Documentation/arm/samsung-s3c24xx/overview.rst
deleted file mode 100644
index 14535e5cffb7..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/s3c2412.rst b/Documentation/arm/samsung-s3c24xx/s3c2412.rst
deleted file mode 100644
index 68b985fc6bf4..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/s3c2413.rst b/Documentation/arm/samsung-s3c24xx/s3c2413.rst
deleted file mode 100644
index 1f51e207fc46..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/smdk2440.rst b/Documentation/arm/samsung-s3c24xx/smdk2440.rst
deleted file mode 100644
index 524fd0b4afaf..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/suspend.rst b/Documentation/arm/samsung-s3c24xx/suspend.rst
deleted file mode 100644
index b4f3ae9fe76e..000000000000
diff --git a/Documentation/arm/samsung-s3c24xx/usb-host.rst b/Documentation/arm/samsung-s3c24xx/usb-host.rst
deleted file mode 100644
index 7aaffac89e04..000000000000
diff --git a/Documentation/arm/samsung/overview.rst b/Documentation/arm/samsung/overview.rst
index e74307897416..8b15a190169b 100644
--- a/Documentation/arm/samsung/overview.rst
+++ b/Documentation/arm/samsung/overview.rst
@@ -12,21 +12,10 @@ Introduction
 
   The currently supported SoCs are:
 
-  - S3C24XX: See Documentation/arm/samsung-s3c24xx/overview.rst for full list
   - S3C64XX: S3C6400 and S3C6410
   - S5PC110 / S5PV210
 
 
-S3C24XX Systems
----------------
-
-  There is still documentation in Documnetation/arm/Samsung-S3C24XX/ which
-  deals with the architecture and drivers specific to these devices.
-
-  See Documentation/arm/samsung-s3c24xx/overview.rst for more information
-  on the implementation details and specific support.
-
-
 Configuration
 -------------
 
@@ -51,8 +40,6 @@ Layout
   specific information. It contains the base clock, GPIO and device definitions
   to get the system running.
 
-  plat-s3c24xx is for s3c24xx specific builds, see the S3C24XX docs.
-
   plat-s5p is for s5p specific builds, and contains common support for the
   S5P specific systems. Not all S5Ps use all the features in this directory
   due to differences in the hardware.
diff --git a/MAINTAINERS b/MAINTAINERS
index ec3d53b5e1d1..071d64e2a7ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2462,13 +2462,6 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 
-ARM/OPENMOKO NEO FREERUNNER (GTA02) MACHINE SUPPORT
-L:	openmoko-kernel@lists.openmoko.org (subscribers-only)
-S:	Orphan
-W:	http://wiki.openmoko.org/wiki/Neo_FreeRunner
-F:	arch/arm/mach-s3c/gta02.h
-F:	arch/arm/mach-s3c/mach-gta02.c
-
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -2649,7 +2642,6 @@ F:	include/linux/platform_data/*s3c*
 F:	include/linux/serial_s3c.h
 F:	include/linux/soc/samsung/
 N:	exynos
-N:	s3c2410
 N:	s3c64xx
 N:	s5pv210
 
@@ -18673,14 +18665,6 @@ M:	Simtec Linux Team <linux@simtec.co.uk>
 S:	Supported
 W:	http://www.simtec.co.uk/products/EB110ATX/
 
-SIMTEC EB2410ITX (BAST)
-M:	Simtec Linux Team <linux@simtec.co.uk>
-S:	Supported
-W:	http://www.simtec.co.uk/products/EB2410ITX/
-F:	arch/arm/mach-s3c/bast-ide.c
-F:	arch/arm/mach-s3c/bast-irq.c
-F:	arch/arm/mach-s3c/mach-bast.c
-
 SIOX
 M:	Thorsten Scherer <t.scherer@eckelmann.de>
 M:	Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index c1614f91e04c..280701af4a01 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -279,7 +279,6 @@ config PHYS_OFFSET
 	default DRAM_BASE if !MMU
 	default 0x00000000 if ARCH_FOOTBRIDGE
 	default 0x10000000 if ARCH_OMAP1 || ARCH_RPC
-	default 0x30000000 if ARCH_S3C24XX
 	default 0xa0000000 if ARCH_PXA
 	default 0xc0000000 if ARCH_EP93XX || ARCH_SA1100
 	default 0
@@ -1154,7 +1153,7 @@ config ARCH_NR_GPIO
 	default 1024 if ARCH_BRCMSTB || ARCH_RENESAS || ARCH_TEGRA || \
 		ARCH_ZYNQ || ARCH_ASPEED
 	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || \
-		SOC_DRA7XX || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
+		SOC_DRA7XX || ARCH_S3C64XX || ARCH_S5PV210
 	default 416 if ARCH_SUNXI
 	default 392 if ARCH_U8500
 	default 352 if ARCH_VT8500
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 20312792340d..874551895181 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1006,7 +1006,6 @@ choice
 	config DEBUG_S3C_UART0
 		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
 		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
-		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
 		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
 		select DEBUG_S5PV210_UART if ARCH_S5PV210
 		bool "Use Samsung S3C UART 0 for low-level debug"
@@ -1018,7 +1017,6 @@ choice
 	config DEBUG_S3C_UART1
 		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
 		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
-		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
 		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
 		select DEBUG_S5PV210_UART if ARCH_S5PV210
 		bool "Use Samsung S3C UART 1 for low-level debug"
@@ -1030,7 +1028,6 @@ choice
 	config DEBUG_S3C_UART2
 		depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
 		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
-		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
 		select DEBUG_S3C64XX_UART if ARCH_S3C64XX
 		select DEBUG_S5PV210_UART if ARCH_S5PV210
 		bool "Use Samsung S3C UART 2 for low-level debug"
@@ -1050,33 +1047,6 @@ choice
 		  their output to UART 3. The port must have been initialised
 		  by the boot-loader before use.
 
-	config DEBUG_S3C2410_UART0
-		depends on ARCH_S3C24XX
-		select DEBUG_S3C2410_UART
-		bool "Use S3C2410/S3C2412 UART 0 for low-level debug"
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to UART 0. The port must have been initialised
-		  by the boot-loader before use.
-
-	config DEBUG_S3C2410_UART1
-		depends on ARCH_S3C24XX
-		select DEBUG_S3C2410_UART
-		bool "Use S3C2410/S3C2412 UART 1 for low-level debug"
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to UART 1. The port must have been initialised
-		  by the boot-loader before use.
-
-	config DEBUG_S3C2410_UART2
-		depends on ARCH_S3C24XX
-		select DEBUG_S3C2410_UART
-		bool "Use S3C2410/S3C2412 UART 2 for low-level debug"
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to UART 2. The port must have been initialised
-		  by the boot-loader before use.
-
 	config DEBUG_SA1100
 		depends on ARCH_SA1100
 		bool "Use SA1100 UARTs for low-level debug"
@@ -1439,13 +1409,6 @@ config DEBUG_AT91_UART
 config DEBUG_EXYNOS_UART
 	bool
 
-config DEBUG_S3C2410_UART
-	bool
-	select DEBUG_S3C24XX_UART
-
-config DEBUG_S3C24XX_UART
-	bool
-
 config DEBUG_S3C64XX_UART
 	bool
 
@@ -1453,8 +1416,7 @@ config DEBUG_S5PV210_UART
 	bool
 
 config DEBUG_S3C_UART
-	depends on DEBUG_S3C2410_UART || DEBUG_S3C24XX_UART || \
-		   DEBUG_S3C64XX_UART ||  DEBUG_S5PV210_UART || \
+	depends on DEBUG_S3C64XX_UART ||  DEBUG_S5PV210_UART || \
 		   DEBUG_EXYNOS_UART
 	int
 	default "0" if DEBUG_S3C_UART0
@@ -1555,7 +1517,7 @@ config DEBUG_LL_INCLUDE
 	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA0
 	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA1
 	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA4
-	default "debug/s3c24xx.S" if DEBUG_S3C24XX_UART || DEBUG_S3C64XX_UART
+	default "debug/s3c24xx.S" if DEBUG_S3C64XX_UART
 	default "debug/s5pv210.S" if DEBUG_S5PV210_UART
 	default "debug/sti.S" if DEBUG_STIH41X_ASC2
 	default "debug/sti.S" if DEBUG_STIH41X_SBC_ASC1
@@ -1638,12 +1600,6 @@ config DEBUG_UART_PHYS
 	default 0x4806e000 if DEBUG_OMAP2UART3 || DEBUG_OMAP4UART4
 	default 0x49020000 if DEBUG_OMAP3UART3
 	default 0x49042000 if DEBUG_OMAP3UART4
-	default 0x50000000 if DEBUG_S3C24XX_UART && (DEBUG_S3C_UART0 || \
-				DEBUG_S3C2410_UART0)
-	default 0x50004000 if DEBUG_S3C24XX_UART && (DEBUG_S3C_UART1 || \
-				DEBUG_S3C2410_UART1)
-	default 0x50008000 if DEBUG_S3C24XX_UART && (DEBUG_S3C_UART2 || \
-				DEBUG_S3C2410_UART2)
 	default 0x7c0003f8 if DEBUG_FOOTBRIDGE_COM1
 	default 0x7f005000 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART0
 	default 0x7f005400 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART1
@@ -1711,7 +1667,7 @@ config DEBUG_UART_PHYS
 		DEBUG_RCAR_GEN2_SCIF2 || DEBUG_RCAR_GEN2_SCIF4 || \
 		DEBUG_RCAR_GEN2_SCIFA2 || \
 		DEBUG_RMOBILE_SCIFA0 || DEBUG_RMOBILE_SCIFA1 || \
-		DEBUG_RMOBILE_SCIFA4 || DEBUG_S3C24XX_UART || \
+		DEBUG_RMOBILE_SCIFA4 || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
 		DEBUG_DIGICOLOR_UA0 || \
@@ -1748,15 +1704,9 @@ config DEBUG_UART_VIRT
 	default 0xf6200000 if DEBUG_PXA_UART1
 	default 0xf7000000 if DEBUG_SUN9I_UART0
 	default 0xf7000000 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART0
-	default 0xf7000000 if DEBUG_S3C24XX_UART && (DEBUG_S3C_UART0 || \
-				DEBUG_S3C2410_UART0)
 	default 0xf7000400 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART1
 	default 0xf7000800 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART2
 	default 0xf7000c00 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART3
-	default 0xf7004000 if DEBUG_S3C24XX_UART && (DEBUG_S3C_UART1 || \
-				DEBUG_S3C2410_UART1)
-	default 0xf7008000 if DEBUG_S3C24XX_UART && (DEBUG_S3C_UART2 || \
-				DEBUG_S3C2410_UART2)
 	default 0xf7020000 if DEBUG_AT91_SAMA5D2_UART1
 	default 0xf7fc9000 if DEBUG_BERLIN_UART
 	default 0xf8007000 if DEBUG_HIP04_UART
@@ -1820,7 +1770,7 @@ config DEBUG_UART_VIRT
 	default DEBUG_UART_PHYS if !MMU
 	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
 		DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
-		DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
+		DEBUG_QCOM_UARTDM || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
 		DEBUG_DIGICOLOR_UA0 || \
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 1a62035d1207..129162244c68 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -143,8 +143,6 @@ CHECKFLAGS	+= -D__arm__
 # during boot, and this offset is critical to the functioning of
 # kexec-tools.
 textofs-y	:= 0x00008000
-# We don't want the htc bootloader to corrupt kernel during resume
-textofs-$(CONFIG_PM_H1940)      := 0x00108000
 # RTD1195 has Boot ROM at start of address space
 textofs-$(CONFIG_ARCH_REALTEK)  := 0x00108000
 # SA1111 DMA bug: we don't want the kernel to live in precious DMA-able memory
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6aa7dc4db2fc..f0699ec7da2f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1156,8 +1156,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-veyron-speedy.dtb \
 	rk3288-veyron-tiger.dtb \
 	rk3288-vyasa.dtb
-dtb-$(CONFIG_ARCH_S3C24XX) += \
-	s3c2416-smdk2416.dtb
 dtb-$(CONFIG_ARCH_S3C64XX) += \
 	s3c6410-mini6410.dtb \
 	s3c6410-smdk6410.dtb
diff --git a/arch/arm/boot/dts/s3c2410-pinctrl.h b/arch/arm/boot/dts/s3c2410-pinctrl.h
deleted file mode 100644
index 76b6171ae149..000000000000
diff --git a/arch/arm/boot/dts/s3c2416-pinctrl.dtsi b/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
deleted file mode 100644
index 3268366bd8bc..000000000000
diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts b/arch/arm/boot/dts/s3c2416-smdk2416.dts
deleted file mode 100644
index e7c379a9842e..000000000000
diff --git a/arch/arm/boot/dts/s3c2416.dtsi b/arch/arm/boot/dts/s3c2416.dtsi
deleted file mode 100644
index 4660751cb207..000000000000
diff --git a/arch/arm/boot/dts/s3c24xx.dtsi b/arch/arm/boot/dts/s3c24xx.dtsi
deleted file mode 100644
index 06f82c7e458e..000000000000
diff --git a/arch/arm/configs/mini2440_defconfig b/arch/arm/configs/mini2440_defconfig
deleted file mode 100644
index 86e00f684e16..000000000000
diff --git a/arch/arm/configs/s3c2410_defconfig b/arch/arm/configs/s3c2410_defconfig
deleted file mode 100644
index 41b40863a78e..000000000000
diff --git a/arch/arm/configs/tct_hammer_defconfig b/arch/arm/configs/tct_hammer_defconfig
deleted file mode 100644
index 3b29ae1fb750..000000000000
diff --git a/arch/arm/mach-s3c/Kconfig b/arch/arm/mach-s3c/Kconfig
index a64143574546..809f84fca0b8 100644
--- a/arch/arm/mach-s3c/Kconfig
+++ b/arch/arm/mach-s3c/Kconfig
@@ -2,13 +2,10 @@
 #
 # Copyright 2009 Simtec Electronics
 
-source "arch/arm/mach-s3c/Kconfig.s3c24xx"
 source "arch/arm/mach-s3c/Kconfig.s3c64xx"
 
 config PLAT_SAMSUNG
-	bool
-	depends on PLAT_S3C24XX || ARCH_S3C64XX
-	default y
+	def_bool ARCH_S3C64XX
 	select GENERIC_IRQ_CHIP
 	select NO_IOPORT_MAP
 	select SOC_SAMSUNG
@@ -16,9 +13,8 @@ config PLAT_SAMSUNG
 	  Base platform code for all Samsung SoC based systems
 
 config SAMSUNG_PM
-	bool
-	depends on PM && (PLAT_S3C24XX || ARCH_S3C64XX)
-	default y
+	def_bool ARCH_S3C64XX
+	depends on PM
 	help
 	  Base platform power management code for samsung code
 
@@ -99,11 +95,6 @@ config S3C_DEV_HSMMC3
 	help
 	  Compile in platform device definitions for HSMMC channel 3
 
-config S3C_DEV_HWMON
-	bool
-	help
-	  Compile in platform device definitions for HWMON
-
 config S3C_DEV_I2C1
 	bool
 	help
@@ -156,7 +147,6 @@ config S3C_DEV_USB_HSOTG
 
 config S3C_DEV_WDT
 	bool
-	default y if ARCH_S3C24XX
 	help
 	  Compile in platform device definition for Watchdog Timer
 
@@ -180,22 +170,12 @@ config SAMSUNG_DEV_ADC
 	help
 	  Compile in platform device definition for ADC controller
 
-config SAMSUNG_DEV_IDE
-	bool
-	help
-	  Compile in platform device definitions for IDE
-
 config S3C64XX_DEV_SPI0
 	bool
 	help
 	  Compile in platform device definitions for S3C64XX's type
 	  SPI controller 0
 
-config SAMSUNG_DEV_TS
-	bool
-	help
-	  Common in platform device definitions for touchscreen device
-
 config SAMSUNG_DEV_KEYPAD
 	bool
 	help
@@ -203,7 +183,6 @@ config SAMSUNG_DEV_KEYPAD
 
 config SAMSUNG_DEV_PWM
 	bool
-	default y if ARCH_S3C24XX
 	help
 	  Compile in platform device definition for PWM Timer
 
diff --git a/arch/arm/mach-s3c/Kconfig.s3c24xx b/arch/arm/mach-s3c/Kconfig.s3c24xx
deleted file mode 100644
index 7287e173f30e..000000000000
diff --git a/arch/arm/mach-s3c/Makefile b/arch/arm/mach-s3c/Makefile
index 7c7d3318fd61..e7f18039b149 100644
--- a/arch/arm/mach-s3c/Makefile
+++ b/arch/arm/mach-s3c/Makefile
@@ -2,10 +2,6 @@
 #
 # Copyright 2009 Simtec Electronics
 
-ifdef CONFIG_ARCH_S3C24XX
-include $(src)/Makefile.s3c24xx
-endif
-
 ifdef CONFIG_ARCH_S3C64XX
 include $(src)/Makefile.s3c64xx
 endif
diff --git a/arch/arm/mach-s3c/Makefile.s3c24xx b/arch/arm/mach-s3c/Makefile.s3c24xx
deleted file mode 100644
index 3483ab3a2b81..000000000000
diff --git a/arch/arm/mach-s3c/anubis.h b/arch/arm/mach-s3c/anubis.h
deleted file mode 100644
index 13847292e6c7..000000000000
diff --git a/arch/arm/mach-s3c/bast-ide.c b/arch/arm/mach-s3c/bast-ide.c
deleted file mode 100644
index 67f0adc1fec0..000000000000
diff --git a/arch/arm/mach-s3c/bast-irq.c b/arch/arm/mach-s3c/bast-irq.c
deleted file mode 100644
index cfc2ddc65513..000000000000
diff --git a/arch/arm/mach-s3c/bast.h b/arch/arm/mach-s3c/bast.h
deleted file mode 100644
index a7726f93f5eb..000000000000
diff --git a/arch/arm/mach-s3c/common-smdk-s3c24xx.c b/arch/arm/mach-s3c/common-smdk-s3c24xx.c
deleted file mode 100644
index 6d124bbd384c..000000000000
diff --git a/arch/arm/mach-s3c/common-smdk-s3c24xx.h b/arch/arm/mach-s3c/common-smdk-s3c24xx.h
deleted file mode 100644
index c0352b06e435..000000000000
diff --git a/arch/arm/mach-s3c/cpufreq-utils-s3c24xx.c b/arch/arm/mach-s3c/cpufreq-utils-s3c24xx.c
deleted file mode 100644
index c1784d8facdf..000000000000
diff --git a/arch/arm/mach-s3c/dma-s3c24xx.h b/arch/arm/mach-s3c/dma-s3c24xx.h
deleted file mode 100644
index 25fc9c258fc1..000000000000
diff --git a/arch/arm/mach-s3c/fb-core-s3c24xx.h b/arch/arm/mach-s3c/fb-core-s3c24xx.h
deleted file mode 100644
index 0e07f3ba4aef..000000000000
diff --git a/arch/arm/mach-s3c/gpio-samsung-s3c24xx.h b/arch/arm/mach-s3c/gpio-samsung-s3c24xx.h
deleted file mode 100644
index c29fdc95f883..000000000000
diff --git a/arch/arm/mach-s3c/gta02.h b/arch/arm/mach-s3c/gta02.h
deleted file mode 100644
index 043ae382bfc5..000000000000
diff --git a/arch/arm/mach-s3c/h1940-bluetooth.c b/arch/arm/mach-s3c/h1940-bluetooth.c
deleted file mode 100644
index 59edcf8a620d..000000000000
diff --git a/arch/arm/mach-s3c/h1940.h b/arch/arm/mach-s3c/h1940.h
deleted file mode 100644
index 5dfe9d10cd15..000000000000
diff --git a/arch/arm/mach-s3c/hardware-s3c24xx.h b/arch/arm/mach-s3c/hardware-s3c24xx.h
deleted file mode 100644
index 33b37467d05f..000000000000
diff --git a/arch/arm/mach-s3c/iotiming-s3c2410.c b/arch/arm/mach-s3c/iotiming-s3c2410.c
deleted file mode 100644
index 09f388d8f824..000000000000
diff --git a/arch/arm/mach-s3c/iotiming-s3c2412.c b/arch/arm/mach-s3c/iotiming-s3c2412.c
deleted file mode 100644
index 003f89c4dc53..000000000000
diff --git a/arch/arm/mach-s3c/irq-pm-s3c24xx.c b/arch/arm/mach-s3c/irq-pm-s3c24xx.c
deleted file mode 100644
index 55f41135ad70..000000000000
diff --git a/arch/arm/mach-s3c/irq-s3c24xx-fiq-exports.c b/arch/arm/mach-s3c/irq-s3c24xx-fiq-exports.c
deleted file mode 100644
index 84cf86376ded..000000000000
diff --git a/arch/arm/mach-s3c/irq-s3c24xx-fiq.S b/arch/arm/mach-s3c/irq-s3c24xx-fiq.S
deleted file mode 100644
index 5d238d9a798e..000000000000
diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c b/arch/arm/mach-s3c/irq-s3c24xx.c
deleted file mode 100644
index 088cc04b7431..000000000000
diff --git a/arch/arm/mach-s3c/irqs-s3c24xx.h b/arch/arm/mach-s3c/irqs-s3c24xx.h
deleted file mode 100644
index fecbf7e440c6..000000000000
diff --git a/arch/arm/mach-s3c/mach-amlm5900.c b/arch/arm/mach-s3c/mach-amlm5900.c
deleted file mode 100644
index f85e5885e9b4..000000000000
diff --git a/arch/arm/mach-s3c/mach-anubis.c b/arch/arm/mach-s3c/mach-anubis.c
deleted file mode 100644
index 4536f3e66e27..000000000000
diff --git a/arch/arm/mach-s3c/mach-at2440evb.c b/arch/arm/mach-s3c/mach-at2440evb.c
deleted file mode 100644
index 743403d873e0..000000000000
diff --git a/arch/arm/mach-s3c/mach-bast.c b/arch/arm/mach-s3c/mach-bast.c
deleted file mode 100644
index a33ceab81e09..000000000000
diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
deleted file mode 100644
index d50a81d85ae1..000000000000
diff --git a/arch/arm/mach-s3c/mach-h1940.c b/arch/arm/mach-s3c/mach-h1940.c
deleted file mode 100644
index 83ac6cfdb1d8..000000000000
diff --git a/arch/arm/mach-s3c/mach-jive.c b/arch/arm/mach-s3c/mach-jive.c
deleted file mode 100644
index 16859bb3bb13..000000000000
diff --git a/arch/arm/mach-s3c/mach-mini2440.c b/arch/arm/mach-s3c/mach-mini2440.c
deleted file mode 100644
index 283be70ca622..000000000000
diff --git a/arch/arm/mach-s3c/mach-n30.c b/arch/arm/mach-s3c/mach-n30.c
deleted file mode 100644
index 90122fc6b2aa..000000000000
diff --git a/arch/arm/mach-s3c/mach-nexcoder.c b/arch/arm/mach-s3c/mach-nexcoder.c
deleted file mode 100644
index d17a3fcb7425..000000000000
diff --git a/arch/arm/mach-s3c/mach-osiris-dvs.c b/arch/arm/mach-s3c/mach-osiris-dvs.c
deleted file mode 100644
index 2e283aedab65..000000000000
diff --git a/arch/arm/mach-s3c/mach-osiris.c b/arch/arm/mach-s3c/mach-osiris.c
deleted file mode 100644
index d900d1354de1..000000000000
diff --git a/arch/arm/mach-s3c/mach-otom.c b/arch/arm/mach-s3c/mach-otom.c
deleted file mode 100644
index 3a2db2f58833..000000000000
diff --git a/arch/arm/mach-s3c/mach-qt2410.c b/arch/arm/mach-s3c/mach-qt2410.c
deleted file mode 100644
index 36fe0684a438..000000000000
diff --git a/arch/arm/mach-s3c/mach-rx1950.c b/arch/arm/mach-s3c/mach-rx1950.c
deleted file mode 100644
index d8c49e562660..000000000000
diff --git a/arch/arm/mach-s3c/mach-rx3715.c b/arch/arm/mach-s3c/mach-rx3715.c
deleted file mode 100644
index 52b3c38acbb2..000000000000
diff --git a/arch/arm/mach-s3c/mach-s3c2416-dt.c b/arch/arm/mach-s3c/mach-s3c2416-dt.c
deleted file mode 100644
index 418544d3015d..000000000000
diff --git a/arch/arm/mach-s3c/mach-smdk2410.c b/arch/arm/mach-s3c/mach-smdk2410.c
deleted file mode 100644
index 76b0a8846616..000000000000
diff --git a/arch/arm/mach-s3c/mach-smdk2413.c b/arch/arm/mach-s3c/mach-smdk2413.c
deleted file mode 100644
index 2b4e20aaa346..000000000000
diff --git a/arch/arm/mach-s3c/mach-smdk2416.c b/arch/arm/mach-s3c/mach-smdk2416.c
deleted file mode 100644
index 329fe26be268..000000000000
diff --git a/arch/arm/mach-s3c/mach-smdk2440.c b/arch/arm/mach-s3c/mach-smdk2440.c
deleted file mode 100644
index 6aea769ebde1..000000000000
diff --git a/arch/arm/mach-s3c/mach-smdk2443.c b/arch/arm/mach-s3c/mach-smdk2443.c
deleted file mode 100644
index 075140f8f760..000000000000
diff --git a/arch/arm/mach-s3c/mach-tct_hammer.c b/arch/arm/mach-s3c/mach-tct_hammer.c
deleted file mode 100644
index 93ab1abd8bd3..000000000000
diff --git a/arch/arm/mach-s3c/mach-vr1000.c b/arch/arm/mach-s3c/mach-vr1000.c
deleted file mode 100644
index c85033e6ef8f..000000000000
diff --git a/arch/arm/mach-s3c/mach-vstms.c b/arch/arm/mach-s3c/mach-vstms.c
deleted file mode 100644
index 6f878418be3e..000000000000
diff --git a/arch/arm/mach-s3c/map-s3c24xx.h b/arch/arm/mach-s3c/map-s3c24xx.h
deleted file mode 100644
index f8d075b11d6f..000000000000
diff --git a/arch/arm/mach-s3c/nand-core-s3c24xx.h b/arch/arm/mach-s3c/nand-core-s3c24xx.h
deleted file mode 100644
index a14316729c48..000000000000
diff --git a/arch/arm/mach-s3c/osiris.h b/arch/arm/mach-s3c/osiris.h
deleted file mode 100644
index b6c9c5ed2ba7..000000000000
diff --git a/arch/arm/mach-s3c/pll-s3c2410.c b/arch/arm/mach-s3c/pll-s3c2410.c
deleted file mode 100644
index 3fbc99eaa4a2..000000000000
diff --git a/arch/arm/mach-s3c/pll-s3c2440-12000000.c b/arch/arm/mach-s3c/pll-s3c2440-12000000.c
deleted file mode 100644
index fdb8e8c2fe3b..000000000000
diff --git a/arch/arm/mach-s3c/pll-s3c2440-16934400.c b/arch/arm/mach-s3c/pll-s3c2440-16934400.c
deleted file mode 100644
index 438b6fc099a4..000000000000
diff --git a/arch/arm/mach-s3c/pm-core-s3c24xx.h b/arch/arm/mach-s3c/pm-core-s3c24xx.h
deleted file mode 100644
index a71ed5711019..000000000000
diff --git a/arch/arm/mach-s3c/pm-h1940.S b/arch/arm/mach-s3c/pm-h1940.S
deleted file mode 100644
index 3bf6685123cb..000000000000
diff --git a/arch/arm/mach-s3c/pm-s3c2410.c b/arch/arm/mach-s3c/pm-s3c2410.c
deleted file mode 100644
index a66419883735..000000000000
diff --git a/arch/arm/mach-s3c/pm-s3c2412.c b/arch/arm/mach-s3c/pm-s3c2412.c
deleted file mode 100644
index ed3b4cfc7c0f..000000000000
diff --git a/arch/arm/mach-s3c/pm-s3c2416.c b/arch/arm/mach-s3c/pm-s3c2416.c
deleted file mode 100644
index f69ad84cf4ff..000000000000
diff --git a/arch/arm/mach-s3c/pm-s3c24xx.c b/arch/arm/mach-s3c/pm-s3c24xx.c
deleted file mode 100644
index 3a8f5c38882e..000000000000
diff --git a/arch/arm/mach-s3c/regs-clock-s3c24xx.h b/arch/arm/mach-s3c/regs-clock-s3c24xx.h
deleted file mode 100644
index 933ddb5eedec..000000000000
diff --git a/arch/arm/mach-s3c/regs-dsc-s3c24xx.h b/arch/arm/mach-s3c/regs-dsc-s3c24xx.h
deleted file mode 100644
index 8b8b572aef04..000000000000
diff --git a/arch/arm/mach-s3c/regs-gpio-s3c24xx.h b/arch/arm/mach-s3c/regs-gpio-s3c24xx.h
deleted file mode 100644
index 9a7e262268a7..000000000000
diff --git a/arch/arm/mach-s3c/regs-irq-s3c24xx.h b/arch/arm/mach-s3c/regs-irq-s3c24xx.h
deleted file mode 100644
index c0b97b203415..000000000000
diff --git a/arch/arm/mach-s3c/regs-mem-s3c24xx.h b/arch/arm/mach-s3c/regs-mem-s3c24xx.h
deleted file mode 100644
index 8fed34a1672a..000000000000
diff --git a/arch/arm/mach-s3c/regs-s3c2443-clock.h b/arch/arm/mach-s3c/regs-s3c2443-clock.h
deleted file mode 100644
index b3b670d463db..000000000000
diff --git a/arch/arm/mach-s3c/rtc-core-s3c24xx.h b/arch/arm/mach-s3c/rtc-core-s3c24xx.h
deleted file mode 100644
index e7258b2423fc..000000000000
diff --git a/arch/arm/mach-s3c/s3c2410.c b/arch/arm/mach-s3c/s3c2410.c
deleted file mode 100644
index 4d39d9939c2f..000000000000
diff --git a/arch/arm/mach-s3c/s3c2412-power.h b/arch/arm/mach-s3c/s3c2412-power.h
deleted file mode 100644
index 0031cfaa1d76..000000000000
diff --git a/arch/arm/mach-s3c/s3c2412.c b/arch/arm/mach-s3c/s3c2412.c
deleted file mode 100644
index 0b1ca78c9d2a..000000000000
diff --git a/arch/arm/mach-s3c/s3c2412.h b/arch/arm/mach-s3c/s3c2412.h
deleted file mode 100644
index ed09a0e13bd8..000000000000
diff --git a/arch/arm/mach-s3c/s3c2416.c b/arch/arm/mach-s3c/s3c2416.c
deleted file mode 100644
index 126e6ed29713..000000000000
diff --git a/arch/arm/mach-s3c/s3c2440.c b/arch/arm/mach-s3c/s3c2440.c
deleted file mode 100644
index c6cdee4987e8..000000000000
diff --git a/arch/arm/mach-s3c/s3c2442.c b/arch/arm/mach-s3c/s3c2442.c
deleted file mode 100644
index 0c0e30b6688f..000000000000
diff --git a/arch/arm/mach-s3c/s3c2443.c b/arch/arm/mach-s3c/s3c2443.c
deleted file mode 100644
index 05c3c298b9f8..000000000000
diff --git a/arch/arm/mach-s3c/s3c244x.c b/arch/arm/mach-s3c/s3c244x.c
deleted file mode 100644
index 95df3491e650..000000000000
diff --git a/arch/arm/mach-s3c/s3c24xx.c b/arch/arm/mach-s3c/s3c24xx.c
deleted file mode 100644
index 819a95364af9..000000000000
diff --git a/arch/arm/mach-s3c/s3c24xx.h b/arch/arm/mach-s3c/s3c24xx.h
deleted file mode 100644
index 34dd4ac507e9..000000000000
diff --git a/arch/arm/mach-s3c/setup-i2c-s3c24xx.c b/arch/arm/mach-s3c/setup-i2c-s3c24xx.c
deleted file mode 100644
index 0d88366b234c..000000000000
diff --git a/arch/arm/mach-s3c/setup-sdhci-gpio-s3c24xx.c b/arch/arm/mach-s3c/setup-sdhci-gpio-s3c24xx.c
deleted file mode 100644
index 02131b3a731d..000000000000
diff --git a/arch/arm/mach-s3c/setup-spi-s3c24xx.c b/arch/arm/mach-s3c/setup-spi-s3c24xx.c
deleted file mode 100644
index 93fa1bbc9d5c..000000000000
diff --git a/arch/arm/mach-s3c/setup-ts-s3c24xx.c b/arch/arm/mach-s3c/setup-ts-s3c24xx.c
deleted file mode 100644
index 57363eaeb7e8..000000000000
diff --git a/arch/arm/mach-s3c/simtec-audio.c b/arch/arm/mach-s3c/simtec-audio.c
deleted file mode 100644
index 487485bcc2ab..000000000000
diff --git a/arch/arm/mach-s3c/simtec-nor.c b/arch/arm/mach-s3c/simtec-nor.c
deleted file mode 100644
index a6fba056a747..000000000000
diff --git a/arch/arm/mach-s3c/simtec-pm.c b/arch/arm/mach-s3c/simtec-pm.c
deleted file mode 100644
index 490256a766e2..000000000000
diff --git a/arch/arm/mach-s3c/simtec-usb.c b/arch/arm/mach-s3c/simtec-usb.c
deleted file mode 100644
index 76cedb5c7373..000000000000
diff --git a/arch/arm/mach-s3c/simtec.h b/arch/arm/mach-s3c/simtec.h
deleted file mode 100644
index d96bd60872b8..000000000000
diff --git a/arch/arm/mach-s3c/sleep-s3c2410.S b/arch/arm/mach-s3c/sleep-s3c2410.S
deleted file mode 100644
index 04aded98782b..000000000000
diff --git a/arch/arm/mach-s3c/sleep-s3c2412.S b/arch/arm/mach-s3c/sleep-s3c2412.S
deleted file mode 100644
index b4b61737fbb2..000000000000
diff --git a/arch/arm/mach-s3c/sleep-s3c24xx.S b/arch/arm/mach-s3c/sleep-s3c24xx.S
deleted file mode 100644
index 4b2af91f3dce..000000000000
diff --git a/arch/arm/mach-s3c/spi-core-s3c24xx.h b/arch/arm/mach-s3c/spi-core-s3c24xx.h
deleted file mode 100644
index 919c5fd0c9af..000000000000
diff --git a/arch/arm/mach-s3c/vr1000.h b/arch/arm/mach-s3c/vr1000.h
deleted file mode 100644
index 3cfa296bec2a..000000000000
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 02e319508cc6..b4f538d7412f 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -85,8 +85,6 @@ config SAMSUNG_PM_CHECK
 	  Note, this can take several seconds depending on memory size
 	  and CPU speed.
 
-	  See <file:Documentation/arm/samsung-s3c24xx/suspend.rst>
-
 config SAMSUNG_PM_CHECK_CHUNKSIZE
 	int "S3C2410 PM Suspend CRC Chunksize (KiB)"
 	depends on PM && SAMSUNG_PM_CHECK
@@ -97,8 +95,6 @@ config SAMSUNG_PM_CHECK_CHUNKSIZE
 	  the CRC data block will take more memory, but will identify any
 	  faults with better precision.
 
-	  See <file:Documentation/arm/samsung-s3c24xx/suspend.rst>
-
 config EXYNOS_REGULATOR_COUPLER
 	bool "Exynos SoC Regulator Coupler" if COMPILE_TEST
 	depends on ARCH_EXYNOS || COMPILE_TEST
diff --git a/include/dt-bindings/clock/s3c2410.h b/include/dt-bindings/clock/s3c2410.h
deleted file mode 100644
index 0fb65c3f2f59..000000000000
diff --git a/include/dt-bindings/clock/s3c2412.h b/include/dt-bindings/clock/s3c2412.h
deleted file mode 100644
index b4656156cc0f..000000000000
diff --git a/include/dt-bindings/clock/s3c2443.h b/include/dt-bindings/clock/s3c2443.h
deleted file mode 100644
index a9d2f105d536..000000000000
diff --git a/include/linux/amba/pl093.h b/include/linux/amba/pl093.h
deleted file mode 100644
index b17166e3b49a..000000000000
-- 
2.29.2

