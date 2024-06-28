Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11586C30658
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA9EAC4AF0B; Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D420FC2BD10
	for <soc@kernel.org>; Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719609649;
	bh=7tfq3/RtXf5hkxifLnfXolXUej+VCSSjhvvyWxwrAB4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=k/J9O/Fmozw80zqNukZiP2tg08NyK8QLXSk3yVATsABQRg1MghiMpyaW0GYl0L0d/
	 V3dpjrAcw3dy5m1NrMR82NcPnKVNDr5oOcK+ykQeT/Xz3AyWNs3JmN6iMlV1eunVBv
	 ZecdaFLY4U43AJcZpnOKphmzUqRHlIx/xO27/QMqiP2Au35Jd8+nOHCJQRx4TnA+VN
	 Uvy+61xUGmGW9jWcu084xXQ7xSlUk5WTIM1KIfIdo484vVTsKFh5YqCw7KrGfmcmsL
	 s6bYNEM5xUsHUl4w2MvSTycUHD/It/EOfo5x3t2c87Nk1zDjbvsVbaIJs0bPf1mDFR
	 YwPV8kzZ+ww3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6756C433A2;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171960964968.14447.17017898898311972129.git-patchwork-summary@kernel.org>
Date: Fri, 28 Jun 2024 21:20:49 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.11
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866503
  Lore link: https://lore.kernel.org/r/20240628093801.126013-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.11
             [GIT,PULL,2/3] MediaTek ARM32 DTS updates for v6.11
             [GIT,PULL,3/3] MediaTek driver updates for v6.11

Patch: [GIT,PULL] Rockchip dts64 changes for 6.11 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866611
  Lore link: https://lore.kernel.org/r/4901395.GXAFRqVoOG@diego

Patch: [GIT,PULL] ARM: vexpress: Updates for v6.11
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=863764
  Lore link: https://lore.kernel.org/r/20240620093924.375244-4-sudeep.holla@arm.com

Series: Renesas SoC updates for v6.11 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866587
  Lore link: https://lore.kernel.org/r/cover.1719578273.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.11
             [GIT,PULL,2/3] Renesas DT binding updates for v6.11

Patch: MAINTAINERS: Assign MTK Airoha to MediaTek maintainers
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866510
  Lore link: https://lore.kernel.org/r/20240628095044.132276-1-angelogioacchino.delregno@collabora.com

Patch: [GIT,PULL] Rockchip dts32 changes for 6.11 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866612
  Lore link: https://lore.kernel.org/r/2187283.irdbgypaU6@diego

Series: armada-370 irqchip DT changes
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=864953
  Lore link: https://lore.kernel.org/r/20240624145355.8034-1-kabel@kernel.org
    Patches: [v2,1/2] ARM: dts: armada-{370-xp,375,38x,39x}: Drop #size-cells from mpic node
             [v2,2/2] dt-bindings: interrupt-controller: convert marvell,mpic binding to YAML

Patch: arm: dts: arm: Drop redundant fixed-factor clocks
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866284
  Lore link: https://lore.kernel.org/r/20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


