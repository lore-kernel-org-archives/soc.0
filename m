Return-Path: <SRS0=bizF=QP=gmail.com=emil.renner.berthing@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB76C433F5
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 20:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C608CC53FC1; Sun, 28 Nov 2021 20:07:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA73AC004E1
	for <soc@kernel.org>; Sun, 28 Nov 2021 20:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA73AC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id y12so62843911eda.12
        for <soc@kernel.org>; Sun, 28 Nov 2021 12:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjRrTFzKlcV68ouLNyGIWvuxj/K9mKGKp9Bg5eLzYB0=;
        b=BejSQwGWOtK9gOac3oYMYTmEbQtm7nMBCCLlfhZju6MuaiIa+KwJG0YSWHIN8iQyHo
         mJ4qUWpaniG9tmVJy35+3b8OCfBVj47GnLe08WTqqaYLzMDPqhChX0HBexfaDUbtV0Tu
         ujeR6imJC60sdx0u0Gai2kfaR528cZ9A4uuDInfQpMDzkXUPLrzmGQ3NQu0k/1kJ642T
         MuSCoCCeDpFAwPpUlOyS/y+g1gtnuwPcQ4PjkTn2rl/hO48ypcC7s51pV808quYBt/4X
         7auh8hdlABddJyw3XtkLX28fnvqENmtdVwlqjW+Nri/CClj9y0ADrFpCD3CYXlmzq8ST
         Utvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=fjRrTFzKlcV68ouLNyGIWvuxj/K9mKGKp9Bg5eLzYB0=;
        b=mFmV7GtSBzCzd6Tt3WBXghLXXGyB2v2Fl9DJ1GzYHlS7FOFfY5gW5+Mt1mLaUkhF4J
         d3Ojg8DBadcIW8Wx0g08ydwY2G2LairtH081blJqfnDF1VDKwNB/071pSMtJIylNWtvZ
         J/m/RfMeIjHiUovnZxmkGyqNUOxcr78o38g7peX3ctkW8fIQRzHg6zCukcMjUoD/bdxA
         yo0J1i8RwUikQNeC9tzB/E36RsUdBq+6h9weF/0um8op27JRfEu6HS6V3FfJbn1PxcHo
         N3FC0XfTXCsajkW1WCAZJ13duGpGaRRWBWnxOoXdWayMcMdhCK+6XXbyLcBIR8Q4S0d9
         5DyQ==
X-Gm-Message-State: AOAM5321zwfaOIyrhRJ7BfJXwJ03jLi/EhmeFbDdQ5Ky4hW5Y1Ds1yvX
	/k7S3Gtbkv3Z87KDa3WWc8BbY70QnTONKA==
X-Google-Smtp-Source: ABdhPJy3zfX9hYwiSQ3lAsd9+vYfrkuX5dpJBriRc5e3zBw2AVEqmKUlIakYKC9VJ2uSdaPQEjuC+Q==
X-Received: by 2002:a50:d543:: with SMTP id f3mr66823588edj.56.1638130064179;
        Sun, 28 Nov 2021 12:07:44 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c8sm7506173edu.60.2021.11.28.12.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 12:07:43 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Fu Wei <tekkamanninja@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
Date: Sun, 28 Nov 2021 21:06:47 +0100
Message-Id: <20211128200647.147058-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://github.com/esmil/linux.git tags/for-soc

for you to fetch changes up to 398d6e139782d1ce2c9822beb8effba0c9c51cc4:

  RISC-V: Add BeagleV Starlight Beta device tree (2021-11-28 20:07:09 +0100)

----------------------------------------------------------------
Changes since v4:
- The reset driver now always uses 64bit read/write on registers even on
  32bit architectures as requested by Andy.

Changes since v3:
- The reset driver now uses 64bit read/write on the registers so we can
  use the regular bitmap macros. Requested by Andy.
- The pinctrl driver no longer resets the GPIO irq handler to
  handle_bad_irq on errors, uses reverse xmas tree order where possible
  and other nits by Andy.

Changes since v2:
- Ahmad and Geert agreed to switch the license of the clock and reset dt
  headers to GPL-2.0 OR MIT, so that both headers and device tree files
  can all use the same license.
  Bindings are still GPL-2.0-only OR BSD-2-Clause as recommended.
- Clock and reset drivers now set .suppress_bind_attrs = true and use
  builtin_platform_driver_probe to make sure the probe function is only
  called at init time so we can use __init and __initconst.
