Return-Path: <SRS0=Q9lN=JI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDA7C433ED
	for <soc@archiver.kernel.org>; Sun, 11 Apr 2021 09:44:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79A4C6120B; Sun, 11 Apr 2021 09:44:01 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B96860FDB;
	Sun, 11 Apr 2021 09:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B96860FDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=heiko@sntech.de
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1lVWdK-00047c-K1; Sun, 11 Apr 2021 11:43:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.13
Date: Sun, 11 Apr 2021 11:43:57 +0200
Message-ID: <4638723.31r3eYUQgx@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below (and in the next mail) dts changes for
Rockchip platforms for 5.13.

Please pull

Thanks
Heiko

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.13-rockchip-dts32

for you to fetch changes up to e89db2b4c706b9ca1293e7025ef5e8730b5d1b5b:

  ARM: dts: rockchip: move rv1108 mmcx aliases to board dts files (2021-04-11 11:11:42 +0200)

----------------------------------------------------------------
MMC aliases fixups and some property/compatible cleanups.

----------------------------------------------------------------
Heiko Stuebner (2):
      ARM: dts: rockchip: move rk322x mmcx aliases to board dts files
      ARM: dts: rockchip: move rv1108 mmcx aliases to board dts files

Johan Jonker (3):
      ARM: dts: rockchip: add new watchdog compatible to rv1108.dtsi
      ARM: dts: rockchip: add new watchdog compatible to rk322x.dtsi
      ARM: dts: rockchip: remove clock-names property from watchdog node in rv1108.dtsi

 arch/arm/boot/dts/rk3228-evb.dts      | 4 ++++
 arch/arm/boot/dts/rk3229-evb.dts      | 4 ++++
 arch/arm/boot/dts/rk3229-xms6.dts     | 6 ++++++
 arch/arm/boot/dts/rk322x.dtsi         | 5 +----
 arch/arm/boot/dts/rv1108-elgin-r1.dts | 4 ++++
 arch/arm/boot/dts/rv1108-evb.dts      | 4 ++++
 arch/arm/boot/dts/rv1108.dtsi         | 6 +-----
 7 files changed, 24 insertions(+), 9 deletions(-)



