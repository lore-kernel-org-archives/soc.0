Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C148C433ED
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C711961350; Mon, 17 May 2021 20:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AF328610CB
	for <soc@kernel.org>; Mon, 17 May 2021 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621282809;
	bh=m8dXAxod0JuCbHdEN/FJt0xo0mCnsw0YwGwPBlT1wls=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=SW68y7Rk+hheIKE5zH4JbRTeRp3EonobC8oRRj/dKm58zkKD4eMmDKNqp7NxvKe07
	 j+++lRFK8TVz8otYZMKvth8uIlGY00G6n1U5z1jDQgcaEO2aHDX0d+DfBQpeLpVfPr
	 v+19upp19HLqAuUA6rPqJQ2ASB0F4wqw38dn+rJzeUKQGgPEvoPscuBL9tayCUM34T
	 aEFKEJe5xX6US9qFGsw5f0Pzmn47WTJQzcBm06uqsW/u5u+6OTvd87aGKv/9yGsDUV
	 5OStSKJXe+1IAP93TIg4avKcnX22rFVo2doODReR6y+ZH6gpqtApKeguj8yksj5dl3
	 V3ljaUscrxXJA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9BD9A60A0D;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162128280957.19328.9905341874410625137.git-patchwork-summary@kernel.org>
Date: Mon, 17 May 2021 20:20:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.13
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=474415
  Lore link: https://lore.kernel.org/r/20210428093148.flrcowzr2dsj7byz@bogus
Patch: MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary maintainer
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=480667
  Lore link: https://lore.kernel.org/r/20210511190054.26300-1-khilman@baylibre.com
Patch: [GIT,PULL] Renesas ARM DT updates for v5.13 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=473857
  Lore link: https://lore.kernel.org/r/cover.1619522726.git.geert+renesas@glider.be
Patch: [GIT,PULL] AMD-TEE fix for v5.13
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=477245
  Lore link: https://lore.kernel.org/r/20210505110850.GA3434209@jade

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


