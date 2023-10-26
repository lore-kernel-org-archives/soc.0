Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC56C25B67
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 15:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D56CAC433CA; Thu, 26 Oct 2023 15:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0049C433C9
	for <soc@kernel.org>; Thu, 26 Oct 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698333023;
	bh=gUFXdDEQCAoLYeB7YmG36pgbr6+0z4wCwvVfo6njUls=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=mBTYf9qU+qhzfddE2PGy0IrQWpe7KPzV3HiFZ/RnzcXRfMxIsHDNg2HSrTuRQQUbA
	 ymN1JOJaYdPhaFGS1x00A0LxjC88J+0tE3l0+OdTaTn7R9ZKfT35/bO3LNSA016LLD
	 ZCerhwqEoPrjsVSW9X0bnvIkZp8Id/ccJttH/zmPzVTFAoKVl6D7mzispEbTSs+qQP
	 NftTauq4zoS8ZcOJ/DJTHEcsO+e8oxmn2yKzKH834wxZxfobKqLgECghFMSafPrWUJ
	 LRHKwd0OTW9M8d+3j+Z67GV+MukhvAxdffaFoaqadsDh8UTNN4mXGKU2fLweAOzAZC
	 IBW78YZ7d871w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98038C39563;
	Thu, 26 Oct 2023 15:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169833302356.28075.11720143420487915780.git-patchwork-summary@kernel.org>
Date: Thu, 26 Oct 2023 15:10:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Renesas fixes for v6.6 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796768
  Lore link: https://lore.kernel.org/r/cover.1698312384.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


