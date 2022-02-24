Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A043C433F5
	for <soc@archiver.kernel.org>; Thu, 24 Feb 2022 22:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3128C340F1; Thu, 24 Feb 2022 22:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB9A7C340E9
	for <soc@kernel.org>; Thu, 24 Feb 2022 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645740024;
	bh=c3R60h+yO3yR9RkJgTVBj19CzoSUhG5V8N/rzL58sWA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=MOGi6XE6/ZumsKTKXgkfXt7Qan4VoDpwl0ISO/vp/fllFHmZLlcQ8tlKZYxHqZN6T
	 aaWklSa6R5rfn40ZR1mcGOJkaWOT2GewDeBSE95Tags3pdZX2FTADpswsPSUYoLOwd
	 wUguYg03y2MRJDIj3wVBVK9MyCzO1EGlLUO9OQxGJlWwrJyQtvvKVhqg/YRcJmbl6i
	 yDlX8PCX1ij1s/I65zGAWI92dGqly/pBm0+xhWOuiO2OIFr55gXI/Gpj9Px+bHPFGb
	 ig6O8fIKvNDw0e8QqgH3FOg/zHE6XxY9IuVklzzCG51sPpuLQWxWB2FRPb4o9OR3cx
	 oPuht8CE6Kfsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A660CE6D453;
	Thu, 24 Feb 2022 22:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164574002461.25177.12590142400985407549.git-patchwork-summary@kernel.org>
Date: Thu, 24 Feb 2022 22:00:24 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 5.17
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=616682
  Lore link: https://lore.kernel.org/r/1973741.CViHJPHrxy@phil

Patch: [GIT,PULL] i.MX fixes for 5.17, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=616157
  Lore link: https://lore.kernel.org/r/20220221062921.GO2249@dragon

Patch: [GIT,PULL] ARM: tegra: Fixes for v5.17-rc6
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617227
  Lore link: https://lore.kernel.org/r/20220223162209.293722-1-thierry.reding@gmail.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


