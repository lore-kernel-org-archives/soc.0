Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B90C19F53
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4987C4AF18; Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF2AEC2BBFC
	for <soc@kernel.org>; Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484433;
	bh=ExuKkDxCoLOQ4DNtXOTuMJXtUVkN6/zIw19aEAsv3Oc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=oVsMkRoVno3nfOZtDlWq1ygyQNxq/fY7pECYljAAVyJwi0F1x5ueWy5mWMh/dok09
	 uLlTgxMZHWUe+5Mvooy16pxToESY/5afKSXcoD8snRvdH2QlfPUZTZu/hDws4brH/M
	 VZkm9ChCp/lQW0VFA/vDOnvtP+AsLjp+wFXK+NUPlNzHpJPUe/zUlitVeSxxoJX/80
	 O82tzxYIBm+58Oiu2lbjpGl0D4ICjMsHi404Q0m0LFriShiv0mVb8aP8Cy97MY8bql
	 05tnNTA6K95JmAGEHJLYtJUi1Rrn/EN1qfvlkyOKahpPlwrMuNzIMFkR7ac0GFi8gH
	 TzBtGG5wbLspw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6A52C43617;
	Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171448443381.21603.12486703582155756653.git-patchwork-summary@kernel.org>
Date: Tue, 30 Apr 2024 13:40:33 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.10
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=849055
  Lore link: https://lore.kernel.org/r/20240429213703.2327834-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.10
             [GIT,PULL,3/4] Broadcom devicetree-arm64 changes for 6.10
             [GIT,PULL,4/4] Broadcom drivers changes for 6.10

Series: Renesas SoC updates for v6.10
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=843995
  Lore link: https://lore.kernel.org/r/cover.1712915528.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.10

Patch: [GIT,PULL] RISC-V SoC driver fixes for v6.9-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848485
  Lore link: https://lore.kernel.org/r/20240427-unflawed-humorless-690472f9c5a0@spud


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


