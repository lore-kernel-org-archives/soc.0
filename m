Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6592BC432BE
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 19:59:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3D91E610CD; Wed,  1 Sep 2021 19:59:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2816C60FDA
	for <soc@kernel.org>; Wed,  1 Sep 2021 19:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630526376;
	bh=1pXfRHHG5u73jlAB8s5lgSNmtlr5aSYe5oh6WLnXm3c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MswiDY0cy8JRAkNwtmk9b3yMTbb3eNQ183XG4/y3q+eerE0R0UxppWt4AGjI6li3C
	 h7Ak3IOgyn1PflQs/mxjoSa8TMYl7wMKjbZD662ZsPu/u5orKOZGENzsXB7847ZIrS
	 C+qth284/Uxhblhj0NYu2DGPTbs9d85kP+j3XhPPK7KasY6n0DrLR1tTnI24qHHFMs
	 bRRhwRdZuSP2Er1dSfRBbRt6+orWe2GGL/dABvBs+BxCIBd34aP/kQ0I90vxWudoMn
	 dW+d0Uz3uWOcwgrvGwJhQnUYkV9oVY4IUiQZF7OJzm9sasiHUyJdGyJZDoY6URO0DO
	 6b5rL0twS+ofA==
Received: by mail-wr1-f45.google.com with SMTP id z4so1378124wrr.6
        for <soc@kernel.org>; Wed, 01 Sep 2021 12:59:36 -0700 (PDT)
X-Gm-Message-State: AOAM531BnbYEyR50s0Xsq2byQcIyuswlJ5bldz3qYmpVf611gvLv6F4K
	ischNTSC7BClsR68xEbFCc5j3Qoyx7vYv+YUJTQ=
X-Google-Smtp-Source: ABdhPJw/VRBmj0MIQnvwxyY4UaeerBHEQDnqsMU5ZqLt5BrsdW+vzx65gH47bXc5tkWZNA35JRiFFrAt8p1wbXT0WPg=
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr1259129wrd.286.1630526374815;
 Wed, 01 Sep 2021 12:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
In-Reply-To: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 1 Sep 2021 19:59:18 +0000
X-Gmail-Original-Message-ID: <CAK8P3a382k=ALTzRc=d_XyyM186tgjGRKux-r36xk-F_BsAzXg@mail.gmail.com>
Message-ID: <CAK8P3a382k=ALTzRc=d_XyyM186tgjGRKux-r36xk-F_BsAzXg@mail.gmail.com>
Subject: [GIT PULL 3/4] ARM: defconfigs for v5.15
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.15

for you to fetch changes up to 79cd0bb66e359f5f9398de9d2e86eac776947691:

  Merge tag 'zynq-soc-for-v5.15' of
https://github.com/Xilinx/linux-xlnx into arm/defconfig (2021-08-26
11:32:31 +0200)

----------------------------------------------------------------
ARM: defconfigs for v5.15

The usual set of defconfig updates, including one new defconfig file
for the new sama7 family of SoCs.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Anand Moon (1):
      ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC

Arnd Bergmann (7):
      Merge tag 'at91-defconfig-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/defconfig
      Merge tag 'amlogic-arm-configs-for-v5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into
arm/defconfig
      Merge tag 'tegra-for-5.15-arm-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/defconfig
      Merge tag 'imx-defconfig-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig
      Merge tag 'aspeed-5.15-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into
arm/defconfig
      Merge tag 'zynq-soc-for-v5.15' of
https://github.com/Xilinx/linux-xlnx into arm/defconfig

Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm MSM8996 CPU clock driver

Dmitry Osipenko (5):
      ARM: tegra: Enable CONFIG_TEGRA30_TSENSOR
      ARM: tegra: Enable CONFIG_FB
      ARM: tegra: Enable Acer A500 drivers
      ARM: multi_v7_defconfig: Enable Acer A500 drivers
      ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR

Eugen Hristev (2):
      ARM: configs: at91: add defconfig for sama7 family of SoCs
      ARM: multi_v7_defconfig: add sama7g5 SoC

Fabio Estevam (2):
      ARM: imx_v6_v7_defconfig: Select CONFIG_KPROBES
      ARM: imx_v6_v7_defconfig: Let CONFIG_SCSI_LOWLEVEL be selected

Joel Stanley (4):
      ARM: config: aspeed: Enable hardened allocator feature
      ARM: config: aspeed: Enable KCS adapter for raw SerIO
      ARM: config: aspeed_g4: Enable EDAC and SPGIO
      ARM: config: aspeed: Regenerate defconfigs

Maxim Schwalm (2):
      ARM: tegra: Enable CONFIG_CROS_EC
      ARM: tegra: Rebuild default configuration

Michael Walle (1):
      ARM: configs: multi_v7: enable PL35x NAND controller

Pascal Zimmermann (1):
      ARM: imx_v6_v7_defconfig: enable driver of the LTC3676 PMIC

 arch/arm/configs/aspeed_g4_defconfig |  16 +--
 arch/arm/configs/aspeed_g5_defconfig |  25 ++---
 arch/arm/configs/imx_v6_v7_defconfig |   3 +-
 arch/arm/configs/multi_v7_defconfig  |   8 ++
 arch/arm/configs/sama7_defconfig     | 209 +++++++++++++++++++++++++++++++++++
 arch/arm/configs/tegra_defconfig     |  25 ++---
 arch/arm64/configs/defconfig         |   1 +
 7 files changed, 242 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm/configs/sama7_defconfig
