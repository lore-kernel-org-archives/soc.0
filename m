Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCD7C04FFE
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 20:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72092C2BD11; Wed,  8 May 2024 20:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C2F7C113CC
	for <soc@kernel.org>; Wed,  8 May 2024 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715200231;
	bh=Bm3XzO56E1qCrGiVsVj/o9kAG7gXLF7u0mkXe4LrxDw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Y3UMtGKYyaMB+0Ft+ywMR6m0I9N2sOyltBFybX29d3aCWq1anY7bCyrpFJ6SJWL2D
	 Ij1eUO9yCdYrvSkyd4EJEW4FiHdM0W0vvJ9g0iuhDVi/p8PDeXrAwJEKYiuxGbRJB4
	 n5FxcP9sD0dyc2VuxKlzRP4D0gtnT3fGMyJbqf5pnha9GNqCek/aOVzU8LgT+oC+RA
	 padMRyvfZVMEgC0ePCfT0cJEACMoF3rHjJMMZRXpad6N3KJeWoQkMk6f36Ln4T7VGL
	 SchQsTmb7ypYbKHYLfV7E3HevbpDjb8DbBNOGnWiQSQwbwIT+zgnPHotVZVpcXNRnR
	 QcpnYO5+MKZyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42A6BC43330;
	Wed,  8 May 2024 20:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171520023120.16885.8141932288858269560.git-patchwork-summary@kernel.org>
Date: Wed, 08 May 2024 20:30:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V Devicetrees for v6.10 Take 2
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=851692
  Lore link: https://lore.kernel.org/r/20240508-crafter-cement-4f54e4182270@spud


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


