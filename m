Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BB7C433F5
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 14:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 981A7C36AE7; Thu, 16 Dec 2021 14:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82314C36AE5
	for <soc@kernel.org>; Thu, 16 Dec 2021 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639664409;
	bh=6eXPChONrRjf7SWWBLX1jGem19FFr6TvP8/5e+h+74k=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=QsoYdKEicfQvoCSSb5evzBhZAlNNCWhicwCvV44T95Pjw4zbcNAG/Aau/2DZClLHy
	 Wxrmz2acWvgqmYfP084EdN5jwV1b79XZKB0nfyXWK9dukspd1LPjmxX2sCpRbBU0NZ
	 STM35j1qLtyrxQVZUC7nuHatPxiBiEOJFZ47ByH++/+dVQvJqow56/IMSSoPBAOQkU
	 XeaCBTfSAckjGwHRcqC6nbt7wEFqb/FocokmGyg0xL1P2z4K4g3/Ypoml49EtGtdfL
	 LVTqgu9H8WUZPNFzvSShjd1tXO/Er/CWhNVtW1rLT0Y9RQnevooMXckQ4CTf9+XbIX
	 0peUxGuX/dizA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5A684609FE;
	Thu, 16 Dec 2021 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163966440927.28413.12278402500289877340.git-patchwork-summary@kernel.org>
Date: Thu, 16 Dec 2021 14:20:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] soc/tegra: Fixes for v5.16-rc6
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596091
  Lore link: https://lore.kernel.org/r/20211215162618.3568474-1-thierry.reding@gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


