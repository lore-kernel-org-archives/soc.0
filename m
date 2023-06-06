Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABF0C7EE37
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 20:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6888C4339E; Tue,  6 Jun 2023 20:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F1F9C433EF
	for <soc@kernel.org>; Tue,  6 Jun 2023 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686084021;
	bh=3LgLSudgtqhSHIq444D1HbUtQYaFNCN4MHhUh7scoq4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=PgpyoNHKcso7koe1T+l9T20etKA9RmCpOltnaATaXlV2J869fZO621zri+dK2XkA7
	 hGMhBZeJLpE57V4EzmWlBSzjaz1Blovf5Zl7oEwhZZ7V7BvZjJGWWrxibGGnqpWNV7
	 Nnxy2VrVxrHqSNDvWKpe5bWwhJ3XmdxGXg6y3iJmYa3P3CHuH+vqt2bJnndK3obOmx
	 0jVa5b44EiYFFsBLq6J/WzimIgWGWha24mA6Fj/hWiVllu0F2lyFFC/UlmmZS7DsG4
	 Bn2dJQR/yy6GyD+LtZrZpGh7kK0UYF2APZEM5bX+6dr7v+Se9vib5MpWNMBQCNl1ln
	 TaAOjW1FdHAsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A17DC4166F;
	Tue,  6 Jun 2023 20:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168608402124.20407.6159395091011920891.git-patchwork-summary@kernel.org>
Date: Tue, 06 Jun 2023 20:40:21 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_ffa: Fix for v6.4(part 2)
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=754446
  Lore link: https://lore.kernel.org/r/20230606125720.2816923-1-sudeep.holla@arm.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


