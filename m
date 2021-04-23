Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFD8C433B4
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 19:55:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 516E061422; Fri, 23 Apr 2021 19:55:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BB1C6144A;
	Fri, 23 Apr 2021 19:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619207746;
	bh=1EfP92STqPVCo84Pc8H8VME5W96mb+TL+F+7XKPrVH8=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=HEgZJvrrJQS8++w0vm1ED25pqlE/qUEtUmmXRRQ1ZBrF8c9qw9tIgeHmi5aX/0lR1
	 SfRm6MsOPVtq9raSTPf0q+c1smI4Zq2tzKpA84N1yFUT6bNNV1Ph3C7cMBC7VB/bwY
	 vdIjylHDqfvLQyVilXZeLMwlPhK5xKH1f3/H05SjQzidwqEQCT7ivfTYSiqGb3oBrP
	 wB4nrfrHHYdiSO2pyncDnFoTNg5/+kR/zPl1fliLOmY0BNTpqeVY+o1+LKxJFhp179
	 p2BwN8Wxb/CxaQah/b9AMeMdfu4TzumYpNcToJhdVsEmnKrEzW448NX3lNNqtGseL8
	 VXh2iPIeI9ZoQ==
Received: by mail-wr1-f54.google.com with SMTP id r7so37480276wrm.1;
        Fri, 23 Apr 2021 12:55:46 -0700 (PDT)
X-Gm-Message-State: AOAM5329Hdcq+RrCGCJbCpGPa4NIQInyAXvhUBQyUgC13k6SQsKzz9oF
	sy6TbnP3TD1apS2Jg1/neshogTNEUxR8SX4sjgs=
X-Google-Smtp-Source: ABdhPJxuM/vCPHRJDCwpepsaJfOAUofX2HsZKPjMkIfn0bZH737KPzHYTbsTauilGjU/2xDkVQu+NAI2MORsRmP0Hwo=
X-Received: by 2002:adf:e483:: with SMTP id i3mr6881376wrm.286.1619207744741;
 Fri, 23 Apr 2021 12:55:44 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Apr 2021 21:55:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
Message-ID: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
Subject: [GIT PULL] ARM SoC fixes for v5.12, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit b9a9786a13ea158ee3b23614217f2e3158178421:

  Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes (2021-04-08 17:56:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.12-4

for you to fetch changes up to a1768dad775b5ceb25d17bc7a13318f43adf3069:

  Merge branch 'tegra/dt64' into arm/fixes (2021-04-23 15:38:13 +0200)

----------------------------------------------------------------
ARM SoC fixes for v5.12, part 4

These should be the final fixes for v5.12. There is one fix for SD card
detection on one Allwinner board, and a few fixes for the Tegra
platform that I had already queued up for v5.13 due to a communication
problem. This addresses MMC device ordering on multiple machines,
audio support on Jetson AGX Xavier and suspend/resume on Jetson TX2.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS

Arnd Bergmann (2):
      Merge tag 'sunxi-fixes-for-5.12-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge branch 'tegra/dt64' into arm/fixes

Jon Hunter (2):
      arm64: tegra: Set fw_devlink=on for Jetson TX2
      arm64: tegra: Fix mmc0 alias for Jetson Xavier NX

Sameer Pujar (1):
      arm64: tegra: Move clocks from RT5658 endpoint to device node

Thierry Reding (1):
      arm64: tegra: Add unit-address for ACONNECT on Tegra186

 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts      | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi          | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi                | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts      | 3 ++-
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi     | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi     | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi          | 1 -
 8 files changed, 14 insertions(+), 6 deletions(-)
