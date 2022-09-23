Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D516C6FA82
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61DADC43140; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4649FC433D6
	for <soc@kernel.org>; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944667;
	bh=EZK7Ume1a6It8XiNPk3H8OuxEGb9Ea6U838xMyda0YQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=m/yX0lBqkY6kAZGC4Q780LKpnBr6/JG7L+GZbOFqLH9oKTEBKXFmy+LolZaJubINF
	 g7DKyO3RfNbAN11III/boWaTZ1t9L6fMVKxy/JKBY52hH6hDq4fko7E1x1k2XrM72h
	 Pjq8On8F92887Kq94/G9m8rAFIAkKb85Y94LhPQU34Hk8QM4+IgM7a3k8qAyRMTK6s
	 XIrquAWe/tHOpHX3Ll1TV3ldq3uw8957huJR8ikM6Ec+TLbJWaz9UXWatfd72550kr
	 47iFHwrVJlT/goSunx6QT9VJMGqDdDU/HHEQw/yXpx07Oq8fv6vJq0tU7I84Bevayx
	 HRTDruIdTZaMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 28102E4D03A;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394466711.12526.14852102154873448739.git-patchwork-summary@kernel.org>
Date: Fri, 23 Sep 2022 14:51:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm ARM64 DTS fixes for 6.0
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679062
  Lore link: https://lore.kernel.org/r/20220921142939.1310163-1-andersson@kernel.org

Patch: [GIT,PULL] Allwinner drivers fixes for 6.0
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677986
  Lore link: https://lore.kernel.org/r/YyeN0m78+m9nNEah@kista.localdomain

Patch: [GIT,PULL] SoC fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676837
  Lore link: https://lore.kernel.org/r/pull-1663140667-273537@atomide.com

Patch: ARM: dts: integrator: Tag PCI host with device_type
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=678109
  Lore link: https://lore.kernel.org/r/20220919092608.813511-1-linus.walleij@linaro.org

Patch: [GIT,PULL,1/1] Broadcom drivers fixes for 6.0
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677983
  Lore link: https://lore.kernel.org/r/20220918205038.3017866-1-f.fainelli@gmail.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


