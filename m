Return-Path: <SRS0=K/Pp=NO=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17771C4338F
	for <soc@archiver.kernel.org>; Mon, 23 Aug 2021 18:45:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E72F6613AD; Mon, 23 Aug 2021 18:45:05 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87046610C9;
	Mon, 23 Aug 2021 18:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87046610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from dynamic-046-114-139-102.46.114.pool.telefonica.de ([46.114.139.102] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1mIEwR-0002Lr-VI; Mon, 23 Aug 2021 20:45:04 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.15 - #2
Date: Mon, 23 Aug 2021 20:45:00 +0200
Message-ID: <6569432.ejJDZkT8p0@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

another late (and now final addition) hopefully for 5.15.
This includes some dts fixes for changes from previous pull request.

So if it's still suitable, please pull.

Thanks
Heiko


The following changes since commit 9a35fd01f4abc3974e12539448038307acf27f16:

  arm64: dts: rockchip: add RK3399 Gru gpio-line-names (2021-08-21 18:18:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-dts64-2

for you to fetch changes up to b12a5946f5ea7a54b8b983c42f0812152e3122de:

  arm64: dts: rockchip: add saradc to rk3568-evb1-v10 (2021-08-23 19:56:32 +0200)

----------------------------------------------------------------
Some fixes and the tiny addition of the saradc to the rk3568-evb

----------------------------------------------------------------
Alex Bee (2):
      arm64: dts: rockchip: Re-add interrupt-names for RK3399's vpu
      arm64: dts: rockchip: Fix GPU register width for RK3328

Michael Riesch (2):
      arm64: dts: rockchip: add missing rockchip,grf property to rk356x
      arm64: dts: rockchip: add saradc to rk3568-evb1-v10

 arch/arm64/boot/dts/rockchip/rk3328.dtsi         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi         | 1 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts | 5 +++++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi         | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)



