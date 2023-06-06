Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD12C77B7A
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B1E5C4339E; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E65EC433EF
	for <soc@kernel.org>; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686084024;
	bh=uyiQranUjWoEe25mTI8KZViIhTdTEWsSc3nY6lry3AA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=TtT6+JTnzupAKODwPKEOL3XE2667W/T53vx5LuDRXaLI1XPHu+RYuJvdXKMWOHn2D
	 pDKl9f/c3fdOPXYpj0MYH8//+jqMGWX1+bDfPRvcbhVYA8NCAu5EktEMrtkMRpQ6hV
	 yMi7ktbsjMdeF1MR+R95mC4QWnQUjnAaw7mVtrr4Bq9Fz9yK4q/9awezbBZvyQP9s9
	 yOgPG030cbyvY4pPI4ruSM4teedcEVMw/K7Dn3bLUliFU/bV5IcdAz6clMUYwqfTjo
	 ziDyszZxGREKbkLjC3jqHE+DjhyaJEXbY+SO0dbiPdqEpOYVhF+jTUTCVzXbU0VMyM
	 qLwjnrTqDn26g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65500C4166F;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168608402441.20407.1953963893683708908.git-patchwork-summary@kernel.org>
Date: Tue, 06 Jun 2023 20:40:24 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] Non-urgent driver fix for ti-sysc for v6.5
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753460
  Lore link: https://lore.kernel.org/r/pull-1685700720-242492@atomide.com
    Patches: [GIT,PULL,1/3] Non-urgent driver fix for ti-sysc for v6.5
             [GIT,PULL,3/3] Devicetree changes for omaps for v6.5

Patch: [v3] Documentation/process: add soc maintainer handbook
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=754335
  Lore link: https://lore.kernel.org/r/20230606-escapable-stuffed-7ca5033e7741@wendy

Patch: [GIT,PULL] Ux500 DTS changes for v6.5
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=751829
  Lore link: https://lore.kernel.org/r/CACRpkdZ2YLzB-n+1M9u0UqVfct_LAR5cLvYyJhxHsXNR_TFzpQ@mail.gmail.com

Patch: [GIT,PULL] firmware: arm_ffa: Fix for v6.4(part 2)
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=754446
  Lore link: https://lore.kernel.org/r/20230606125720.2816923-1-sudeep.holla@arm.com

Patch: [GIT,PULL] AT91 DT updates for 6.5
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=752161
  Lore link: https://lore.kernel.org/r/20230530105945.11638-1-claudiu.beznea@microchip.com

Series: [GIT,PULL,1/3] samsung: drivers for v6.5
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753442
  Lore link: https://lore.kernel.org/r/20230602091501.15178-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.5
             [GIT,PULL,2/3] ARM: dts: samsung: for v6.5


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


