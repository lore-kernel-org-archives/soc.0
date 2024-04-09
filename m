Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB56FCD128A
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7BA7C433B2; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1C0FC43390
	for <soc@kernel.org>; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677239;
	bh=ZyT3dYIWJCH40xC75xbOt8KVQwFrVcp3/SyGJPPgtpM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=LRujqHBvl8eieVW3+SymFHPDzjJvfy3E2vLQSwgZ5fYlakz164UWXlDpijMsEtYT6
	 mFvYT8RfiFsUQrCmjqnEO9prphCiT/hjv+iC4vry3JCYaGwhQDk/XdjO/XedOhFHnC
	 J3gQeezyOZUjbIxYpFJjhYb4FVXTnn/t0o7DsWNnrwMskIa/1O3OeuUygpIeTSn/um
	 z4sC9uR1KGXNPfIr2+u4qCSAsjCfSSGd2re9kTlQOXa1KUhIW/aA0lBo7mUxNDZTbE
	 90pXhG76HZS0xEpzsyL+KsQBvXe0b/0/woxCMkBWwbActdgjlC2nVtY99pwgL554V1
	 6v2cDKVjmO4Hg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8780AD6030D;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267723949.12038.12728084155834518947.git-patchwork-summary@kernel.org>
Date: Tue, 09 Apr 2024 15:40:39 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_ffa: Fix for v6.9
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=841457
  Lore link: https://lore.kernel.org/r/20240404140339.450509-1-sudeep.holla@arm.com

Patch: [fixes] MAINTAINERS: Change Krzysztof Kozlowski's email address
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=842307
  Lore link: https://lore.kernel.org/r/20240408073234.12968-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] GPIO regression fixes for n8x0
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=840992
  Lore link: https://lore.kernel.org/r/pull-1712135932-125424@atomide.com

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.9
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=841456
  Lore link: https://lore.kernel.org/r/20240404140306.450330-1-sudeep.holla@arm.com

Patch: [GIT,PULL] RISC-V SoC driver fixes for v6.9-rc3
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=842016
  Lore link: https://lore.kernel.org/r/20240406-botch-disband-efc69b8236be@spud

Patch: [GIT,PULL] i.MX fixes for 6.9
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=841349
  Lore link: https://lore.kernel.org/r/Zg5rfaVVvD9egoBK@dragon


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


