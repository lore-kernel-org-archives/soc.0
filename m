Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7FBC433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94C4DC34119; Thu, 26 May 2022 14:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF51C34116
	for <soc@kernel.org>; Thu, 26 May 2022 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576654;
	bh=6D+Z0sswbk/yODsmfBZIEk8ggY8MElSfOtPAllT6TwY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Wcq+Mo9bY2X0zv7dNttd8m5RveAx4U70zNJXtXn6UABA5DJaPcfygGv1zPRS4wJT0
	 g7/4xNlfPAnnzi+99QcItgHaDOOhMC+Wbbjy/adqIAnSWlpLBiVWTbj7pz5dZKZfCv
	 J4K2TxLAq6mUeMn+pu6k6HGP8b03TEYBtN23FHFF3I04j7qfwlYUWoLlA0r0dPYVIn
	 Q1/3ykpcnEllKwx0xbkYqehGG17Rj7wLOZkv4MW6cABwhXYtYGec1AVjnPzIzPSk7J
	 LsbJn4BajAImEfeIdC0bfi6It9idRMAg4Wxa5zbqtpmh+qe9r1aGk2o/W7vWxTNxf4
	 qUU2/KXneyQHg==
Received: by mail-yb1-f172.google.com with SMTP id l32so3223468ybe.12
        for <soc@kernel.org>; Thu, 26 May 2022 07:50:54 -0700 (PDT)
X-Gm-Message-State: AOAM530bEc5t8NmIAq3ySfOhwQo9MWd46KOgmxJld5V51ZVolidjQcvc
	a+BeMQTzKqO66WC/AVjCZba/BVY3fANmBsEQGEc=
X-Google-Smtp-Source: ABdhPJx3xuHfAQGaknhvtVB+wgizD35lkxAhXn/Br7gihmUuIjGXqVHd1zDo3I9OImw9KCRKduDMPZwHy6/5yJwCCCY=
X-Received: by 2002:a25:c747:0:b0:64f:62fb:f55e with SMTP id
 w68-20020a25c747000000b0064f62fbf55emr28509297ybe.106.1653576653569; Thu, 26
 May 2022 07:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
In-Reply-To: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 26 May 2022 16:50:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0KQDRP0XJKQAPU6GUL1kTREAWc89skCf3qcS6utoo07w@mail.gmail.com>
Message-ID: <CAK8P3a0KQDRP0XJKQAPU6GUL1kTREAWc89skCf3qcS6utoo07w@mail.gmail.com>
Subject: [GIT PULL 4/5] ARM: defconfig updates for 5.19
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit b2d229d4ddb17db541098b83524d901257e93845=
:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-defconfig-5.19

for you to fetch changes up to 2cc1cd26e913848738f31fbb07663f0fe2d98fa4:

  ARM: configs: Enable ASoC AC'97 glue (2022-05-13 14:16:01 +0200)

----------------------------------------------------------------
ARM: defconfig updates for 5.19

Lots of smaller additions to the defconfig files for both 32-bit
and 64-bit arm platforms, enabling drivers that are now usable
on common hardware, and a few options to make it possible to boot
a file system image using systemd.

----------------------------------------------------------------
Adam Ford (1):
      ARM: omap2plus_defconfig: Enable ISP176x USB driver

An=C3=ADbal Lim=C3=B3n (1):
      arm64: defconfig: Enable PM8916 watchdog driver

Arnd Bergmann (12):
      Merge tag 'renesas-arm-defconfig-for-v5.19-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/defconfig
      Merge tag 'omap-for-v5.19/defconfig-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/defconfig
      Merge tag 'arm-soc/for-5.19/defconfig' of
https://github.com/Broadcom/stblinux into arm/defconfig
      Merge tag 'at91-defconfig-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into
arm/defconfig
      Merge tag 'renesas-arm-defconfig-for-v5.19-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/defconfig
      Merge tag 'tegra-for-5.19-arm-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/defconfig
      Merge tag 'tegra-for-5.19-arm64-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/defconfig
      Merge tag 'ti-k3-config-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into
arm/defconfig
      Merge tag 'imx-defconfig-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/defconfig
      Merge tag 'qcom-arm64-defconfig-for-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig
      Merge tag 'qcom-defconfig-for-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfig
      Merge tag 'v5.18-next-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into
arm/defconfig

