Return-Path: <SRS0=FE/q=TV=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCF8C433EF
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 01:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69E07C340F6; Thu, 10 Mar 2022 01:38:53 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA86FC340EF;
	Thu, 10 Mar 2022 01:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA86FC340EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nS7lS-0000PH-Po; Thu, 10 Mar 2022 02:38:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.18 #1
Date: Thu, 10 Mar 2022 02:38:50 +0100
Message-ID: <3788968.RB9BLzCXGK@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 5a68ce0a7b89a7005a71d406435a45a24c7e86da:

  ARM: dts: rockchip: remove status from rk3288 crypto node (2022-02-15 08:59:53 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-dts32-2

for you to fetch changes up to c042639a70ed00ab2138f507ae1d6fa57c66ce11:

  ARM: dts: rockchip: Update regulator name for PX3 (2022-03-05 18:17:08 +0100)

----------------------------------------------------------------
Some fixes for rk8xx pmics to make them follow
the dt-binding better.

----------------------------------------------------------------
Chris Morgan (2):
      ARM: dts: rockchip: Add #clock-cells value for rk805
      ARM: dts: rockchip: Update regulator name for PX3

 arch/arm/boot/dts/rk3188-px3-evb.dts  | 2 +-
 arch/arm/boot/dts/rv1108-elgin-r1.dts | 1 +
 arch/arm/boot/dts/rv1108-evb.dts      | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)



