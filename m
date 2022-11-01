Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087FFC433FE
	for <soc@archiver.kernel.org>; Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5F22C43470; Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B042CC433C1
	for <soc@kernel.org>; Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302217;
	bh=47PUC1HV1VoWYWlNBwQhNg0W5Ez/APD0WzoqRGmXi2Y=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JxkfnQFBYAZnOXCUuEDvxzHGXTw+ZQwcIAHeg8yl2kZLOFpHM8DMLxcXGgr77lVZ9
	 j9iK2lftmpYJgpm1b8E7ZhpQoDc/vMuTZCCm322gBcrRV6MQXcZQFps5+hZd4VYJMu
	 yMFIRJBWwK9StqgkxlAy18LAUSertifAY67Lkc2czsH9vP2KBaLz10paH3T9RBGhWX
	 OMjXkpmBjjM5rCEdfPvlZyzdElM2nTZjtlfocjYkR6+k94y0yVlDo2vT2nG0vEk/8+
	 USkwF08F+igitH+NWkdo7aBlZSWkdgfHP49yIKjDYXjD4BTXc1RFBnLgj5bvk1S+YX
	 yTgkAbREW0Ghg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C3F5E270D4;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166730221749.4100.8057021312770153658.git-patchwork-summary@kernel.org>
Date: Tue, 01 Nov 2022 11:30:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX fixes for 6.1
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=690718
  Lore link: https://lore.kernel.org/r/20221101031547.GB125525@dragon

Patch: [GIT,PULL,1/1] Broadcom maintainers fixes for 6.1
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=686862
  Lore link: https://lore.kernel.org/r/20221019185514.750684-1-f.fainelli@gmail.com

Patch: ARM: dts: ux500: Add trips to battery thermal zones
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=690296
  Lore link: https://lore.kernel.org/r/20221030210854.346662-1-linus.walleij@linaro.org

Patch: MAINTAINERS: Update HiSilicon LPC BUS Driver maintainer
  Submitter: Jay Fang <f.fangjian@huawei.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=689786
  Lore link: https://lore.kernel.org/r/20221028105434.1661264-1-f.fangjian@huawei.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


