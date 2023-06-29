Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB740EB64D9
	for <soc@archiver.kernel.org>; Thu, 29 Jun 2023 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 989FDC433C8; Thu, 29 Jun 2023 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81914C433C0
	for <soc@kernel.org>; Thu, 29 Jun 2023 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688050869;
	bh=jsyKcXAWYVgqzCllduPQkymvJ0mOHyhgr04KCocpowM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=SAHNamjUQYVQjaxVM5MsQtPNo5dzeXEiEQIS73AJmTTLr1fePo0Oix+OfZ9Ga7pFn
	 kXMHoElLPiPQmvM6evVPWp3briUcQgFELAyGSPOUjWU7SIUQyc5UuDmhEbzzzylFGM
	 3fTqILlP+8VdlEAvRCiWWchveqeW4egRq4v2PhxsfzpS96ucsl5IW1yZCr5wxaSGqY
	 f70AShlSrThYonO8jc+tFYZzxFHeQx/9m+MyR8M1mQAgwO/3jvfCUFfG+fLv++kP6S
	 D7sK7oxynvqwT7rcZf2prNfEaHnkBEC+m80sQoG6E3uwMcNa8xmLpSQ27EtQoQWLPe
	 7+oQwME0PPejg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F075C43158;
	Thu, 29 Jun 2023 15:01:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168805086932.12232.2840308721432441410.git-patchwork-summary@kernel.org>
Date: Thu, 29 Jun 2023 15:01:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] One last Qualcomm ARM64 DeviceTree fix for v6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=759625
  Lore link: https://lore.kernel.org/r/20230622203248.106422-1-andersson@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


