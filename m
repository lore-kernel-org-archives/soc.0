Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E117C433EF
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAB5DC34608; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B658AC34604
	for <soc@kernel.org>; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639438242;
	bh=DeXl/mCOd6dBdg+PQcfBPjAqoJZnZsCX3R+3gpN7DBQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=vMr8ZCUjQmp19HV6fNpqKommN96GLfrOLU4qGhIOlL2O02ZE6fFtHKWgB9B0J+e8P
	 qlmI5CZYuSSWDakDSK7IesW49Bwt1hJZUfA2x33I6B7jXjcFio6nDHuObOZjlMXVyp
	 D9ONBmhGs/k3cjES+f2ERUlmdf9N+0FmJeCh3QsSfHu96fb1tepMifytBCxLkSH5sJ
	 A3DOLEzZgbRQ5D0Ts2ro2j/8j9wD5Bk/EkvHUs2EjEefg4qVNTvd78KHTKmmia60nT
	 Az5MVQohnlLThP7Qr70bSPc1VYzjMp31OhiyiLwniWeHfiVHWdZBxnX9zOmhHuQMrU
	 x3qSGCp/hNJJw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 87831609BA;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163943824250.22239.12105066464678037812.git-patchwork-summary@kernel.org>
Date: Mon, 13 Dec 2021 23:30:42 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: at91: dt for 5.17
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=594887
  Lore link: https://lore.kernel.org/r/20211213161451.90786-1-nicolas.ferre@microchip.com

Patch: ARM: dts: gemini: NAS4220-B: fis-index-block with 128 KiB sectors
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=590565
  Lore link: https://lore.kernel.org/r/20211206004334.4169408-1-linus.walleij@linaro.org

Patch: [GIT,PULL] Ux500 DTS updates for v5.17
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=590465
  Lore link: https://lore.kernel.org/r/CACRpkdZuDPLj5Tcxbyd+JGfvBGQ8RuMP9PAsGsZT7pY8KoyOKg@mail.gmail.com

Patch: [GIT,PULL] Apple SoC DT updates for 5.17
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=591339
  Lore link: https://lore.kernel.org/r/e18b476c-7b1f-de73-53a2-0e21fb5cd283@marcan.st

Patch: [GIT,PULL] Rockchip dts64 changes for 5.17 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=594699
  Lore link: https://lore.kernel.org/r/3637342.7akbv5NDAT@phil


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


