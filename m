Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF97C61DB3
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54553C43392; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F3C7C433D2
	for <soc@kernel.org>; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390532;
	bh=zVmcWHAzC2iEmcC/kCV6xfw/NJFGA9ZtPWFxR31Mj4g=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=GpgRS7rBbGgAWGg0UhuxYNWtQABo/drIb+kvrha34H1phuvM/mcs0HD9UOR727z1u
	 XjL5W50txVc9Z6C+Ug1unI92dVQ1pEhAI0+QE3tzZAhUNwE2G9Hrpu7TJObsp6O4zr
	 6XqmvTuRo31oFTIrO0/KrOuIWKcM51HM14fRq7NyjDc/Yx2Ldyn14BSq4rn4XNnBql
	 gyB9mTAOafyaHgEyfd+ZaCh1AnLZFNItGud3kpJ77TECQZI1Mc7RKvsl/Legg9yhJ7
	 bZKc1RAOoDY3ZbEcnO16qm4lbm5rNPlDxWZRU8SX4alDKJS47/DqEjuLoX3/U3IgTw
	 nWvNWig9HyoyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2C6D7E21EE9;
	Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167339053217.5083.5188666288711069301.git-patchwork-summary@kernel.org>
Date: Tue, 10 Jan 2023 22:42:12 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm driver fixes for v6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710702
  Lore link: https://lore.kernel.org/r/20230110213946.2183982-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM32 DTS fix for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710694
  Lore link: https://lore.kernel.org/r/20230110212750.2182904-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM64 DTS fixes for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710701
  Lore link: https://lore.kernel.org/r/20230110213724.2183668-1-andersson@kernel.org

Patch: [GIT,PULL,1/1] Broadcom drivers fixes for 6.2
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710704
  Lore link: https://lore.kernel.org/r/20230110215025.1008437-1-f.fainelli@gmail.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


