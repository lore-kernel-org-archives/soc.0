Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33683C41513
	for <soc@archiver.kernel.org>; Thu,  2 May 2024 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E276C4AF1A; Thu,  2 May 2024 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7879C4AF14
	for <soc@kernel.org>; Thu,  2 May 2024 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714659037;
	bh=kdlmA+ZDuanESy5P1UYJE5mPG8DoENgDNNvtQJg8PxY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Nl+x0efkK6rHmhEg1crhnr9IikF0FQiXZgyeaW2+s+sfpFi4GgVJ/dH0tVDu8CpWe
	 bCG2ko4zH5WTdCW6NobVwOJmNbwBqGYBqdtQNVsfkTqQPjYe1qkFDwycBgFByM82rl
	 fQnk5ncueFmqRPFPpXP0Im5N708cnJvl6YK6x0UKzc4jonRJkQ0izwbXAyyM0tmrc3
	 lfG7UEKITzePfvzHQ1MELSnfKyBj1mGyobmPyVjDYiKVBqXdmdAHVl70NjE7FDAqOT
	 iAWH9qepBUM3wE5i3mRsuspbLWsT4kMHEsukhMJUtYOweU4BZF7ObpIn2JpX/rk8sT
	 oKYEoNN6f/pYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C7A5CC43443;
	Thu,  2 May 2024 14:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171465903774.21409.6377949975797719694.git-patchwork-summary@kernel.org>
Date: Thu, 02 May 2024 14:10:37 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: arm64: dts: Add/fix /memory node unit-addresses
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=849450
  Lore link: https://lore.kernel.org/r/20240430191856.874600-2-robh@kernel.org

Series: [GIT,PULL,1/3] soc: ti: Driver updates for v6.7
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=849636
  Lore link: https://lore.kernel.org/r/20240501124300.i5jzeugdlrlnfg22@undrafted
    Patches: [GIT,PULL,1/3] soc: ti: Driver updates for v6.7
             [GIT,PULL,2/3] ARM: dts: ti: keystone: Updates for v6.9
             [GIT,PULL,3/3] arm64: dts: TI K3 updates for v6.10

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.10
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=849524
  Lore link: https://lore.kernel.org/r/MA0P287MB2822CA2DE757787D6EA3B1F8FE192@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


