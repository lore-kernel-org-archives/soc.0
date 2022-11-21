Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6527AC4332F
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37108C4314E; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 216CAC433C1
	for <soc@kernel.org>; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042286;
	bh=S69umFb68zwLoLWb96Tvd4Srjp/ABRcocHeSyI0KCnk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=t5p9gaOoEBhm9oiuje6Sfkii8BZ6bGrH5HZ7KjcPd7aslEmMoHRyjaCRW66d7EUN1
	 uZhX/mzrhA6qLrqWfZJDzRiIFyvZMD6xev7lvcFT9CcJtWPnfiE2qAAnYYkXUmzr14
	 LoAm3CVjvWbyGJnbeFGg+YN8VzDb6N+YFNHGiGD9LsHvYiwcmk4VbxaoJgN4qnLfH2
	 mlieLid9TeXgVoDFAQ3tis4jGV3J+zeNdadYIw1w5SMNs7kazkiab9yFtu4l0oxG+a
	 npuuVIHQTIChvy9ZyTQOTclnHVBGD7y9MxmbOu9SOBW5wrgnFI3ZelhLCwujDo4Sw3
	 ua3WXj1CdamIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EEE53E270C7;
	Mon, 21 Nov 2022 14:51:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904228590.4359.5771884924865756766.git-patchwork-summary@kernel.org>
Date: Mon, 21 Nov 2022 14:51:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Fix possible memory leak OP-TEE driver for v6.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696906
  Lore link: https://lore.kernel.org/r/Y3d2OuJ60U30OkZe@jade

Patch: [GIT,PULL] Allwinner fixes for 6.1
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697081
  Lore link: https://lore.kernel.org/r/Y3ftpBFk5+fndA4B@jernej-laptop

Patch: [GIT,PULL] i.MX fixes for 6.1, part 3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697226
  Lore link: https://lore.kernel.org/r/20221119073812.GQ16229@T480

Patch: [GIT,PULL] AT91 fixes for 6.1 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696930
  Lore link: https://lore.kernel.org/r/20221118131205.301662-1-claudiu.beznea@microchip.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


