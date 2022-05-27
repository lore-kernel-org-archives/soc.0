Return-Path: <SRS0=/f1H=WD=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5304BC433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 18:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17E24C34118; Fri, 27 May 2022 18:24:45 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3D76C34113;
	Fri, 27 May 2022 18:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3D76C34113
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nuedc-0005Cn-T0; Fri, 27 May 2022 20:24:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] Rockchip dts32 changes for 5.19 #2
Date: Fri, 27 May 2022 20:24:40 +0200
Message-ID: <4798587.jE0xQCEvom@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 53070cfa8228bdc64148d1e8c76c9f97ed0dfd62:

  ARM: dts: rockchip: rename pcfg_pull_default node name on rk3036 (2022-04-11 02:16:33 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts32-2

for you to fetch changes up to 840fc447d78e3d4e4048c307ec8f6649d2abb9e7:

  ARM: dts: rockchip: add clocks property to cru node rk3228 (2022-05-27 19:27:00 +0200)

----------------------------------------------------------------
Amba and clock fixes to conform better to actual dt-bindings.

----------------------------------------------------------------
Johan Jonker (6):
      ARM: dts: rockchip: add clocks property to cru node rv1108
      ARM: dts: rockchip: Remove "amba" bus nodes from rv1108
      ARM: dts: rockchip: add clocks property to cru node rk3288
      ARM: dts: rockchip: add clocks property to cru node rk3066a/rk3188
      ARM: dts: rockchip: add clocks property to cru node rk3036
      ARM: dts: rockchip: add clocks property to cru node rk3228

 arch/arm/boot/dts/rk3036.dtsi  |  2 ++
 arch/arm/boot/dts/rk3066a.dtsi |  3 ++-
 arch/arm/boot/dts/rk3188.dtsi  |  3 ++-
 arch/arm/boot/dts/rk322x.dtsi  |  2 ++
 arch/arm/boot/dts/rk3288.dtsi  |  2 ++
 arch/arm/boot/dts/rv1108.dtsi  | 31 +++++++++++++------------------
 6 files changed, 23 insertions(+), 20 deletions(-)



