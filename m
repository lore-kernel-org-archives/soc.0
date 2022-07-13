Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EFAC43334
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 21:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FD96C385A9; Wed, 13 Jul 2022 21:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AB45C3411E
	for <soc@kernel.org>; Wed, 13 Jul 2022 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657746019;
	bh=SorXuDDJijNwlbfQuA16xe/Vys33wgSZyV5qQ/qBNvI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=H8J24/TSrkfQAHh3jI0+TazpxbbSORyiKcTzohkWQi8JoZIzXGYIb7E1bbyl4TlZa
	 gdxcpnTd1n7c/3sfbBbh9mg1siT9BW4B98MsB0Ptihu65L93Hnn8U1PLBOkaabnrPK
	 O8W4q9V0a385oUF/EiJbuw4AP50bgWzoc3x0azDo7baNQBrH1MScra+L+8y/rXhhhD
	 WomnVDXPpf1ppy1njV2bZZnvLlyDZUP38UkSWmdO7f4exj0wMCcCJmO5Gbfl2K4U+Q
	 brc6hjBWFKcD89XBe9SIyElwefhkhKvZR+lUo8fMKJJ5JFWlgCX9MRsKWsBbIGcczh
	 4joZ51U62vYYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 284D4E45223;
	Wed, 13 Jul 2022 21:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165774601905.1051.5671120972890796927.git-patchwork-summary@kernel.org>
Date: Wed, 13 Jul 2022 21:00:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 5.19
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=659082
  Lore link: https://lore.kernel.org/r/20220712231222.97850-1-f.fainelli@gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


