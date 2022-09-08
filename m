Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579CBC6FA89
	for <soc@archiver.kernel.org>; Thu,  8 Sep 2022 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12EE5C433B5; Thu,  8 Sep 2022 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1847C433D7
	for <soc@kernel.org>; Thu,  8 Sep 2022 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662652215;
	bh=iOxt9uribu1LeIbtDveg1lqYHahIeU6pEk75lA5FDgw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=e7pGpTKokmwYNA+AI8c8MAqanwUQCQ2gT/L+uS+8SpPsvfFgxQ801zKNgThxxMvDu
	 OHcWqL/YhJt2vEBN70z4g65hasY0F9R76Y87YIQxaAnDVLIvt68YXh9KmxTucve57W
	 WknxI8nuDKC/mNwhMrcqWkqrbs4OeC75COeKieMSC9norsky3uA3eIdGqyUFXOHrvI
	 rcQfSlpDnrnJHWM/LXKF9tjiIwztgrD9aROdn/xFKcgp/ArlleCxfGHHp8+sbDAeOM
	 tXnhcyNOAetAnRHLIWwsdyw9Kl4Wj3cdVKUG86Z/ic/rEhgk2QCR04od7WzPRPS2VH
	 SDAQTmiXXlAdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2C69E1CABD;
	Thu,  8 Sep 2022 15:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166265221469.8789.9277467620434243289.git-patchwork-summary@kernel.org>
Date: Thu, 08 Sep 2022 15:50:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.0
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=672141
  Lore link: https://lore.kernel.org/r/20220829174435.207911-1-sudeep.holla@arm.com

Patch: [v2] ARM: dts: fix Moxa SDIO 'compatible', remove 'sdhci' misnomer
  Submitter: Sergei Antonov <saproj@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=674963
  Lore link: https://lore.kernel.org/r/20220907175341.1477383-1-saproj@gmail.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


