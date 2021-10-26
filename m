Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD977C433F5
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BD76460EFE; Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A5E8960EB9
	for <soc@kernel.org>; Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635265810;
	bh=m69DZbv55zw3M3n1jwBAFPgz+0Ao8u5ezUM1pHn82Vk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ZycV9vnSPSIIfVd9sVjqQNGoPv4xXEWLXfL+KUH0CF3rCBZiMAWzdqsJLLWMATeb5
	 IQBA9nhj+8BPY54UOpbXWpVoeDSYYkTK2pn2HTGi+MukW9p1CbwGAtlou0F6MiVh6+
	 C5CZ4jKmT1GLugWm+fGjFUU9fkWogvQJWclazn2v0kirgGBMS/6UaimYKOHA1SCu3P
	 v9PeEZwg+Uufm0GbRww5Q4qJnLNddAXdPlTvjBWDg1skbUYA0pfbauepwJxDUNmgC9
	 EMo+gToq9Beu3mgKbmYopy+OzWTQ7NKddbalVSH63Kn7DCK9remSSjI5hjeOHOA1IU
	 I9xGnASo/J7ew==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9E44760726;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163526581064.16112.11677015976441144126.git-patchwork-summary@kernel.org>
Date: Tue, 26 Oct 2021 16:30:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: SPEAr: Update MAINTAINERS entries
  Submitter: Viresh Kumar <viresh.kumar@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=569323
  Lore link: https://lore.kernel.org/r/b3e7584fb5fe7402065f54f13954c9eca9c47bb7.1635140757.git.viresh.kumar@linaro.org

Patch: ARM: dts: arm: Update register-bit-led nodes 'reg' and node names
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=569225
  Lore link: https://lore.kernel.org/r/20211024232003.211484-1-linus.walleij@linaro.org

Patch: ARM: dts: arm: Update ICST clock nodes 'reg' and node names
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=569227
  Lore link: https://lore.kernel.org/r/20211024232239.211822-1-linus.walleij@linaro.org

Patch: [GIT,PULL] firmware: arm_ffa: Updates for 5.16
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=570419
  Lore link: https://lore.kernel.org/r/20211026141535.1920602-1-sudeep.holla@arm.com

Patch: [GIT,PULL] ARM: at91: dt for 5.16 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=569807
  Lore link: https://lore.kernel.org/r/20211025163428.26285-1-nicolas.ferre@microchip.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


