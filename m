Return-Path: <SRS0=F4Pt=G7=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EC7C433DB
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 08:32:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EFF3564DCE; Thu, 28 Jan 2021 08:32:10 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B9564DBD;
	Thu, 28 Jan 2021 08:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15B9564DBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=heiko@sntech.de
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1l52ik-0007ad-0O; Thu, 28 Jan 2021 09:32:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 5.11
Date: Thu, 28 Jan 2021 09:32:05 +0100
Message-ID: <5429065.DvuYhMxLoT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below some Rockchip devicetree fixes for the 5.11 cycle.
Please pull!

Thanks
Heiko

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-dtsfixes1

for you to fetch changes up to 74532de460ec664e5a725507d1b59aa9e4d40776:

  arm64: dts: rockchip: Disable display for NanoPi R2S (2021-01-26 00:10:21 +0100)

----------------------------------------------------------------
Wrong irq number on px30 and cleanups of stuff on rk3399 regarding
wrongly used dt properties and parts that shouldn't be enabled.

----------------------------------------------------------------
Johan Jonker (1):
      arm64: dts: rockchip: remove interrupt-names property from rk3399 vdec node

Marc Zyngier (1):
      arm64: dts: rockchip: Fix PCIe DT properties on rk3399

Robin Murphy (1):
      arm64: dts: rockchip: Disable display for NanoPi R2S

Sandy Huang (1):
      arm64: dts: rockchip: fix vopl iommu irq on px30

Simon South (1):
      arm64: dts: rockchip: Use only supported PCIe link speed on Pinebook Pro

 arch/arm64/boot/dts/rockchip/px30.dtsi               | 2 +-
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts   | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 1 -
 arch/arm64/boot/dts/rockchip/rk3399.dtsi             | 3 +--
 4 files changed, 6 insertions(+), 4 deletions(-)



