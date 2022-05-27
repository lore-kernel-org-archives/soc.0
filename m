Return-Path: <SRS0=/f1H=WD=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF26C433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 18:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 760ACC34113; Fri, 27 May 2022 18:25:20 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76EE1C385A9;
	Fri, 27 May 2022 18:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76EE1C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nueeD-0005DG-Kq; Fri, 27 May 2022 20:25:17 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] Rockchip dts64 changes for 5.19 #2
Date: Fri, 27 May 2022 20:25:16 +0200
Message-ID: <7695907.Sb9uPGUboI@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit bc405bb3eeee4b711830ab569e7f3811b92196ab:

  arm64: dts: rockchip: enable otg/drd operation of usb_host0_xhci in rk356x (2022-05-11 06:09:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts64-2

for you to fetch changes up to cd414d5ac1fdeecf0617737e688a1af00858253a:

  arm64: dts: rockchip: rename Quartz64-A bluetooth gpios (2022-05-27 19:31:24 +0200)

----------------------------------------------------------------
Clock properties for cru nodes to match the yaml-converted bindings
and renaming of Quartz-A bluetooth pin nodename to not conflict with
Yaml constraints.

----------------------------------------------------------------
Johan Jonker (2):
      arm64: dts: rockchip: add clocks property to cru node rk3308
      arm64: dts: rockchip: add clocks property to cru node rk3368

Peter Geis (2):
      arm64: dts: rockchip: add clocks to rk356x cru
      arm64: dts: rockchip: rename Quartz64-A bluetooth gpios

 arch/arm64/boot/dts/rockchip/rk3308.dtsi           | 5 +++--
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           | 2 ++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 4 ++--
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 2 ++
 4 files changed, 9 insertions(+), 4 deletions(-)



