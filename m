Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC94C4338F
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 21:47:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A8176109E; Thu, 19 Aug 2021 21:47:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22CD361029
	for <soc@kernel.org>; Thu, 19 Aug 2021 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629409657;
	bh=rlVgxSRSsx5VLC6/vhCeMop2CHxY2S2HZ9t9y2u1Luc=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=BtkXknt2FrTL/rtog+HKUfc2gRQPms/MziWoxvN71VWlkxODmB6KdWv4OI6K8UZJk
	 Mpq2wbUXP2NSC1j0fyLSiqK5Zy7qZkQhuE4xRxMlme8BqhWsyvk3/62rTIV182HLjd
	 lTYpLxjlePkVfzY/bueDRkiN8xD8xoYcMu9MrKQZIXVSItufvkBZWi0XgeGet9ZgFb
	 B1Klmt3fWs/O++Qc5XquT9cTQEeWW8t4CflW8t5JOc9MgnhIoqi/ss7X2Nyi9cS7Tx
	 55sXxLqXut00kQ2/i6SbhgWUWfHgCzYhBjFX/kNBzT0NEUB9vUnOhMVftDGT1DyOyj
	 Ab/AiUD50G/gA==
Received: by mail-wm1-f46.google.com with SMTP id f13-20020a1c6a0d000000b002e6fd0b0b3fso6094624wmc.3
        for <soc@kernel.org>; Thu, 19 Aug 2021 14:47:37 -0700 (PDT)
X-Gm-Message-State: AOAM533vJsazIeBHDZXULlhR/W7tLeUNq1IXkjG9Vl5DdIHie5V0lfuZ
	wT1E5ozNHc0nrcOFSgdNLDSXLQI79dO8AzSEh0g=
X-Google-Smtp-Source: ABdhPJyM0EcgKBx7ps1znzn+B+8kJLlZg1pTdIQIFd+WfcBp+B1ikmuZlGt9jgzw1EVdiMUA0neElZi47chWAqkqJmM=
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr618279wmo.75.1629409655708;
 Thu, 19 Aug 2021 14:47:35 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 19 Aug 2021 23:47:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a12+R4qpANkd4MWHa8YNNhXf0wNnN+GaWk4DqW3NJ+DQQ@mail.gmail.com>
Message-ID: <CAK8P3a12+R4qpANkd4MWHa8YNNhXf0wNnN+GaWk4DqW3NJ+DQQ@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.14, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 36a21d51725af2ce0700c6ebcb6b9594aac658a6:

  Linux 5.14-rc5 (2021-08-08 13:49:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.14-3

for you to fetch changes up to 1e16a40211208d2d6e217e5013607219f4272dff:

  Merge tag 'omap-for-v5.14/gpt12-fix-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes (2021-08-19 17:22:47 +0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.14, part 3

Not much to see here. Half the fixes this time are for Qualcomm dts files,
fixing small mistakes on certain machines. The other fixes are:

 - A 5.13 regression fix for freescale QE interrupt controller\

 - A fix for TI OMAP gpt12 timer error handling

 - A randconfig build regression fix for ixp4xx

 - Another defconfig fix following the CONFIG_FB dependency rework

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (4):
      ARM: ixp4xx: fix building both pci drivers
      Merge tag 'soc-fsl-fix-v5.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-5.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'omap-for-v5.14/gpt12-fix-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: fix reserved-mem

Linus Walleij (1):
      ARM: configs: Update the nhk8815_defconfig

Maxim Kochetkov (2):
      soc: fsl: qe: convert QE interrupt controller to platform_device
      soc: fsl: qe: fix static checker warning

Petr Vorel (3):
      arm64: dts: qcom: msm8992-bullhead: Remove PSCI
      arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping
      arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem

Sibi Sankar (1):
      arm64: dts: qcom: sc7280: Fixup cpufreq domain info for cpu7

Srinivas Kandagatla (1):
      arm64: dts: qcom: c630: fix correct powerdown pin for WSA881x

Tony Lindgren (1):
      bus: ti-sysc: Fix error handling for sysc_check_active_timer()

 arch/arm/configs/nhk8815_defconfig                 |  8 +--
 arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h    | 48 ++++++-------
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     | 12 ++++
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |  4 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  2 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  4 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  4 +-
 drivers/bus/ti-sysc.c                              |  4 +-
 drivers/pci/controller/pci-ixp4xx.c                |  8 +--
 drivers/soc/fsl/qe/qe_ic.c                         | 84 ++++++++++++----------
 10 files changed, 103 insertions(+), 75 deletions(-)
