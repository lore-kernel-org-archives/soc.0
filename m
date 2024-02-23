Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF06C54E52
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4336C433A6; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDCBDC433F1
	for <soc@kernel.org>; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693829;
	bh=wCv+14AJE9tjFDsNqH6zvTCcdn4Z743OO0CVkD0ZI+c=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=rbcTsBsdrBnWP73dr2ZiUeNrUsZyFEW4GNeI6MskbPMHTUmd64bhvEHQWbqa8xaKl
	 ygZ9Qm2BXC26RbEdxIcPnypoERDg49wT/rU6lbczBJ2rvBG+uoHrV10c9U6MjGP/iV
	 xNES/f0oiGgkWObepFaUJGU/ZFUZnNMzkk0JA69ZcuEOzZuKnhWaTZyvBiliezMDtr
	 lbmzJToKEeh0VSXaiRXIdKE8tXwyOO6e+zGy6VPLW4M1OAIQyt8Ssqho+u3RVwnytv
	 GCu0MWJznUdmy4Jktsy2+cWnsWbR3ELOV/EP86YYPIUjxBLUYcZBw2i3K99PyYR15e
	 0cZ3CZq24ZhsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA4D6D990CB;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382969.28623.1625164224626846517.git-patchwork-summary@kernel.org>
Date: Fri, 23 Feb 2024 13:10:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Renesas fixes for v6.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828618
  Lore link: https://lore.kernel.org/r/cover.1708597150.git.geert+renesas@glider.be

Patch: [GIT,PULL] Microchip firmware driver fixes for v6.8-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828361
  Lore link: https://lore.kernel.org/r/20240221-recognize-dust-4bb575f4e67b@spud

Patch: [GIT,PULL] RISC-V Cache driver fixes for v6.8-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828358
  Lore link: https://lore.kernel.org/r/20240221-keenness-handheld-b930aaa77708@spud

Patch: [GIT,PULL] RISC-V SoC driver fixes for v6.8-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828366
  Lore link: https://lore.kernel.org/r/20240221-irate-outrage-cf7f96f83074@spud

Patch: [GIT,PULL] RISC-V Devicetree fixes for v6.8-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828371
  Lore link: https://lore.kernel.org/r/20240221-foil-glade-09dbf1aa3fe2@spud


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


