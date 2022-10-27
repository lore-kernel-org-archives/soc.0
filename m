Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07D7FA3740
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A64B0C433D7; Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84D80C433D6
	for <soc@kernel.org>; Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666889073;
	bh=DVtVTyplEHQbUZ6ZqJklYRFTVGMV3GyNmbBU1MrzbfI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=kVdbPXVH2HVru0NzeJzX0/cbwbTmMSVxVxqEBy3MfM5OUGY/5dht39jCQvokvPY5s
	 +2+d2IMtQkHZpdPwoeTsWf4LK9w/686u+Vcao2gLQcpArTGGhbPUYiwq7DvNg+vlUz
	 Bc6roBvUvROkQTpY4SZ/Rzf7w4ahKVsTy+1gl6Kg6H/wRTSaxfCQBBu314N6Uqqs14
	 3dziIfauETq2gkeooCEj2N1ViXgXfsBastzduLzUCY4j8GMqIYHW0zA+yewc1K+oBa
	 cv6NleX8fsxo7JoqKIlu/0WYdNEyWhNElXE6yigqdSj7IuSOPknS0JRMNaVlnoaAGK
	 7xzFQ0X7JqKYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F3D5C4166D;
	Thu, 27 Oct 2022 16:44:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166688907329.25139.9389225865628365706.git-patchwork-summary@kernel.org>
Date: Thu, 27 Oct 2022 16:44:33 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Ux500 DTS changes for v6.2
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=687690
  Lore link: https://lore.kernel.org/r/CACRpkdaXmmZWsGdTG5tqNragkoefcTeUHjR+ZwNyNaa0S7s-7Q@mail.gmail.com

Patch: [GIT,PULL] Apple SoC DT updates for 6.2
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=688048
  Lore link: https://lore.kernel.org/r/dea10860-2870-3a9e-fa51-21e493b1573a@marcan.st


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


