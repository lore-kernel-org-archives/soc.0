Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE916C25B75
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE165C4AF63; Tue,  7 May 2024 09:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8CBBC2BBFC
	for <soc@kernel.org>; Tue,  7 May 2024 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074831;
	bh=AsU4C9dlV1cNmLfzxZRcJljwUr7ODzFj5jI7RjYvZ0E=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=KqX6nPKNonuec0RZsECn+lU4RGh2PjCsYUAIpy84FPrLvAm4zNZ2HYthsiHIu6qwM
	 sQqb5Mr9mcyTzULhI9OLu6QPxQIg00QaPDaVA4Nky1+w2pXq7M6yCMoqW2fE5dbA8y
	 +4wLYRvyFzH3jayTm43VHXSGxV7FT3lQRc1oB0VrhYSEm1Mof42nfZYeg/OSQBXgM6
	 2Fo+CIotenTuGRGcOyn317wXMsdHKcwxT1RAyGm7/p6/294RyAZGqJ7GCUMmeEet38
	 WoBcTKEBGKOZ8wH3Gab0hcf2NBMrfn6tz5YFCbRyzA1zLCos6UnDblbNITUYdoFQX0
	 NxWF7dy8byL3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90D5DC43330;
	Tue,  7 May 2024 09:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483154.24942.7817460616375430116.git-patchwork-summary@kernel.org>
Date: Tue, 07 May 2024 09:40:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] One more Qualcomm Arm64 DeviceTree fix for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848512
  Lore link: https://lore.kernel.org/r/20240427153817.1430382-1-andersson@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


