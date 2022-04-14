Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D71C433FE
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A7DBC385A8; Thu, 14 Apr 2022 21:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8562C385AC
	for <soc@kernel.org>; Thu, 14 Apr 2022 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970616;
	bh=2+hmK5W5DOOZ3Lgw2+DDiSgV5XNaCp/FpCmcg4wPs8o=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aOuiOl1MEU78GubRNf7MahhV6UTTQMzI2ZSbPYMLc5vuRBS2TOZLKgfSq3cypLOGB
	 aJa9biX7il5yszT1olAQx8cfIM93kmSU7GpUu9olKm3h8sAgFpykfNlBhQ5pZKXF82
	 SmPdjeyo1NbOMqhx1dbom90sAPrtRwYtBBVfDzh5mZvQg7bBFQVOrZnF98MGXxVGpa
	 JlkHDZtB1tfZEm/2PhGecT2IF+DWcBJ4c17Ibo/TkTcSfrV8cgymMspung8/XOwLr1
	 imNxNXBBmd9gQqkelDi00TuuLvjPp4/SPZol6B1/wqMlHbMeS7qwiBJ0LGb8RfqvEs
	 zkJp1PAD0t9WQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D4B3DE8DBD4;
	Thu, 14 Apr 2022 21:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061686.10394.2697393314031349153.git-patchwork-summary@kernel.org>
Date: Thu, 14 Apr 2022 21:10:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [[GIT,PULL] OP-TEE fix for v5.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=631716
  Lore link: https://lore.kernel.org/r/20220413052001.GA49798@jade

Patch: [GIT,PULL] i.MX fixes for 5.18
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630877
  Lore link: https://lore.kernel.org/r/20220411024301.GH129381@dragon

Patch: [GIT,PULL] Ux500 defconfig updates for v5.18
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630195
  Lore link: https://lore.kernel.org/r/CACRpkdY+_Go4XNzOh+Rvc24QBnUud2k-S7VQuaH5d-j71_dJog@mail.gmail.com

Patch: [GIT,PULL] ARM: at91: fixes for 5.18
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=632321
  Lore link: https://lore.kernel.org/r/20220414143318.26363-1-nicolas.ferre@microchip.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


