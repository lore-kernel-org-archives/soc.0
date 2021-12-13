Return-Path: <SRS0=gSCk=Q6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9413FC433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 10:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81947C34612; Mon, 13 Dec 2021 10:05:54 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40C38C34601;
	Mon, 13 Dec 2021 10:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40C38C34601
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from p5b127e39.dip0.t-ipconnect.de ([91.18.126.57] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1mwiDO-0000rY-Gs; Mon, 13 Dec 2021 11:05:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip soc fix for 5.16
Date: Mon, 13 Dec 2021 11:05:51 +0100
Message-ID: <1827929.9bfCS3lLB7@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-socfixes1

for you to fetch changes up to 423e85e97aaf69e5198bbec6811e3825c8b5019a:

  ARM: rockchip: Use memcpy_toio instead of memcpy on smp bring-up (2021-11-21 18:24:31 +0100)

----------------------------------------------------------------
Prevent panic with FORTIFY_SOURCE in smp bringup.

----------------------------------------------------------------
Ivan T. Ivanov (1):
      ARM: rockchip: Use memcpy_toio instead of memcpy on smp bring-up

 arch/arm/mach-rockchip/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



