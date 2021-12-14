Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CABC43217
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 566CEC3460A; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 401DBC34606
	for <soc@kernel.org>; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639518011;
	bh=kZvc39TBmvBUZIpTGuflMQe0LFygPY66Sg5nHBvxdfI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ErZ7tF3ZBA1gjXrZUthrYkOybxCB6Q2tqvfLhbPeOZBuI8i+knEnmY3X46xq1j3At
	 kCPOOR/qJbeeF/xOhyDuw/XcdPQlPNWVTaMeN8TvW7xY8PA9Init6szvCXTy7/cO6G
	 yLQNXis0VBLZl8Mn29e/U1ZvxoPOW4gn9D+NtMtTm89fYGyKfVnmGllxkd/XiOgTTc
	 sPyHb7PV7MDLjeaJGrTEFWJGp6ncXS+cZunkjiXUNlUPZfa3AvDoMRrVT48PUjEG8V
	 bMyparcopMiHkhuXo8KV7Clre8xAycEcb3VdKid0QYAkwMPI+tanZHo3U2P3P//HJy
	 i2NpW2WlCE98Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 13EA1609CD;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163951801102.19193.11860400074620514598.git-patchwork-summary@kernel.org>
Date: Tue, 14 Dec 2021 21:40:11 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Apple SoC PMGR driver for 5.17
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=591345
  Lore link: https://lore.kernel.org/r/049f4de9-51be-7be4-1f9a-a59756af88d7@marcan.st

Patch: [GIT,PULL] IXP4xx DTS changes for v5.17
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=595101
  Lore link: https://lore.kernel.org/r/CACRpkdYiWK7TEbZrh4_0WT5obMk=ZSc7AQVUSPXL+-uZ_hsUEA@mail.gmail.com

Patch: ARM: configs: gemini: Activate crypto driver
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=590571
  Lore link: https://lore.kernel.org/r/20211206011158.4180141-1-linus.walleij@linaro.org

Patch: [GIT,PULL] OP-TEE add async notifications for v5.17
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=594695
  Lore link: https://lore.kernel.org/r/20211213102359.GA1638682@jade

Patch: [GIT,PULL] arm64: zynqmp: Xilinx SoC changes for v5.17
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=592269
  Lore link: https://lore.kernel.org/r/48dec441-2c1f-73a0-3e6c-aa0d7be5ba26@monstr.eu


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


