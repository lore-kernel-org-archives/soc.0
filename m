Return-Path: <SRS0=b27X=E4=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36B5C5519F
	for <soc@archiver.kernel.org>; Sun, 22 Nov 2020 13:33:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BF5A52076C; Sun, 22 Nov 2020 13:33:12 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC8E20758;
	Sun, 22 Nov 2020 13:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC8E20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=heiko@sntech.de
Received: from p508fd741.dip0.t-ipconnect.de ([80.143.215.65] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1kgpUJ-0000rh-LB; Sun, 22 Nov 2020 14:33:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 5.10
Date: Sun, 22 Nov 2020 14:33:05 +0100
Message-ID: <11641389.O9o76ZdvQC@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below some Rockchip devicetree fixes for the 5.10 cycle.
Please pull!

Thanks
Heiko

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.10-rockchip-dtsfixes1

for you to fetch changes up to 7327c8b98e2e14c47021eea14d1ab268086a6408:

  arm64: dts: rockchip: Reorder LED triggers from mmc devices on rk3399-roc-pc. (2020-11-08 01:34:53 +0100)

----------------------------------------------------------------
Fixed ordering for MMC devices on rk3399, due to a mmc change jumbling
all ordering, a fix to make the Odroig Go Advance actually power down
and using the correct clock name on the NanoPi R2S.

----------------------------------------------------------------
David Bauer (1):
      arm64: dts: rockchip: fix NanoPi R2S GMAC clock name

Maciej Matuszczyk (1):
      arm64: dts: rockchip: Remove system-power-controller from pmic on Odroid Go Advance

Markus Reichl (2):
      arm64: dts: rockchip: Assign a fixed index to mmc devices on rk3399 boards.
      arm64: dts: rockchip: Reorder LED triggers from mmc devices on rk3399-roc-pc.

 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 1 -
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 3 +++
 4 files changed, 6 insertions(+), 4 deletions(-)



