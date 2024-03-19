Return-Path: <SRS0=rXPp=KZ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F443C6FD1F
	for <soc@archiver.kernel.org>; Tue, 19 Mar 2024 16:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22E5BC43390; Tue, 19 Mar 2024 16:33:51 +0000 (UTC)
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CC3AC433F1
	for <soc@kernel.org>; Tue, 19 Mar 2024 16:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CC3AC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id F292D1C00108;
	Tue, 19 Mar 2024 12:33:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 19 Mar 2024 12:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1710866027; x=1710952427; bh=5P
	acjDnrv60KmvLGthOosWtkrJp+6d39J0qvJm8IlpM=; b=BnsGpS5f7UfNmfoPnY
	1bjTCyPTeqoTaARq4e42Yupb/lq4FrV6SwiedHMvuhdpIYjthiQAXqXfg0+Y82Fl
	DZF0Qs4JIo7HcOmRSJRMeh6TdP8K/O4gfmr6R3A6jctqTrN/NG0gSdryz4nbKOgH
	zoMcBGQMwgwRzh301cB1ur12Uf+jYwfE7wxyHbGjRhDyv93eM45/ujwlGkgySF34
	Aq2Tis74BSyj0Ak16Me8+BREnrXJYimMvodbmEMlx+nsazaDuOWfbJG/ugtjroO6
	ZYFZx57l4r1FEHCyXNP8Qc01q5udhwa+o7wzISQDXan5HfWC9jk29l/dbEGOKOuE
	oWlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1710866027; x=1710952427; bh=5PacjDnrv60Km
	vLGthOosWtkrJp+6d39J0qvJm8IlpM=; b=oQlVvSB56wG6zXVZ3wctyVbMSuwc4
	tm8naZev045clh+N1cxN2r+OAtSwAH9X2gf7A073jVsEmLbwuvfUqMHr2pKUscsW
	wjHJdEHUpfB3QQsNaRae+0NK1vqwAUXKDnAPz6eCexIv2F0NwZ7joCVPdbxAj0jp
	B+D0fgm5c4dUXRWkVdUVPgy3G33lD/D0zsBBqn9uIMfp163/JnrF+Eun57DuvOpm
	C8u/jnydrzousBPjEV56KXOc4rCU9kbm+9u5ITf3qLHE8N3axNeqTqJ0+jbZgQIq
	EXnaqZvA8wgtkou9J1L+SlraDrBbKOSC/drTDzk2H7yutMdCGWy7TbeXA==
X-ME-Sender: <xms:a775ZcPaQ33jPDikZaYIKZ0lpBcn8qclOW4vTVLS4f3zwx0YKDNMQA>
    <xme:a775ZS9zKVre4CFvVX7HXLZvdOvTUg-I8ToVXbHClAnONeUw5x3NpDKyyh7ezRqEc
    xF0vawYi6UDgz8GvJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrledtgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnheptddvleffkedvueekvedvffekieejteevfeduvdffgfeljeegtddvuefhuedtkeej
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpphgvnhhguhhtrhhonhhigidruggvpd
    hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:a775ZTSd1omhJ4z6VR2CwDRfUfmRteWdCeq7uw2lDI8LPTWU3IyiEg>
    <xmx:a775ZUsTccp6fIKWdGQzUIF6bALdMqK-4sFu0ACNe2f682LXaursCQ>
    <xmx:a775ZUdd4th9gsYJ6MVEzPH92ssGS8Qv-JcwiCVHhynNtv9Xtql5ig>
    <xmx:a775ZY0disioWAjSGeeFb6xZuBHm0M1GjvEh7d00m0lCU459hlNvVw>
    <xmx:a775ZT7GMF1_LGwIi1AB1wXiHD9iEhWfOV5vNr7hdIVKdIvLRqNfqpUfJos>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 34349B6008D; Tue, 19 Mar 2024 12:33:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-300-gdee1775a43-fm-20240315.001-gdee1775a