Biju Das (1):
      arm64: defconfig: Enable ARCH_R9A07G043

Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm PCIe Gen2 PHY

Brian Masney (2):
      ARM: qcom_defconfig: enable options for Qualcomm random number genera=
tor
      ARM: qcom_defconfig: enable debug fs support

Bryan O'Donoghue (1):
      arm64: defconfig: Enable SM8250 video clock controller

Chuanhong Guo (1):
      arm: mediatek: select arch timer for mt7629

Claudiu Beznea (1):
      ARM: configs: at91: sama7: enable CONFIG_RESET_CONTROLLER

Codrin Ciubotariu (1):
      ARM: configs: at91: sama7: add MCHP PDMC and DMIC drivers

Dmitry Baryshkov (5):
      arm64: defconfig: enable Qualcomm RX and TX macro for SM8250 audio
      arm64: defconfig: enable wcd9335 codec as module
      arm64: defconfig: reenable SM_DISPCC_8250
      arm64: defconfig: Enable some Qualcomm drivers
      arm64: defconfig: enable ath11k driver

Eugen Hristev (2):
      ARM: multi_v7_defconfig: add atmel video pipeline modules
      ARM: configs: at91: sama7: add xisc and csi2dc

Fabien Parent (2):
      arm64: defconfig: enable MT6359 regulator driver
      arm64: defconfig: enable some mt6360 PMIC drivers

Fabio Estevam (1):
      arm64: defconfig: Enable the WM8524 codec driver

Geert Uytterhoeven (2):
      arm64: defconfig: Enable Maxim MAX96712 Quad GMSL2 Deserializer suppo=
rt
      ARM: shmobile: defconfig: Refresh for v5.18-rc1

Lad Prabhakar (1):
      arm64: defconfig: Enable ARCH_R9A07G054

Lukas Bulwahn (1):
      arm: nomadik: drop selecting obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK

Mark Brown (3):
      ARM: configs: at91: Enable options required for systemd
      ARM: configs: Enable audio on BeagleBone Black in multi_v7_defconfig
      ARM: configs: Enable ASoC AC'97 glue

Max Krummenacher (1):
      ARM: imx_v6_v7_defconfig: Enable the ADC part of the STMPE MFD

Merlijn Wajer (1):
      ARM: omap2plus_defconfig: enable TLV320AIC3X

Nicolas Ferre (1):
      ARM: configs: at91: Enable AUTOFS_FS required by systemd

Phil Edworthy (1):
      arm64: defconfig: Enable Renesas RZ/V2M SoC

Rahul T R (1):
      arm64: defconfig: Enable configs for DisplayPort on J721e

Sameer Pujar (1):
      arm64: defconfig: Build Tegra ASRC module

Tudor Ambarus (3):
      ARM: configs: at91: Remove MTD_BLOCK and use MTD_UBI_BLOCK for
read only block FS
      ARM: configs: at91: sama7: Enable MTD_UBI_FASTMAP
      ARM: configs: at91: sama7: Enable MTD_UBI_BLOCK

Vinod Koul (1):
      arm64: defconfig: Enable Qualcomm GPI DMA Driver

William Zhang (1):
      ARM: multi_v7_defconfig: enable CONFIG_ARCH_BCMBCA in armv7 defconfig

carsten.haitzler@foss.arm.com (1):
      arm64: defconfig: Enable modules for arm displays

 arch/arm/configs/at91_dt_defconfig   |  4 +++-
 arch/arm/configs/imx_v6_v7_defconfig |  1 +
 arch/arm/configs/multi_v7_defconfig  |  8 ++++++++
 arch/arm/configs/omap2plus_defconfig |  3 +++
 arch/arm/configs/qcom_defconfig      |  8 ++++++++
 arch/arm/configs/sama5_defconfig     |  3 ++-
 arch/arm/configs/sama7_defconfig     |  8 ++++++++
 arch/arm/configs/shmobile_defconfig  |  4 ++--
 arch/arm/configs/tegra_defconfig     |  3 ++-
 arch/arm/mach-mediatek/Kconfig       |  1 +
 arch/arm/mach-nomadik/Kconfig        |  1 -
 arch/arm64/configs/defconfig         | 33 ++++++++++++++++++++++++++++++++=
+
 12 files changed, 71 insertions(+), 6 deletions(-)
