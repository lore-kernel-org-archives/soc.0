Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE295C00140
	for <soc@archiver.kernel.org>; Fri,  5 Aug 2022 10:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE7F8C43470; Fri,  5 Aug 2022 10:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B61C433C1
	for <soc@kernel.org>; Fri,  5 Aug 2022 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659694910;
	bh=RAysyoRQpKeBdDuaSKztvDwO/0wZqcvSMggtWzuQ5sE=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=qMZXaQoUp5XG8bXNW6Yf/b59I4w4pzamPpc5c2NxVehHATsuntNrWOwGqpCg4ECgA
	 kMhqRqL8qvTXZies2J0tUGel3MO50WZ4TOY1tKqKP1ET7fOQAgads/60HAyxFemGL5
	 6MuNAvFoC3izUbTKKzzIsTTMCm+LByq2OZqVpWgEM96HUpFCOM6B6anEmWIzb8Og5t
	 AAupkL75oXl/26S69pohKbfRUs9/h92Z0/ftYwhWZjVa+07knFwoI1GUnR12ffQjo4
	 3WOMjFW46cnnt5GtKv6qjVXb5On0Fz1Zo8LWHu/9VsZ0Q9KLipb7k/7CtMvdqCV2fV
	 NScA0PHmZXdXg==
Received: by mail-ej1-f54.google.com with SMTP id dc19so4153625ejb.12
        for <soc@kernel.org>; Fri, 05 Aug 2022 03:21:50 -0700 (PDT)
X-Gm-Message-State: ACgBeo394bsUJNhIik7nnxHHvk8GAOsrUkcHcVw21yZSAqXRzaq7WvKm
	+G7h5K63/AQTy51ZrVwPSDoUUO9PX96PcaMW3Q8=
X-Google-Smtp-Source: AA6agR79ANyfF5x2ZK8oLS8A4zTCaxyJ/qcRLi84KkYxaRg/QroP0u1cuVsMUHty0FWsEm7SMgNItS526gmi9ZE48eQ=
X-Received: by 2002:a17:907:960f:b0:731:1e3:b198 with SMTP id
 gb15-20020a170907960f00b0073101e3b198mr1024234ejc.470.1659694908826; Fri, 05
 Aug 2022 03:21:48 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Aug 2022 12:21:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a012ZLQZ4MKkheitdoV9k_eKkp3BZGxFV1COWwZr1-T9g@mail.gmail.com>
Message-ID: <CAK8P3a012ZLQZ4MKkheitdoV9k_eKkp3BZGxFV1COWwZr1-T9g@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC: late updates for 6.0
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 3d7cb6b04c3f3115719235cc6866b10326de34cd=
:

  Linux 5.19 (2022-07-31 14:03:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-late-6=
.0

for you to fetch changes up to 1630eee2d4e77d8c121ab955d31befacb720bb99:

  Merge branch 'arm/fixes' into arm/late (2022-08-05 11:33:33 +0200)

----------------------------------------------------------------
ARM: SoC: late updates for 6.0

These updates came in after I had already tagged the branches,
but they still seem appropriate for 6.0 and most of them were
part of linux-next through other trees.

 - The reset controller tree adds one new driver for the TI TPS380x
   power management chip and a few minor changes in other drivers

 - Apple M1 now has a DT entry for the NVMe controller after the
   driver was merged, and has a new mailing list in the MAINTAINERS
   file.

 - Fixes for USB on the Socionext Uniphier platforms and the
   network controller on Intel Cyclone5.

----------------------------------------------------------------
Arnd Bergmann (5):
      Merge tag 'asahi-soc-maintainers-5.20' of
https://github.com/AsahiLinux/linux into arm/fixes
      Merge tag 'reset-for-v5.20' of
git://git.pengutronix.de/pza/linux into arm/late
      Merge tag 'asahi-soc-dt-5.20' of
https://github.com/AsahiLinux/linux into arm/late
      Merge tag 'socfpga_updates_for_v5.20_part2' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/late
      Merge branch 'arm/fixes' into arm/late

Ben Dooks (2):
      reset: allow building of reset simple driver if expert config selecte=
d
      reset: reset-simple should depends on HAS_IOMEM

Biju Das (1):
      dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G2UL
USBPHY Control bindings

Cl=C3=A9ment L=C3=A9ger (1):
      reset: microchip-sparx5: allow building as a module

Colin Ian King (1):
      reset: tps380x: Fix spelling mistake "Voltags" -> "Voltage"

Dinh Nguyen (1):
      ARM: dts: add EMAC AXI settings for Cyclone5

Hector Martin (1):
      arm64: dts: apple: Re-parent ANS2 power domains

Kunihiko Hayashi (2):
      ARM: dts: uniphier: Fix USB interrupts for PXs2 SoC
      arm64: dts: uniphier: Fix USB interrupts for PXs3 SoC

Marco Felsch (2):
      dt-bindings: reset: Add TPS380x documentation
      reset: tps380x: Add TPS380x device driver supprt

Philipp Zabel (2):
      reset: a10sr: allow building under COMPILE_TEST
      Revert "reset: microchip-sparx5: allow building as a module"

Sven Peter (2):
      MAINTAINERS: add ARM/APPLE MACHINE mailing list
      arm64: dts: apple: t8103: Add ANS2 NVMe nodes


 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |   1 +
 .../bindings/reset/ti,tps380x-reset.yaml           |  49 ++++++++
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/socfpga.dtsi                     |   8 ++
 arch/arm/boot/dts/uniphier-pxs2.dtsi               |   8 +-
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi          |   7 +-
 arch/arm64/boot/dts/apple/t8103.dtsi               |  34 ++++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   |   8 +-
 drivers/reset/Kconfig                              |  13 ++-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tps380x.c                      | 126 +++++++++++++++++=
++++
 11 files changed, 240 insertions(+), 16 deletions(-)
 create mode 100644 drivers/reset/reset-tps380x.c
