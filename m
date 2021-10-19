Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9164C433F5
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9100061038; Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7786F60FDA
	for <soc@kernel.org>; Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634682014;
	bh=v9KEnOdN30dwLvAcddX2DTe+WJuJdLQEyeV5GPHxcCQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=jZDmDLkIXA7qDr7YlRIHWWkADdu133HBsPwaysdmuJI0ZQ7k3zSnw//wtxgNYUwJn
	 DW/v1bAngu0+RMeHh2iISD6U+Ekf0ukpArqt4JwYV6vmVuz9Pe0wMVGG5lBvFU3SVj
	 E4GAHgAFwm8U1AgYQFdAy17kKEXE33io4BDs5pFN99QBOgUGfXwPR5cZS5Jmyhb8f8
	 f3/U4It7hemFq39ymeaB7S0R90BMMFZSf0wujLDwBF7DBaapu4N2e2/+6YAGHQTo0f
	 lF1FVp9mhB+y6Eonilc3gs8gxFZLC3xjCOoauVxOODnZLiRsGPtjC5ErBJAFiB/Zjm
	 vWhug/RHQ+DYw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 63738609E3;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163468201434.1188.5414661882909195631.git-patchwork-summary@kernel.org>
Date: Tue, 19 Oct 2021 22:20:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.16
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=563813
  Lore link: https://lore.kernel.org/r/6168EB53.60503@hisilicon.com

Patch: [GIT,PULL] Renesas ARM DT updates for v5.16 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=564151
  Lore link: https://lore.kernel.org/r/cover.1634298094.git.geert+renesas@glider.be

Patch: [GIT,PULL] Ux500 DTS updates for v5.16
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=563611
  Lore link: https://lore.kernel.org/r/CACRpkdYf5GwRvG1Gemk4mE+aw6UnAVTY8OudwsVNPQXThHXu6g@mail.gmail.com

Patch: [GIT,PULL] STM32 DT changes for v5.16 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=564371
  Lore link: https://lore.kernel.org/r/9d52c3e2-a3b9-89f3-1896-7cd3560e7010@foss.st.com

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 5.16
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=563841
  Lore link: https://lore.kernel.org/r/CACPK8XdrMzY9tzdof7KpzxKquTo7GcWW4N9Zqwtmmu73C7htXA@mail.gmail.com


Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


