Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8611AC4321E
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BB3AC4347C; Wed,  2 Nov 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 559D1C433B5
	for <soc@kernel.org>; Wed,  2 Nov 2022 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667423417;
	bh=1/tvINVwnu6IKNIp+zaeIWIsYFafJFNOM0A04eu5SW8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=uytuoEbvZDtJAjtefOhoXK/bTsdpldGNqqq/vNuvekixHIoUXghbcA1Ai+k/YPjDQ
	 f1PTjE1npGHekn3J8HEeYTK9/+VwtQGhErP9UR8apc0JXQHmky9tgJJWWyMEAIp1tO
	 C36M5nNagz8p8szPBI8Vxl1Olw3RzMQOj7cjyYoiSIpXX0vEcEj9Gv49qWI7Qsl0G0
	 /XHT1eM9MiK6WZpcoXE6tv4SodzZURFmLnP/GZwJrIPezY4mMSdINZ2Z4rmDGE/vEK
	 0A1OduVl4oaZFRmN8N8Ea2NSnrNlZHMJ8xp+ejq1cJGlqQ3m7HeRh1mPLju7VP+KfB
	 T0POyuqqKmxZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3F6DEC41620;
	Wed,  2 Nov 2022 21:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166742341725.30442.7374933238417712817.git-patchwork-summary@kernel.org>
Date: Wed, 02 Nov 2022 21:10:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.1
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=691223
  Lore link: https://lore.kernel.org/r/20221102140142.2758107-1-sudeep.holla@arm.com

Patch: [GIT,PULL] arm64: dts: juno: Fixes for v6.1
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=691224
  Lore link: https://lore.kernel.org/r/20221102140156.2758137-1-sudeep.holla@arm.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