- The clock driver now uses devm_clk_hw_register and .parent_data when
  registering clocks. This way we can use the dt clock indexes rather
  than strings for parent lists and decrease the amount of static data
  needed considerably.
- Various dt binding cleanups from Rob
- Reworked description in the pinctrl dt binding.
- Pinctrl driver now depends on CONFIG_OF again since it uses
  pinconf_generic_parse_dt_config which is otherwise not defined.
- Pinctrl no longer devm_kfree's data that won't be referenced
  if dt pinconf parsing fails before registering groups and function,
  and other nits by Andy.
- The dw8250 quirk no longer needs a skip_clk_set_rate bit, but sets
  port->set_termios to the function called after clk_set_rate.

Changes since v1:
- Let SOC_STARFIVE select RESET_CONTROLLER but drop SERIAL_8250_DW
- Add missing Signed-of-by to clock dt-binding header
- Use builtin_platform_driver macro for the clock driver, add explicit
  comment to the determine_rate callback and other small nits from Andy
- Use reset-controller for node names in documentation and device tree
- Use readl_poll_timeout in reset driver to avoid hanging forever if a
  driver leaves the associated clock gated and sort Kconfig and Makefile
  entries properly.
- In the pinctrl driver align register names with documentation, remove
  invalid __init tag from probe function, use of_property_* functions to
  parse device tree, hoist pinmux unpacking into helper function to
  better document what's going on, bail on invalid signal group in
  device tree and fix many other nits from Andy.
- Refactor and rebase 8250_dw quirk on tty-next

----------------------------------------------------------------
Emil Renner Berthing (12):
      RISC-V: Add StarFive SoC Kconfig option
      dt-bindings: timer: Add StarFive JH7100 clint
      dt-bindings: interrupt-controller: Add StarFive JH7100 plic
      dt-bindings: reset: Add Starfive JH7100 reset bindings
      reset: starfive-jh7100: Add StarFive JH7100 reset driver
      dt-bindings: pinctrl: Add StarFive pinctrl definitions
      dt-bindings: pinctrl: Add StarFive JH7100 bindings
      pinctrl: starfive: Add pinctrl driver for StarFive SoCs
      dt-bindings: serial: snps-dw-apb-uart: Add JH7100 uarts
      serial: 8250_dw: Add StarFive JH7100 quirk
      RISC-V: Add initial StarFive JH7100 device tree
      RISC-V: Add BeagleV Starlight Beta device tree

Geert Uytterhoeven (4):
      dt-bindings: clock: starfive: Add JH7100 clock definitions
      dt-bindings: clock: starfive: Add JH7100 bindings
      clk: starfive: Add JH7100 clock generator driver
      dt-bindings: reset: Add StarFive JH7100 reset definitions

 .../bindings/clock/starfive,jh7100-clkgen.yaml     |   56 +
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml  |  307 +++++
 .../bindings/reset/starfive,jh7100-reset.yaml      |   38 +
 .../bindings/serial/snps-dw-apb-uart.yaml          |    5 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 MAINTAINERS                                        |   22 +
 arch/riscv/Kconfig.socs                            |    8 +
 arch/riscv/boot/dts/Makefile                       |    1 +
 arch/riscv/boot/dts/starfive/Makefile              |    2 +
 .../boot/dts/starfive/jh7100-beaglev-starlight.dts |  164 +++
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |  230 ++++
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/starfive/Kconfig                       |    9 +
 drivers/clk/starfive/Makefile                      |    3 +
 drivers/clk/starfive/clk-starfive-jh7100.c         |  689 ++++++++++
 drivers/pinctrl/Kconfig                            |   17 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-starfive.c                 | 1354 ++++++++++++++++++++
 drivers/reset/Kconfig                              |    7 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-starfive-jh7100.c              |  172 +++
 drivers/tty/serial/8250/8250_dw.c                  |    3 +
 include/dt-bindings/clock/starfive-jh7100.h        |  202 +++
 include/dt-bindings/pinctrl/pinctrl-starfive.h     |  275 ++++
 include/dt-bindings/reset/starfive-jh7100.h        |  126 ++
 27 files changed, 3696 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/Makefile
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100.dtsi
 create mode 100644 drivers/clk/starfive/Kconfig
 create mode 100644 drivers/clk/starfive/Makefile
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7100.c
 create mode 100644 drivers/pinctrl/pinctrl-starfive.c
 create mode 100644 drivers/reset/reset-starfive-jh7100.c
 create mode 100644 include/dt-bindings/clock/starfive-jh7100.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive.h
 create mode 100644 include/dt-bindings/reset/starfive-jh7100.h
