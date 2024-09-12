Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D97EED60A
	for <soc@archiver.kernel.org>; Thu, 12 Sep 2024 14:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC3AAC4CEC5; Thu, 12 Sep 2024 14:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6568C4CEC3
	for <soc@kernel.org>; Thu, 12 Sep 2024 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726151430;
	bh=VvcbObJJa5YG3+bxuNB8Ohl/0PxMnQl5eli6ctTkKPA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=U12Jm8R6lUlqMuG4RMi2zZZPb3DejqMxx4r3wNFnQAeAZXjb1dCuWuWF0OlPaiisx
	 zKF1oy5bHZ0R1F4TmMod5hVgjF64zBJRjzpz8J3XFkml3OKMb0r50aX0bjx42UlN6H
	 xXdZXjGJteZHRfL6SunbSIxMRtwCFftI5M098YZurfogEpCWIqU/qnR2gXTDHiI/M2
	 hQW9Rz4fy6Puiu/uyQTicK5MbdAIxPxLm7WIjzcisCi0/P14kh2cgp57aEwBsyXSYp
	 GfSHAAJmoNyDLJe9OlxVhOEKvW9+sqU1dexfPc3rS43vIEvECf3C3lPpsTKY5u1n1e
	 WKZQNJXmKAeYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2B163822D1B;
	Thu, 12 Sep 2024 14:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172615143153.1611582.14929195022048265508.git-patchwork-summary@kernel.org>
Date: Thu, 12 Sep 2024 14:30:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Allwinner SoC device tree changes for 6.12 part 2
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=889648
  Lore link: https://lore.kernel.org/r/ZuKmwD8VQrvNx8ir@wens.tw


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


