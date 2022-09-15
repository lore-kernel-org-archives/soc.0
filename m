Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3C5ECAAA1
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C965C43470; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36090C433D7
	for <soc@kernel.org>; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663273220;
	bh=Tp7ag+v1Lm8yqYV71MQOmi42GwLAGK96GD9ltccRwaM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=PVW99ObRT0tcZ7uFDz+KgFP5z4mDT58sXq0KLcPMD/C+VGEBpMjTnM3iDQbDmu+gf
	 qTn8tBlYBBuf2Grl3JnpqzF/jXappptJQJ8mpzVIat+DCbIspUBxYxrsl6WEiYim0t
	 uF2i+q12PaderqafMFfEwuGKYnsUikY66gMlY0vmLlcBwnvUp5TofMNba6fu6QsRGS
	 VBFzS3XhDwtUbFUi9mEoS7o3Z89vP1fNKNtzp0nrQKI6REbjq/Bv0+Sr2zqWq5GtYV
	 F1jq09PZ0nmaFVOj6fcb6g9tevdLl4vAmwLJXyIQ+bf/mcNZL5UoPijZ8amEdtRTfI
	 vesvzbGIglaXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22FC3C73FEB;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166327322014.27590.18248851809929497437.git-patchwork-summary@kernel.org>
Date: Thu, 15 Sep 2022 20:20:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX fixes for 6.0, 2nd round
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676391
  Lore link: https://lore.kernel.org/r/20220913025043.GH1728671@dragon

Patch: [GIT,PULL] AT91 fixes for 6.0 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677280
  Lore link: https://lore.kernel.org/r/20220915105833.4159850-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL] firmware: arm_ffa: Updates for v6.1
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676512
  Lore link: https://lore.kernel.org/r/20220913100612.2924643-1-sudeep.holla@arm.com

Series: [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.1
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677142
  Lore link: https://lore.kernel.org/r/20220915023044.2350782-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.1
             [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.1
             [GIT,PULL,4/5] Broadcom drivers changes for 6.1
             [GIT,PULL,5/5] Broadcom maintainers changes for 6.1


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


