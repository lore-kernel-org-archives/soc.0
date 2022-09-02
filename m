Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D23AC54EE9
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6597FC43470; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50957C433C1
	for <soc@kernel.org>; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116424;
	bh=xCaCaP4KiNbu7hZgApEHa3yZ2UdDHl0v/arbCdCWg3Q=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Th6PYjxTnQeCifveyfCbYP9AxPpTxY+0PXq3CG1v/MydsZqbjCLiopCcvmEQqsMUF
	 7oha28K2GBCCQtVvu6SNbdRUdLkjWcsiDA5U5YE+78vMHMItXROxJVojbxfgozcQJy
	 EYISS+kpaydYRY5Ao43ARdZ9xaw8r7cNn9JJnaeS7rdxIW2gRCdyrL5sAQU9YogAy8
	 o0WFbwFp/QI+PWhj4Megpr/YNCSTVFloImAyhuKoBf9bfqnoJFJFfNDwAva5pOqXoO
	 4UlS2sQ+u//Pg9dkQQdQCSho133d3pYcoFREYhzjf26Cm2U/CXWg0jPnVbxknIu2Eu
	 P1xb4EA/v5PGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3E867C4166F;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211642425.12856.10610952917601709636.git-patchwork-summary@kernel.org>
Date: Fri, 02 Sep 2022 11:00:24 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm64: Kconfig.platforms: Group vendors together
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=672137
  Lore link: https://lore.kernel.org/r/20220829173830.3567047-1-f.fainelli@gmail.com
    Patches: [v2,1/2] arm64: Kconfig.platforms: Re-organized Broadcom menu
             [v2,2/2] arm64: Kconfig.platforms: Group NXP platforms together

Patch: [GIT,PULL] Renesas fixes for v6.0
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=673573
  Lore link: https://lore.kernel.org/r/ab2866f12ca18747413ba41409231d44e0c6149b.1662111547.git.geert+renesas@glider.be

Series: Renesas SoC updates for v6.1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=673565
  Lore link: https://lore.kernel.org/r/cover.1662111124.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.1
             [GIT,PULL,2/4] Renesas ARM DT updates for v6.1
             [GIT,PULL,3/4] Renesas driver updates for v6.1
             [GIT,PULL,4/4] Renesas DT binding updates for v6.1

Patch: [GIT,PULL] arm64: dts: juno: fixes for v6.0-rc1
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=672140
  Lore link: https://lore.kernel.org/r/20220829174420.207880-1-sudeep.holla@arm.com

Series: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.0
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=672208
  Lore link: https://lore.kernel.org/r/20220829225103.753223-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.0
             [GIT,PULL,2/2] Broadcom drivers fixes for 6.0


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


