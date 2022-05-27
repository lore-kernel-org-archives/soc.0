Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC45C433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF4E1C3411C; Fri, 27 May 2022 14:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4069C385A9
	for <soc@kernel.org>; Fri, 27 May 2022 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653661214;
	bh=A+IKPkRAM9cIk+7+50jVH4eRnA74XvBmXT4RNxRum/o=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=U41Yu4ZJ8cbQD8Gdyy4waNMY5T3fNGO2LwTWV4wI+54p1NE6SlcIJlYN7x2tchvJg
	 3sP8oXKC0jkj4e0kNcW6dMzo+XTWeOIR4kmyIvuzdgyc1Ft2Yp26jOep5lXAmexEiL
	 7s1OZn2HaN2ZZqDcif80aUlIWE+WuqjUn/hQ4ItAQW8M/3un1XKrsweqKlq5RXziQy
	 C90WY8UAfvv7ZFIXypfzZxQs49vigSkDMg3ba24PRNcR+YgQCW5bHgMsWunXSidFS/
	 m69cZKjf30PJ/s4xrE1AWi8QramSGBBN3LpNs+Kgfnbdy8tk6+aU4QhpKcNi8HxpyZ
	 Pr6ih9p8+MG3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AB85FE8DBDA;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165366121465.3919.3789285756906018485.git-patchwork-summary@kernel.org>
Date: Fri, 27 May 2022 14:20:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: soc: ixp4xx/qmgr: Fix unused match warning
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=644222
  Lore link: https://lore.kernel.org/r/20220523085520.913217-1-linus.walleij@linaro.org

Patch: ARM: ep93xx: Make ts72xx_register_flash() static
  Submitter: Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=644168
  Lore link: https://lore.kernel.org/r/20220523065616.325052-1-alexander.sverdlin@gmail.com

Series: arm/arm64: dts: cleanups for dma-channels
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=641998
  Lore link: https://lore.kernel.org/r/20220516142857.6419-1-krzysztof.kozlowski@linaro.org
    Patches: [v2,1/3] ARM: dts: pxa: use new 'dma-channels/requests' properties
             [v2,2/3] ARM: dts: da850: use new 'dma-channels' property
             [v2,3/3] arm64: dts: sprd: use new 'dma-channels' property

Patch: [GIT,PULL] ARM: at91: soc for 5.19 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=642402
  Lore link: https://lore.kernel.org/r/20220517150832.89451-1-nicolas.ferre@microchip.com

Patch: ARM: configs: enable support for Kontron KSwitch D10
  Submitter: Michael Walle <michael@walle.cc>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=642759
  Lore link: https://lore.kernel.org/r/20220518141542.531148-1-michael@walle.cc

Patch: [GIT,PULL] ARM: at91: dt for 5.19 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=642418
  Lore link: https://lore.kernel.org/r/20220517153252.92393-1-nicolas.ferre@microchip.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


