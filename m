Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591F5C433F5
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BA4DC385AC; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06B54C385A1
	for <soc@kernel.org>; Thu, 14 Apr 2022 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=YAtVWFWIilE+vBHB2OPF3H7W97FILqdAY/60FC81E10=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=XgsWzlMTaQ8cUC/RCww+FTGMK3R6EN8+LXHPvGbToZUJX02zbyVaiirTgDn6lUeop
	 9G0vCaWqN1hGRqLXZsXnFqBzJB/HJTZZ6R/CUFiuRE4WM+0MdpGoPfRKFV1c7csMmG
	 09pqPdPzMq9qi483aPKhB4NcczYHjeGNSWVhTMREfLRzOaOe7Vzqbx7RPknEJ76W6u
	 w/UJz6eaiAy81I4EK22XzfeuNRSHqOOIbOdTzDGSUTQYKnOijqWpCPHtRcVSkhtaoL
	 YxorcoG6O0wlhn4nqPH/hTpFJ/3P7DHjcSi+CYOG+kSQEAIXAU5eLHEWkiHyPPnTyd
	 3Gfv6dZPaWCPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D61F9E8DBD4;
	Thu, 14 Apr 2022 21:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061479.10394.9513819925828230117.git-patchwork-summary@kernel.org>
Date: Thu, 14 Apr 2022 21:10:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: arm64: dts: qcom/sdm845-shift-axolotl: Fix boolean properties with values
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630208
  Lore link: https://lore.kernel.org/r/20220407225254.2178644-1-robh@kernel.org

Patch: [[GIT,PULL] OP-TEE fix for v5.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=631716
  Lore link: https://lore.kernel.org/r/20220413052001.GA49798@jade

Patch: [GIT,PULL] i.MX fixes for 5.18
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630877
  Lore link: https://lore.kernel.org/r/20220411024301.GH129381@dragon

Patch: [GIT,PULL] Ux500 defconfig updates for v5.18
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630195
  Lore link: https://lore.kernel.org/r/CACRpkdY+_Go4XNzOh+Rvc24QBnUud2k-S7VQuaH5d-j71_dJog@mail.gmail.com

Patch: ARM: dts: align SPI NOR node name with dtschema
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630044
  Lore link: https://lore.kernel.org/r/20220407143027.294678-1-krzysztof.kozlowski@linaro.org

Patch: ARM: config: Update Gemini defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630826
  Lore link: https://lore.kernel.org/r/20220410202837.2667333-1-linus.walleij@linaro.org

Patch: ARM: dts: Fix more boolean properties with values
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630207
  Lore link: https://lore.kernel.org/r/20220407225107.2175958-1-robh@kernel.org

Patch: [GIT,PULL] ARM: at91: fixes for 5.18
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=632321
  Lore link: https://lore.kernel.org/r/20220414143318.26363-1-nicolas.ferre@microchip.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


