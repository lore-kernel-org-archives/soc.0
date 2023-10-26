Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222E5C25B67
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED78AC433CC; Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D86C4C433C9
	for <soc@kernel.org>; Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698339030;
	bh=vMGWmZniaFVixFwJ6TvRWOdqlE6x45n2p5HJfq91fsQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=TaZd9TnxXQssd5iigPLT6d+yG+N63STvSG7arpRML1W75Jq1cCJQt0ACWub5maljt
	 jPClZ0BSEH5scyGE8kKOr7gVZ5Ln4mwg6CPCEaVRDn0eEIRAWB8zToXoq3GeKhdpxl
	 3sjteGaoL6ja3Dgnf2l5jyakKPDzXSKXH0x4uzr+yvxRfYxf3kaa+FRvQhXzbcYZ49
	 2Swg1BWvZ4B+UDEYrmIw4t02aYjcC2GWid22nvBwE773hOWDuxv309NyzV+gz/yJsh
	 8ZTNDbCJ2fn7zCuOk8jLALlwd/dMpE/a9etVQ0IDaFyNpw0bbgKlIqjsDivS20H4Rg
	 HxB43VzQHIzbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7347C39563;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169833903069.20019.9134232449328423810.git-patchwork-summary@kernel.org>
Date: Thu, 26 Oct 2023 16:50:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for OMAP{3,4,5}
  Submitter: Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796400
  Lore link: https://lore.kernel.org/r/20231025112136.3445-1-lukas.bulwahn@gmail.com

Patch: [GIT,PULL] Few more ARM64 defconfig updates for v6.7
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796548
  Lore link: https://lore.kernel.org/r/20231025191841.1015192-1-andersson@kernel.org

Patch: ARM: dts: usr8200: Fix phy registers
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=795112
  Lore link: https://lore.kernel.org/r/20231020-ixp4xx-usr8200-dtsfix-v1-1-3a8591dea259@linaro.org

Patch: [GIT,PULL] More Qualcomm Arm32 DeviceTree updates for v6.7
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796567
  Lore link: https://lore.kernel.org/r/20231025201503.1016435-1-andersson@kernel.org

Patch: [GIT,PULL] More Qualcomm ARM64 DeviceTree updates for v6.7
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796560
  Lore link: https://lore.kernel.org/r/20231025200053.1015821-1-andersson@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


