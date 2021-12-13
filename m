Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393ACC43217
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BB1EC3460B; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9E85C34607
	for <soc@kernel.org>; Mon, 13 Dec 2021 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405228;
	bh=4mAtnxJeyq58X06MHCOWEYK4w5+ETt1Rmgmpt5hogzI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=p/QrN86i37C+Tc6wCv33C8OT1JrtQ7eTvQBYkWW7ZJ6hr0Nzd/ixoll56YlRlew++
	 JbQdZ69YgG9kkuPhXrUIBfivaVi7wCqAmgSH15r1dpm/t6grx6vtcry9GBiucnTXw0
	 X3E3/JOrx1ieYVe6mKOnejT1+eGN8letFYdh/C+HFnkvbpZtN/FobI6OdVP3pEZOxS
	 nfXPZAPPqYA02Bk+M6BM6VPx66HRNPjg2eXHoTMQAL2vL0uwsMF83vCGVKzbXJBhH7
	 LoKGKjL+FEBF6cUL+mBHjBjwHuIu5RXVCmtN5stUKn+fP+fHYnx+XaPuQlxIJfbXVS
	 hW7Kx6NRB/QWQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C702D6098C;
	Mon, 13 Dec 2021 14:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522876.6863.14879477184827545080.git-patchwork-summary@kernel.org>
Date: Mon, 13 Dec 2021 14:20:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] AMD-TEE fix for v5.16
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=587567
  Lore link: https://lore.kernel.org/r/20211130070351.GA2308099@jade

Patch: [GIT,PULL] ARM: socfpga: fix for v5.16, part 2
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=590059
  Lore link: https://lore.kernel.org/r/20211203181007.3138381-1-dinguyen@kernel.org

Patch: [GIT,PULL] Rockchip dts fixes for 5.16
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=594667
  Lore link: https://lore.kernel.org/r/3072346.MIvVl8DfR5@phil

Patch: [GIT,PULL] firmware: tegra: Fixes for v5.16-rc5
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=591721
  Lore link: https://lore.kernel.org/r/20211207162115.450554-1-thierry.reding@gmail.com

Patch: [GIT,PULL] i.MX fixes for 5.16, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=594025
  Lore link: https://lore.kernel.org/r/20211211015625.GK4216@dragon

Patch: [GIT,PULL] Rockchip soc fix for 5.16
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=594669
  Lore link: https://lore.kernel.org/r/1827929.9bfCS3lLB7@phil

Patch: [GIT,PULL] i.MX fixes for 5.16
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=586295
  Lore link: https://lore.kernel.org/r/20211126100716.GF4216@dragon

Patch: [GIT,PULL] Apple SoC fixes for 5.16
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=591333
  Lore link: https://lore.kernel.org/r/cc9a1a67-3b2d-ae9f-5733-859111eb78c1@marcan.st


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


