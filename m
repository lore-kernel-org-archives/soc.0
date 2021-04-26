Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810ADC433ED
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 16:00:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 420D9613AE; Mon, 26 Apr 2021 16:00:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C7B26044F
	for <soc@kernel.org>; Mon, 26 Apr 2021 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619452833;
	bh=Ydx2c2CtDwxZOH7nIcaL66dzGtv825v3W7/m/HfxyAE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IAh56Qn4SFXazzMrqOsVZ2tikRT/QsQlTCsEVUtFk0PmsGrnvBQr5XGPrd1x6F4jq
	 /hlA/YyMAjf5Xdb5rBGwJmQNrrSLLWKq9pDmhMz6gG8rg1+Xn0cwnvQ99eeL79J8Fi
	 VXfjcia1VgxxqD5PlodsDnDHg1q0hJyajegN5rM37Kf1ydsp5h7M5rjgSKekYAHL10
	 PKGv6kO3kBR+gFPBuneYXZpnTYyhfkcM/LrlegyboiV/QExVzZ1S2ttszxX5Qab9FI
	 edjaxjyQ55GIvek7LYPKIg6hplyozkX7OjkbDtwLAVLe7BI/d0po7nR7lHyqda0KvO
	 WNpfMgqHwUcqg==
Received: by mail-wm1-f45.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so5443201wmq.4
        for <soc@kernel.org>; Mon, 26 Apr 2021 09:00:33 -0700 (PDT)
X-Gm-Message-State: AOAM531H8Dk/9mL95vuaOGTEJ6AkI4P+oX1VMPhRNsNqH+MvSt2NR97L
	WgO5/gB96Leonj6CRY2ZyzPlQzxzAL4KRwbbvnA=
X-Google-Smtp-Source: ABdhPJyjYkHYSNOxgoAHIsP9jTRhx2A9a7Mz3/O7zxXBct6dnysCATm4L/z1YzkVyrNq9td1AEYr/73P20dJKL4e6Jg=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr21479066wmj.120.1619452831641;
 Mon, 26 Apr 2021 09:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
In-Reply-To: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 26 Apr 2021 18:00:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
Message-ID: <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
Subject: [GIT PULL 5/6] ARM: platform support for Nuvoton WPCM450
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15=
:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-newsoc=
-5.13

for you to fetch changes up to 39b95079f68cf17888a4cee93ad3c4acc3854b38:

  Merge tag 'bmc-5.13-wpcm450' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/newsoc
(2021-04-09 09:02:55 +0200)

----------------------------------------------------------------
ARM: platform support for Nuvoton WPCM450

The Nuvoton WPCM450 BMC is an older chip based on the ARM926 CPU core
that remains in use on Supermicro X9 server boards among others. Support
gets added for a particular server board using this SoC along with the
basic platform bringup.

As the platform is a predecessor to the npcm7xx platform we already
support, it is added to the same directory, despite using a different
name. It also seems to be related to the older w90x900/nuc9xx platform
that was removed last year.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'bmc-5.13-wpcm450' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into arm/newsoc

Joel Stanley (1):
      ARM: config: Add WPCM to multi v5

Jonathan Neusch=C3=A4fer (10):
      dt-bindings: arm: Convert nuvoton,npcm750 binding to YAML
      ARM: dts: Add board-specific compatible string to npcm750-evb devicet=
ree
      dt-bindings: vendor-prefixes: Add Supermicro
      dt-bindings: arm: npcm: Add nuvoton,wpcm450 compatible string
      dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt
      ARM: npcm: Introduce Nuvoton WPCM450 SoC
      watchdog: npcm: Add support for WPCM450
      ARM: dts: Add devicetree for Nuvoton WPCM450 BMC chip
      ARM: dts: Add devicetree for Supermicro X9SCi-LN4F based on WPCM450
      MAINTAINERS: Add entry for Nuvoton WPCM450

 .../devicetree/bindings/arm/npcm/npcm.txt          |  6 --
 .../devicetree/bindings/arm/npcm/npcm.yaml         | 29 +++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 .../bindings/watchdog/nuvoton,npcm-wdt.txt         |  3 +-
 MAINTAINERS                                        |  9 +++
 arch/arm/boot/dts/Makefile                         |  2 +
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  2 +-
 .../dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts  | 40 ++++++++++++
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi             | 76 ++++++++++++++++++=
++++
 arch/arm/configs/multi_v5_defconfig                |  3 +
 arch/arm/mach-npcm/Kconfig                         | 12 +++-
 arch/arm/mach-npcm/Makefile                        |  1 +
 arch/arm/mach-npcm/wpcm450.c                       | 13 ++++
 drivers/watchdog/npcm_wdt.c                        |  1 +
 14 files changed, 190 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.yaml
 create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f=
.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450.dtsi
 create mode 100644 arch/arm/mach-npcm/wpcm450.c
