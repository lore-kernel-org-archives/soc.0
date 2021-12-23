Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E82C433EF
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 21:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BB0AC36AEB; Thu, 23 Dec 2021 21:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06149C36AE5
	for <soc@kernel.org>; Thu, 23 Dec 2021 21:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640295483;
	bh=k6OLLpc4v5oMPKERGWUmMVAsuzVd/aL77C6y7AmNPlY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fkgFWiCzsLFZ+bGLNEaRcq9H0uGUAXLSLkNRUv6YS7Nbo3ggSn60LDOlPYRctj1w9
	 9Fd8YgQK2Pf0adv7fe5qtRrDYFESYVR+uxgHMncPKGFEH9U7txzhoCM2hzoz0t7vHN
	 BgZjwiJV3g/Q006pZ5SrLHzNFHX7tczAunmMwtvuNnSvfpUxbqJnoFCkQR8c/czuMY
	 vqTsvQI4KAnc+bsD3Y7Opci8upCwGsngurOe0yLRuSc29oELbLm3cZUGRxcNWlsHM8
	 8PiihL1Xgmfq2Q00V+hjPqp313giSrrEHaoU/rfjRGgKhtkDhMsBvhpYAcbBkii3OB
	 mD07pwrZpIFcQ==
Received: by mail-wm1-f51.google.com with SMTP id o30so1978290wms.4
        for <soc@kernel.org>; Thu, 23 Dec 2021 13:38:02 -0800 (PST)
X-Gm-Message-State: AOAM532vHcRqNTW75VQG0+d/TRalCMzZZP81egm0i+is/ml0fc+aQfMb
	+DprWQ0xeAHqeEuuArmxoD1ATECTLIsbgKbL9GI=
X-Google-Smtp-Source: ABdhPJxPFZPrr/oakrlEx7N9JQbz5u2vu6XKr4y8MJq5BeiV8EsIoS4jXpLKPzl94TvPO12nebYzBly1vbvaLt6BpnM=
X-Received: by 2002:a1c:8013:: with SMTP id b19mr2815249wmd.35.1640295481270;
 Thu, 23 Dec 2021 13:38:01 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 23 Dec 2021 22:37:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DkNq+SxXdvFnQMkH7BaNQ-=ug_XjAAD8_jw3-eX-wnQ@mail.gmail.com>
Message-ID: <CAK8P3a1DkNq+SxXdvFnQMkH7BaNQ-=ug_XjAAD8_jw3-eX-wnQ@mail.gmail.com>
Subject: [GIT PULL 5/5] SoC: Add support for StarFive JH7100 RISC-V SoC
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/newsoc-5.17

for you to fetch changes up to 299e6f788eab0b0aef97efb29ddc6971e7d0daf3:

  reset: starfive-jh7100: Fix 32bit compilation (2021-12-20 13:34:00 +0100)

----------------------------------------------------------------
SoC: Add support for StarFive JH7100 RISC-V SoC

This adds support for the StarFive JH7100, including the necessary
device drivers and DT files for the BeagleV Starlight prototype
board, with additional boards to be added later. This SoC promises
to be the first usable low-cost platform for RISC-V.

I've taken this through the SoC tree in the anticipation of adding
a few other Arm based SoCs as well, but those did not pass the
review in time, so it's only this one.

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'jh7100-for-5.17' of https://github.com/esmil/linux
into arm/newsoc

Emil Renner Berthing (13):
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
      reset: starfive-jh7100: Fix 32bit compilation

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
 drivers/reset/reset-starfive-jh7100.c              |  173 +++
 drivers/tty/serial/8250/8250_dw.c                  |    3 +
 include/dt-bindings/clock/starfive-jh7100.h        |  202 +++
 include/dt-bindings/pinctrl/pinctrl-starfive.h     |  275 ++++
 include/dt-bindings/reset/starfive-jh7100.h        |  126 ++
 27 files changed, 3697 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
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
