Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963ABC43334
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BB37C341C8; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65D87C3411E
	for <soc@kernel.org>; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657746023;
	bh=AqraR/BtWXV29sSz4OJrlEmWnJNqYFfMWgU/XdxqB0g=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=l2oDlQj6D86txavkl3I4f6FQra73dhAZE9mjom3muEoXXXuapwE5RzMQY7uRTIQ/x
	 hkxA/gqt8XB+MI2ZI6DM/PQmGdSVvYaF8re2IA4Y+ReOB5ZvPjN5hYfXPwN4j9nKmZ
	 OwwiNrbZyFy7zD/oXOxR2GZmgWeiDvJvN78Vr9/xVw/ujP9HSSpALvHlOS8r1a6FjM
	 tLMMsXY1cKjwRSpEdy4xye2YB8vSMGMrg6tKGG8H/XC1VQdODtJjMQf9LCDpHQglV4
	 I7nb2fYSVn/u/OdVWPc/aXHOu84jwU0mqraC36MV92Fj0FxfS3956pNcpEKkdP4Rm9
	 fYVL4/Oyb0efA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49A96E4521F;
	Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165774602329.1051.17290466857380485458.git-patchwork-summary@kernel.org>
Date: Wed, 13 Jul 2022 21:00:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] AT91 device tree updates for v5.20 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=659178
  Lore link: https://lore.kernel.org/r/20220713070602.1652118-1-claudiu.beznea@microchip.com

Series: Broadcom SoC updates for 5.20
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658639
  Lore link: https://lore.kernel.org/r/20220711164451.3542127-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/7] Broadcom defconfig changes for 5.20
             [GIT,PULL,6/7] Broadcom maintainers changes for 5.20
             [GIT,PULL,7/7] Broadcom soc changes for 5.20

Series: [GIT,PULL,1/6] i.MX drivers change for 5.20
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658116
  Lore link: https://lore.kernel.org/r/20220709082951.15123-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers change for 5.20
             [GIT,PULL,2/6] i.MX SoC update for 5.20

Patch: [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 5.19
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=659082
  Lore link: https://lore.kernel.org/r/20220712231222.97850-1-f.fainelli@gmail.com


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


