Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECE6C433EF
	for <soc@archiver.kernel.org>; Sat, 16 Jul 2022 21:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE4B1C341C6; Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C61BBC34115
	for <soc@kernel.org>; Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658006413;
	bh=ST8C23rEpOrT+bC1DlsQuPg08zx1L1NwJLh8xHsK4bM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Fvz/8tGlMLaZHHHhhMdoIKc/mIAV7nzI8IquZQAq9qHqWtKbpM5s4gD42RQVzvFfF
	 YBkJP4QPr1/z6cnJczKY1KNzb2lah2vKdwvsGYPkiIKxVWY5p4j4WSCC7zDUFRXDT6
	 ux2qnaZskMHgQlFaDAzaLGUJQgSUXTnX1w0H9BEgRu0Pj1Krwyo+bcZRnAelFGyeAb
	 0eXEtNkn8Ye1l9VL+2Zy5TKvk+kKgNTERKjQFH03tyf+hLz2R3xn5FTZQfXc/l4nZ1
	 /dbTX6rKj5EhWiEcQ33j3G4Ymeaz9TTKLq8iMoKp9G3v2dyD9Wlo7m6OCbY60jisVC
	 f7dNNUterQFdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9FF7FE45224;
	Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165800641360.26933.17899149074558521441.git-patchwork-summary@kernel.org>
Date: Sat, 16 Jul 2022 21:20:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Broadcom ARM SoC changes for 5.20 part 2
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=660238
  Lore link: https://lore.kernel.org/r/20220715221642.297536-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/3] Broadcom devicetree changes for 5.20 part 2
             [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 5.20 part 2
             [GIT,PULL,3/3] Broadcom soc changes for 5.20 part 2

Patch: [GIT,PULL] Delete two DaVinci boards
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658423
  Lore link: https://lore.kernel.org/r/CACRpkdZh8GdZzGsJ=h_E8RPgAHX8HqXs1871w95TVZD0SXHbkA@mail.gmail.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


