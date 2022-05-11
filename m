Return-Path: <SRS0=5SgQ=VT=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA43C433F5
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 23:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A60CC34114; Wed, 11 May 2022 23:42:27 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4896BC340EE;
	Wed, 11 May 2022 23:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4896BC340EE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1novyK-0006Td-Jn; Thu, 12 May 2022 01:42:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip soc32 changes for 5.19 #1
Date: Thu, 12 May 2022 01:42:24 +0200
Message-ID: <4421093.ElGaqSPkdT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-soc32-1

for you to fetch changes up to 2946aa908bb63539b566fc3ba0b867022787602b:

  ARM: rockchip: fix typos in comments (2022-04-04 10:43:20 +0200)

----------------------------------------------------------------
Comment typo fix.

----------------------------------------------------------------
Julia Lawall (1):
      ARM: rockchip: fix typos in comments

 arch/arm/mach-rockchip/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



