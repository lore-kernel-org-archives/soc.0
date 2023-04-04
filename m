Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2191BC77B60
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D47CCC4339E; Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF2FDC4339B
	for <soc@kernel.org>; Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619283;
	bh=nem5DPN6GzkbVGCOnLjKksgrnt8LchPUy5hNf0bITzM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ElxAOKPRu9j6E8+hlIjGv8JLjP8T8I8yoKyoCyLaUR7w68hEsBdjjHam2dGZ703GD
	 z9k/GElPwi0nD6xniA4l0v/WOPiWxH2fbT6JkVaIsUa1w3aJu2Sm+9xziFO4VJiwuh
	 267nwMpGnM/uOu8MwIiPHiWh6oyH9cEmYBmdBzOUhT2JYQD8MIgXog4XIoY1LsFE25
	 xnFJrnjgS9NSzJYhdxyXEV41NDkQqDaDe2vAALqHg4jTw089Y0qKqHS9gnPXYvItWt
	 HrRLGshD+X0aYlzf4SYcid7NSCDNx7XL/1MPj/1AFgu7xOKbXUMKTmPfCs8dp2tNGt
	 X/1YblspC4C/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9DB08C41671;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928353.17322.6453757351236056953.git-patchwork-summary@kernel.org>
Date: Tue, 04 Apr 2023 14:41:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] amlogic Drivers updates for v6.4
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=736735
  Lore link: https://lore.kernel.org/r/aebef87f-e0a3-17dd-12b7-7231ca6b0923@linaro.org

Patch: [GIT,PULL] ARM: at91: dt for 6.4
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=735848
  Lore link: https://lore.kernel.org/r/20230331142751.41522-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] OP-TEE per-cpu irq for v6.4.
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=736676
  Lore link: https://lore.kernel.org/r/20230404062727.GA2765560@rayden

Patch: [GIT,PULL] Clean-up for omaps for v6.4
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=735391
  Lore link: https://lore.kernel.org/r/pull-1680180293-92168@atomide.com

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.4
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=736744
  Lore link: https://lore.kernel.org/r/1b955bb7-1a35-8d67-beb6-dd289533ff6f@linaro.org

Patch: [GIT,PULL] amlogic ARM DT updates for v6.4
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=736743
  Lore link: https://lore.kernel.org/r/eb1f32f8-822d-9cfc-fca6-9e044bf4a5ab@linaro.org

Patch: [GIT,PULL] memory: drivers for v6.4
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=736455
  Lore link: https://lore.kernel.org/r/20230403161427.328128-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Devicetree overlays for omaps for v6.4
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=735394
  Lore link: https://lore.kernel.org/r/pull-1680180448-508978@atomide.com

Series: ARM: oxnas support removal
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=736259
  Lore link: https://lore.kernel.org/r/20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org
    Patches: [RFC,v2,1/4] ARM: dts: oxnas: remove obsolete device tree files
             [RFC,v2,2/4] ARM: oxnas: remove OXNAS support
             [RFC,v2,3/4] ARM: configs: remove oxnas_v6_defconfig
             [RFC,v2,4/4] dt-bindings: arm: oxnas: remove obsolete bindings

Patch: [GIT,PULL] Devicetree changes for omaps for v6.4
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=735393
  Lore link: https://lore.kernel.org/r/pull-1680180389-756753@atomide.com

Series: Renesas SoC updates for v6.4
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=734067
  Lore link: https://lore.kernel.org/r/cover.1679907055.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.4
             [GIT,PULL,2/4] Renesas driver updates for v6.4
             [GIT,PULL,3/4] Renesas DT binding updates for v6.4
             [GIT,PULL,4/4] Renesas DTS updates for v6.4

Patch: [GIT,PULL] Clean-up for omap1 for v6.4
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=735396
  Lore link: https://lore.kernel.org/r/pull-1680180485-415954@atomide.com

Patch: [GIT,PULL] Driver clean-up for ti-sysc for v6.4
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=735392
  Lore link: https://lore.kernel.org/r/pull-1680180355-69164@atomide.com


Total patches: 19

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


