Return-Path: <SRS0=/f1H=WD=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AF8C433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 18:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7926FC34113; Fri, 27 May 2022 18:24:21 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91425C34114;
	Fri, 27 May 2022 18:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91425C34114
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nuedE-0005CZ-6Z; Fri, 27 May 2022 20:24:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] Rockchip driver changes for 5.19 #2
Date: Fri, 27 May 2022 20:24:15 +0200
Message-ID: <4541398.Icojqenx9y@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

as discussed with Arnd on IRC today, I was slightly too fast in removing
the tags I deemed to not make it into 5.19-rc1 anymore.

So here again are re-created tags for the fixes-parts of the previous
pull requests.

(drivers, dts32 and dts64)

Thanks
Heiko


The following changes since commit add9f6f30e54b5c07e7a0260cda459ef1d9646b7:

  soc: rockchip: Fix compile-testing SoC drivers (2022-04-30 15:06:14 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-drivers2

for you to fetch changes up to 9b59588d8be91c96bfb0371e912ceb4f16315dbf:

  soc: rockchip: Fix refcount leak in rockchip_grf_init (2022-05-17 10:49:37 +0200)

----------------------------------------------------------------
Refcount leak for a used of-node in the grf-init.

----------------------------------------------------------------
Miaoqian Lin (1):
      soc: rockchip: Fix refcount leak in rockchip_grf_init

 drivers/soc/rockchip/grf.c | 2 ++
 1 file changed, 2 insertions(+)



