Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85AEC433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7681064EB9; Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 602F564D9D
	for <soc@kernel.org>; Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612888861;
	bh=trigoyOzFUYsNKjoegzaBQI43glWFjdLTkf6r3G0rN8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=psQ0F23I/xjh+rDbrHRIXM/9MOA90pF+LuZHLBYW1J4OfoZsxUhCr21ZiYELaHgXu
	 MFNVOQUga7xsRreFOfdgRI7cogRyhyQJP3ECGt8tJjb7YiUCYYMD/pk/ffa8yq5sDm
	 AX33SjzmQlHEO5+FY1gi9r3Kv7D1MLMMU4GFXCgraDedhi3NbB9/rJQD50xZkUNL7x
	 0BvnjKWBKxyg3W5DgBkNU9F950W2E+rHUEvcs2NaaZHdXaeEf/iT00XvicnDJYu+a5
	 YIjM9BEcYRo+ObUsYdw91JNfT5w3EsQ2eCDLuVNpGg/12z14YYEvy0U2jW15yGteU1
	 Tdyh+lS3ZdXPA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5BF72609E2;
	Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161288886137.29773.15892652051917895096.git-patchwork-summary@kernel.org>
Date: Tue, 09 Feb 2021 16:41:01 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] OP-TEE I2C simplification for v5.12
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=429939
  Lore link: https://lore.kernel.org/r/20210208125853.GA288348@jade
Patch: [GIT,PULL] Defconfig changes for omaps for v5.12
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=427613
  Lore link: https://lore.kernel.org/r/pull-1612421637-483551@atomide.com
Patch: [GIT,PULL] ARM: at91: defconfig for 5.12 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=429915
  Lore link: https://lore.kernel.org/r/20210208115753.54730-1-nicolas.ferre@microchip.com

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


