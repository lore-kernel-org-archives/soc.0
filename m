Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1A2C433F5
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 21:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5FE0C385AF; Fri,  6 May 2022 21:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0E52C385B0
	for <soc@kernel.org>; Fri,  6 May 2022 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651871422;
	bh=GNDV4rsfESJXUJI7DTU5SvGLUNSqmZgwwUJOYo06fYo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=f4MXZU2t1XhVtM3tOnBWMzODclVpfT/F3cmxdd9AkLX+6s6JASXQVShIqFKo+qrL9
	 OGDRXj3NgNryv6LYiUaQiqoHE9Qx+q6K4G5zpiJj/qe8NRfHP4R8rh43qHtKL+IV6n
	 C7FX02cHLbGuXiqYJ0S0LSXi4IT8Nltg8SbXIEY96CtcdwuuGqhBEXYQbdULrCdatm
	 guh1dV0V7yAlYxptfoGfjCMh8Y/8vzdxWsCNDM4SesjD2L6qNZhD9+HRtwWxIjRubr
	 lCXfkzdBg6xbbI9GQ408OQcbtplratiiERNbdDXUnYMI9CvWp7PdJtEMwzzX8uF74S
	 fHu/TTQAi++DA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9977DEAC081;
	Fri,  6 May 2022 21:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165187142254.4183.8380427956733373878.git-patchwork-summary@kernel.org>
Date: Fri, 06 May 2022 21:10:22 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/6] ARM: tegra: Core changes for v5.19-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639153
  Lore link: https://lore.kernel.org/r/20220506143005.3916655-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] ARM: tegra: Core changes for v5.19-rc1
             [GIT,PULL,2/6] soc/tegra: Changes for v5.19-rc1
             [GIT,PULL,3/6] dt-bindings: Changes for v5.19-rc1
             [GIT,PULL,4/6] ARM: tegra: Default configuration fixes for v5.18
             [GIT,PULL,5/6] arm64: tegra: Device tree changes for v5.19-rc1
             [GIT,PULL,6/6] arm64: tegra: Default configuration updates for v5.19-rc1

Series: Renesas SoC updates for v5.19 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639056
  Lore link: https://lore.kernel.org/r/cover.1651828600.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/5] Renesas ARM defconfig updates for v5.19 (take two)
             [GIT,PULL,2/5] Renesas ARM DT updates for v5.19 (take two)
             [GIT,PULL,3/5] Renesas ARM SoC updates for v5.19
             [GIT,PULL,4/5] Renesas driver updates for v5.19 (take two)
             [GIT,PULL,5/5] Renesas DT binding updates for v5.19 (take two)

Patch: [GIT,PULL] ARM: at91: defconfig for 5.19
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639035
  Lore link: https://lore.kernel.org/r/20220506085425.58270-1-nicolas.ferre@microchip.com

Series: [GIT,PULL,1/6] Broadcom defconfig changes for 5.19
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638454
  Lore link: https://lore.kernel.org/r/20220504210942.1838248-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/6] Broadcom defconfig changes for 5.19
             [GIT,PULL,5/6] Broadcom maintainers changes for 5.19

Patch: [GIT,PULL] TEE Cleanup for v5.19
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639006
  Lore link: https://lore.kernel.org/r/20220506070328.GA1344495@jade


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


