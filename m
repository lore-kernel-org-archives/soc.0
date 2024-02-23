Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E2C54798
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2FFEC43394; Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DA63C433C7
	for <soc@kernel.org>; Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693828;
	bh=82YR/PsiVukwUGlteI6TGLRGlCJOCGjhMyy8P1xEe68=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=jgRVpHAL4VUit4/oNlM/FAmW4jvpdvQWSF90vczD4DZq1sARZSaW1hpJ+mnQavMg/
	 T5jd2C+ZxgOLMXsLc6JeAsJ2IPOt6pTsJZj0q5Vklj0GWPFJSfmG+gd9nf9kPTrEBF
	 JAgBJT9pkU7TlKygUhwdj/iqBwP6htw7u45VUaUNod0bk0DEjAENhNdhGp2xf02eDy
	 is2lrmwfDPhmUYKfnvJk1C/belru41F5yUm4V+pK1hjOGghGzgF+xz1S1KuzmrvQqF
	 iir7m6EfvIPJxswQjgO5oqD6FVL7dL2eCFs0/DOUYK/F3D3iVIY0vRXxEeLfT7SlDh
	 B3eFH2K1HVwFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7D1F7D990CB;
	Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382845.28623.1432765173265542991.git-patchwork-summary@kernel.org>
Date: Fri, 23 Feb 2024 13:10:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

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


