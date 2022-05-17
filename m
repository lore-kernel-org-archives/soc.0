Return-Path: <SRS0=LCQ7=VZ=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683DDC433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 19:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DD1FC34117; Tue, 17 May 2022 19:35:12 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C9E5C385B8;
	Tue, 17 May 2022 19:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C9E5C385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from wf0416.dip.tu-dresden.de ([141.76.181.160] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nr2yK-0004D1-My; Tue, 17 May 2022 21:35:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 5.19 #2
Date: Tue, 17 May 2022 21:35:07 +0200
Message-ID: <6613768.ejJDZkT8p0@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

some additional things turned up (fixes) or got ready since the first round
of pull requests for drivers and both flavors of devicetrees.

So depending on the schedule it would be nice to have them still in 5.19.
But if it's to late for some, that's also no problem and I would then simply
move them to 5.20.

All new tags (here + following mails) of course go on top of the
previous tags.

So if timing allow, please pull.

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