MIME-Version: 1.0
Message-Id: <2227a206-d1b8-40e0-812e-c9b601bc0cc7@app.fastmail.com>
Date: Tue, 19 Mar 2024 17:32:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: late SoC changes for 6.9
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit d206a76d7d2726f3b096037f2079ce0bd3ba3=
29b:

  Linux 6.8-rc6 (2024-02-25 15:46:06 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-l=
ate-6.9

for you to fetch changes up to 72ebb41b88f9d7c10c5e159e0507074af0a22fe2:

  soc: fsl: dpio: fix kcalloc() argument order (2024-03-13 17:17:32 +010=
0)

----------------------------------------------------------------
ARM: late SoC changes for 6.9

These are changes that for some reason ended up not making it into the
first four branches but that should still make it into 6.9:

 - A rework of the omap clock support that touches both drivers and
   device tree files

 - The reset controller branch changes that had a dependency on late
   bugfixes. Merging them here avoids a backmerge of 6.8-rc5 into the
   drivers branch

 - The RISC-V/starfive, RISC-V/microchip and ARM/Broadcom devicetree
   changes that got delayed and needed some extra time in linux-next
   for wider testing.

----------------------------------------------------------------
Arnd Bergmann (8):
      ARM: bcm: stop selecing CONFIG_TICK_ONESHOT
      Merge tag 'omap-for-v6.9/dt-warnings-signed' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tmlind/linux-omap into soc/late
      Merge tag 'reset-for-v6.9' of git://git.pengutronix.de/pza/linux i=
nto soc/late
      Merge tag 'riscv-dt-for-v6.9' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/conor/linux into soc/late
      Merge tag 'arm-soc/for-6.9/devicetree-arm64' of https://github.com=
/Broadcom/stblinux into soc/late
      Merge tag 'arm-soc/for-6.9/drivers' of https://github.com/Broadcom=
/stblinux into soc/late
      Merge tag 'arm-soc/for-6.9/soc' of https://github.com/Broadcom/stb=
linux into soc/late
      soc: fsl: dpio: fix kcalloc() argument order

Changhuang Liang (1):
      riscv: dts: starfive: jh7110: Add camera subsystem nodes

Chen Wang (2):
      dt-bindings: reset: sophgo: support SG2042
      reset: simple: add support for Sophgo SG2042

Conor Dooley (1):
      riscv: dts: microchip: add missing CAN bus clocks

Cristian Ciocaltea (4):
      riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
      riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
      riscv: dts: starfive: visionfive-v1: Setup ethernet phy
      riscv: dts: starfive: beaglev-starlight: Setup phy reset gpio

Florian Fainelli (3):
      dt-bindings: bus: Document Broadcom GISB arbiter 74165 compatible
      bus: brcmstb_gisb: Added support for 74165 register layout
      ARM: brcmstb: Add debug UART entry for 74165

Heinrich Schuchardt (1):
      dt-bindings: riscv: cpus: reg matches hart ID

Ji Sheng Teoh (1):
      dt-bindings: pwm: opencores: Add compatible for StarFive JH8100

Krzysztof Kozlowski (4):
      of: Add of_phandle_args_equal() helper
      cpufreq: do not open-code of_phandle_args_equal()
      reset: gpio: Add GPIO-based reset controller
      reset: Instantiate reset GPIO controller for shared reset-gpios

Rafa=C5=82 Mi=C5=82ecki (2):
      arm64: dts: broadcom: bcmbca: bcm4908: use NVMEM layout for Asus G=
T-AC5300
      arm64: dts: broadcom: bcmbca: bcm4908: drop invalid switch cells

Shravan Chippa (1):
      riscv: dts: microchip: add specific compatible for mpfs pdma

Tony Lindgren (4):
      clk: ti: Handle possible address in the node name
      clk: ti: Improve clksel clock bit parsing for reg property
      ARM: dts: am3: Update clksel clocks to use reg instead of ti,bit-s=
hift
      ARM: dts: omap3: Update clksel clocks to use reg instead of ti,bit=
-shift

Uwe Kleine-K=C3=B6nig (2):
      bus: ts-nbus: Convert to atomic pwm API
      bus: ts-nbus: Improve error reporting

William Qiu (3):
      dt-bindings: pwm: Add bindings for OpenCores PWM Controller
      riscv: dts: starfive: jh7100: Add PWM node and pins configuration
      riscv: dts: starfive: jh7110: Add PWM node and pins configuration

 .../devicetree/bindings/bus/brcm,gisb-arb.yaml     |   1 +
 .../devicetree/bindings/pwm/opencores,pwm.yaml     |  56 +++
 .../bindings/reset/sophgo,sg2042-reset.yaml        |  35 ++
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   4 +
 MAINTAINERS                                        |   5 +
 arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi       |  39 +-
 arch/arm/boot/dts/ti/omap/am35xx-clocks.dtsi       |  18 +-
 arch/arm/boot/dts/ti/omap/omap3430es1-clocks.dtsi  |  52 ++-
 .../boot/dts/ti/omap/omap34xx-omap36xx-clocks.dtsi |  86 ++--
 .../omap36xx-am35xx-omap3430es2plus-clocks.dtsi    |  28 +-
 arch/arm/boot/dts/ti/omap/omap36xx-clocks.dtsi     |   7 +-
 .../ti/omap/omap36xx-omap3430es2plus-clocks.dtsi   |  46 +-
 arch/arm/boot/dts/ti/omap/omap3xxx-clocks.dtsi     | 510 +++++++++++---=
-------
 arch/arm/include/debug/brcmstb.S                   |   8 +-
 arch/arm/mach-bcm/Kconfig                          |   1 -
 .../dts/broadcom/bcmbca/bcm4908-asus-gt-ac5300.dts |  13 +-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   |   3 -
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |   6 +-
 .../boot/dts/starfive/jh7100-beaglev-starlight.dts |  11 +
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi    | 108 +++++
 .../dts/starfive/jh7100-starfive-visionfive-v1.dts |  22 +-
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |  45 ++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi |  71 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |  76 +++
 drivers/bus/brcmstb_gisb.c                         |  15 +
 drivers/bus/ts-nbus.c                              |  81 ++--
 drivers/clk/ti/apll.c                              |  11 +-
 drivers/clk/ti/clk.c                               |  71 ++-
 drivers/clk/ti/clock.h                             |   1 +
 drivers/clk/ti/divider.c                           |   5 +-
 drivers/clk/ti/gate.c                              |   9 +-
 drivers/clk/ti/interface.c                         |   4 +-
 drivers/clk/ti/mux.c                               |   6 +-
 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               | 224 ++++++++-
 drivers/reset/reset-gpio.c                         | 119 +++++
 drivers/reset/reset-simple.c                       |   2 +
 drivers/soc/fsl/dpio/dpio-service.c                |   2 +-
 include/dt-bindings/reset/sophgo,sg2042-reset.h    |  87 ++++
 include/linux/clk/ti.h                             |   3 +
 include/linux/cpufreq.h                            |   3 +-
 include/linux/of.h                                 |  16 +
 include/linux/reset-controller.h                   |   4 +
 44 files changed, 1441 insertions(+), 486 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm.=
yaml
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg204=
2-reset.yaml
 create mode 100644 drivers/reset/reset-gpio.c
 create mode 100644 include/dt-bindings/reset/sophgo,sg2042-reset.h
