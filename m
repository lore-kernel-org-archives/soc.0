Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B80ECAAA1
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FEEBC433D6; Thu, 15 Sep 2022 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09B65C433C1
	for <soc@kernel.org>; Thu, 15 Sep 2022 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663273217;
	bh=jIXBaYdGwRx6mpDc1fnyiM/BchWIERcIbDmxtQP/5VY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=SbIsRuH1u8rzfnKMM0wsjYfk9PJ0L4ZpRsCfOI1k6x9rw5kXW5mLAFE/SJRP0bk7E
	 Jz+11juLamuRBuH1VD0XzzAH6IJWiRTe4WDcJmxRgPbszFh5mW5YyhP9fwlFSHK3k1
	 0QAVc1pcDUVax1IRNJ5KIG1Y+CNCIbxpNg8ZCh2K26cxIivu5pG2Gx6eBDD9Tv5zr0
	 pjZ8Ou10JReKxB2qtVPcsamTwD/xYxzcSnGK+o7Qv+1KNoPuTUbPLHNm5/xwEeg71E
	 v419Q1P7bQpKlOwJmT27LYhYIreFyBzejwGZIwRwsXp5FjpeeCrAz5XtMiocBf7uFV
	 oqA2dWxNmhFTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D744AC73FEB;
	Thu, 15 Sep 2022 20:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166327321680.27590.10824538008058593399.git-patchwork-summary@kernel.org>
Date: Thu, 15 Sep 2022 20:20:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 6.0, 2nd round
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676391
  Lore link: https://lore.kernel.org/r/20220913025043.GH1728671@dragon

Patch: [GIT,PULL] AT91 fixes for 6.0 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677280
  Lore link: https://lore.kernel.org/r/20220915105833.4159850-1-claudiu.beznea@microchip.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


