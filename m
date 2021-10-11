Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1402C433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 22:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7E58460F3A; Mon, 11 Oct 2021 22:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6850760F11
	for <soc@kernel.org>; Mon, 11 Oct 2021 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633992607;
	bh=ePr9COCusRPwbMXRRlPbIpzmyyg3x4yvtKatd1SQnd0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=R45O1u3IpG/fvPQlZhvt9eGVVq1D2GSSE1HMSvQUiI+OeRIQeBeEwDIQ5bhk/+WhK
	 Ro1ZKlAx8EzBdyJMsTkYdTt+bti7YnxOZaCS053AaZOPFdyqgMjIXubrPzuRLuQ8gy
	 e6JNp1HMw1HFpGkvqnwLULCbe5JICACpP1mt20R18Qdg2aC4TJT2WvT2W9yu5JiUgg
	 vNztOs0ObhMfDu6l9E8FLqgxlAziKOngEI7zu2YVqSAZSY+FgWsXgQS+5XfZdLuqWZ
	 Qk/q0uiMYdY3FskT3Tt91RiPPxbeYZGZP3VAt5yZgt2DWm60+KQ1x36lUmGgyQuT1T
	 YiNfqScAvvznw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5ABB5608FC;
	Mon, 11 Oct 2021 22:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163399260730.29188.7524713960186741473.git-patchwork-summary@kernel.org>
Date: Mon, 11 Oct 2021 22:50:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: at91: soc for 5.16
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=561087
  Lore link: https://lore.kernel.org/r/20211011124650.17218-1-nicolas.ferre@microchip.com


Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


