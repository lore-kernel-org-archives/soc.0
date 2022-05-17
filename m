Return-Path: <SRS0=LCQ7=VZ=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041DBC433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 19:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C26FAC34118; Tue, 17 May 2022 19:35:43 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6BC6C385B8;
	Tue, 17 May 2022 19:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6BC6C385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from wf0416.dip.tu-dresden.de ([141.76.181.160] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nr2yr-0004DI-1C; Tue, 17 May 2022 21:35:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.19 #2
Date: Tue, 17 May 2022 21:35:39 +0200
Message-ID: <5916377.R56niFO833@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 53070cfa8228bdc64148d1e8c76c9f97ed0dfd62:

  ARM: dts: rockchip: rename pcfg_pull_default node name on rk3036 (2022-04-11 02:16:33 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts32-2

for you to fetch changes up to 36b1b58523b531f60721d42910e4d6fe447c90d5:

  ARM: dts: rockchip: add clocks property to cru node rk3228 (2022-05-17 21:08:20 +0200)

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



