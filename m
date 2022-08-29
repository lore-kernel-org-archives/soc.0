Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C116ECAAD4
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5702AC43470; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4131FC433C1
	for <soc@kernel.org>; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661765893;
	bh=5owox0HEuU+i6O8odqbKB43H275RgUM40QW09fSCDgs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=o/Opb72zUrVczChJslXDVdb88SGlKH65z83YdcYo9vFM5cjPLEjDYwytMG6hTDzbs
	 eVWlVf8wcN16hmIqX0DHaNYTAcQOdlotRh0NmL0P28eucQ1IMkmzHSKoycjZr/GY8S
	 I2oOQddVHf7BkcQMRZGQ8dbDiokpW0znBH2ivR+dBiurtl+v4idqIk/H+42lHRbsoO
	 o14e8qSpN2hbhg1e/VR1pRNgFrOccWIe3GY0r6jrZA9JWBKtnSeRRpzNVeBB0iBCrl
	 HRQNAD3rEuo3ftkgGikmQXYS8qObtWzv9yGfZlQimdhy8KOYxeklY2RBDfLynhYG85
	 d8R6sgt4cvw3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A4CEE924D6;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176589303.19402.2525900675297298771.git-patchwork-summary@kernel.org>
Date: Mon, 29 Aug 2022 09:38:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 6.0
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=670088
  Lore link: https://lore.kernel.org/r/20220823092631.GV149610@dragon

Patch: [GIT,PULL] DTS fixes for the Versatile family
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=670825
  Lore link: https://lore.kernel.org/r/CACRpkdZfTe8NSGR2ZCkn-1JcNobjfWeXqajSqcJMp8+WtY+2Xw@mail.gmail.com

Patch: ARM: ixp4xx: fix typos in comments
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=671466
  Lore link: https://lore.kernel.org/r/20220826112153.438829-1-linus.walleij@linaro.org

Patch: [GIT,PULL] Fix TEE system compiler warning fo4r v6.0
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=671001
  Lore link: https://lore.kernel.org/r/YwdHcdEUib7obbbW@jade


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


