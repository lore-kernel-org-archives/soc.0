Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF7EC433EF
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 22:56:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C9144611C6; Wed,  3 Nov 2021 22:56:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3685611C4
	for <soc@kernel.org>; Wed,  3 Nov 2021 22:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635980201;
	bh=LKIzISCHGuvLVtj7yY9nXM5RUWiKpq2yeusvTq1hNZ4=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=OonINC0IMTdMlP6x9zb0zOyCzlVV8eWUuZKYHJ78sIE7gI64t3bzIYt7IQzAI3cYU
	 9mGbn5q0kouJkRpXHgNpvqoH5tH8e8mpU0RtzdG73lHsu3/OgiTiDfKG/ZkpU69D5k
	 6N8R5bb1wGn68rGiX967UYOZ21tZ8kjNdjBvs6zy6CIgFAplPoLvGGT7E61tF+CT4k
	 n9q+tNY1xc//PSc8HnX5PT0vBscYpFN4WN17uZr5TWa9QH/BjQo3i2QYWXOU8p7bqO
	 eATUUasfeS0XSFgrpVRjZFg9Htt6k0CSGY3oWGp/oRN8WBtQVk4FrGLI6551ZFYV9i
	 cAmbOfpHidTqw==
Received: by mail-wm1-f51.google.com with SMTP id j128-20020a1c2386000000b003301a98dd62so5801121wmj.5
        for <soc@kernel.org>; Wed, 03 Nov 2021 15:56:41 -0700 (PDT)
X-Gm-Message-State: AOAM531aXPOrVgOecAnXYhLmLyxxcwaznxwSDYzIpbVn1e3U6CS1Wn8a
	Qqox1AfKu0yuT6kgV03GKX7NBRxJxL2M0LbCer0=
X-Google-Smtp-Source: ABdhPJxLvoGtkmhJhFsrNk0uNOilNMGBy9c52nEt2dyqXxqJVZuPYuLEx8Q/JZuVqguAo3KoG8K73lVVt5L9E90uSWM=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr18832057wmb.1.1635980200249;
 Wed, 03 Nov 2021 15:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Nov 2021 23:56:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
Message-ID: <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
Subject: [GIT PULL 4/4] ARM: defconfig updates for 5.16
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.16

for you to fetch changes up to fa348938dbfccc1df1dc902f6bcb76d4f05029e7:

  Merge tag 'qcom-arm64-defconfig-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfigs (2021-10-26 18:16:46 +0200)

----------------------------------------------------------------
ARM: defconfig updates for 5.16

These are the usual changes to enable newly added driver
by default, and to do some housekeeping around changing
Kconfig symbols.

----------------------------------------------------------------
Alistair Francis (1):
      ARM: imx_v6_v7_defconfig: Enable HID I2C

Arnd Bergmann (8):
      Merge tag 'multiv7-defconfig-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into
arm/defconfigs
      Merge tag 'renesas-arm-defconfig-for-v5.16-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/defconfigs
      Merge tag 'tegra-for-5.16-arm64-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/defconfigs
      Merge tag 'mvebu-defconfig-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/defconfigs
      Merge tag 'visconti-arm-defconfig-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti
into arm/defconfigs
      Merge tag 'imx-defconfig-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/defconfigs
      Merge tag 'aspeed-5.16-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into
arm/defconfigs
      Merge tag 'qcom-arm64-defconfig-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfigs

Biju Das (5):
      arm64: defconfig: Enable RIIC
      arm64: defconfig: Enable RZ/G2L USBPHY control driver
      arm64: defconfig: Enable RZ_DMAC
      arm64: defconfig: Enable SOUND_SOC_RZ
      arm64: defconfig: Enable SND_SOC_WM8978

Bjorn Andersson (3):
      arm64: defconfig: Disable firmware sysfs fallback
      arm64: defconfig: Enable Qualcomm prima/pronto drivers
      arm64: defconfig: Enable Qualcomm LMH driver

Joel Stanley (10):
      ARM: configs: aspeed_g5: Reneable DRM_FBDEV_EMULATION
      ARM: config: multi v7: Drop unavailable options
      ARM: config: multi v7: Clean up enabled by default options
      ARM: config: multi v7: Add renamed symbols
      ARM: config: multi v7: Regenerate defconifg
      ARM: configs: aspeed: Disable IPV6 SIT device
      ARM: configs: aspeed: Enable commonly used drivers
      ARM: configs: aspeed: Enable pstore and lockup detectors
      ARM: config: aspeed: Enable Network Block Device
      ARM: configs: aspeed: Remove unused USB gadget devices

Lad Prabhakar (1):
      arm64: defconfig: Enable RZG2L_ADC

Marcel Ziswiler (7):
      ARM: imx_v6_v7_defconfig: enable mtd physmap
      ARM: imx_v6_v7_defconfig: change snd soc tlv320aic3x to i2c variant
      ARM: imx_v6_v7_defconfig: rebuild default configuration
      ARM: imx_v6_v7_defconfig: build imx sdma driver as module
      ARM: imx_v6_v7_defconfig: enable bpf syscall and cgroup bpf
      ARM: mvebu_v7_defconfig: enable mtd physmap
      ARM: mvebu_v7_defconfig: rebuild default configuration

Maulik Shah (1):
      arm64: defconfig: Enable Sleep stats driver

Nobuhiro Iwamatsu (1):
      arm64: defconfig: Visconti: Enable PCIe host controller

Sai Prakash Ranjan (1):
      arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and interconnect

Sameer Pujar (1):
      arm64: defconfig: Enable few Tegra210 based AHUB drivers

Wolfram Sang (1):
      arm64: defconfig: Add Renesas TPU as module

Zenghui Yu (1):
      arm64: defconfig: drop obsolete ARCH_* configs

 arch/arm/configs/aspeed_g4_defconfig |  1 +
 arch/arm/configs/aspeed_g5_defconfig | 35 +++++++++------
 arch/arm/configs/imx_v6_v7_defconfig | 47 ++++++++-----------
 arch/arm/configs/multi_v7_defconfig  | 87 +++++++++++++-----------------------
 arch/arm/configs/mvebu_v7_defconfig  | 18 ++++----
 arch/arm64/configs/defconfig         | 27 +++++++++--
 6 files changed, 102 insertions(+), 113 deletions(-)
