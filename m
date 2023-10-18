Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78ABCDB483
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 15:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94BBCC433CB; Wed, 18 Oct 2023 15:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F14AC433C7
	for <soc@kernel.org>; Wed, 18 Oct 2023 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643625;
	bh=WVF3IY1y/eBwHRaR6jcduUMj7U3dKs5qQiksAEBqACo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=B6HNZiZO9uF0GGFEp/l3DmZJYBL83eeN3AchDIbEdddB7LUg5XGv+OTZk5phHIvsv
	 9ye+I+4kTBfsoIlMukKYX9XLsIheZ0qXe2MSYB8lLlhZYB48dIFO6MJ64XLR5Eh2Pi
	 hK3/F/vBaaBTqRTrH7FZ8cMWqbSCXNkwr8ijJEE1NpJzV91+9PHEepR/+h1KtGNvv5
	 uNRJjljg+4gUCaUH03nBteyaMZOV9butv6KfGfE9wDfIyEsShkriDEfMQX3gEcfl4E
	 DIpFZr1WDvWM0l4RuQk+uxC8YOraHEZtMtL0xq9DufQL9UPvBcKlFSTAY42o3BncB8
	 jY/H4vI8vtS/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D638C04E24;
	Wed, 18 Oct 2023 15:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169764362531.8197.1497708273239238790.git-patchwork-summary@kernel.org>
Date: Wed, 18 Oct 2023 15:40:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794184
  Lore link: https://lore.kernel.org/r/pull-1697606314-911862@atomide.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


