Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF89C433FE
	for <soc@archiver.kernel.org>; Thu, 12 May 2022 20:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 785DFC34118; Thu, 12 May 2022 20:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A503C385B8
	for <soc@kernel.org>; Thu, 12 May 2022 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652388020;
	bh=zzfNtIuMcNfJD887fYjDmSoldqtTBR/vQT3JtEVtu1A=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=gruhwGD5Q53ZKgiEStVInuSJubGT+F2z4v2B9pG8cP8iabD4GoqFtCM6kLVZfoHNY
	 bW58SP+lIn4+84ZMIjbZ6u50hvtSKStv2bbtTRqzbPcvKoUsNxg3WY6J9XPcrKAXup
	 kVxbaBF+Emzw8GbMW+Fe5Tp0MLyRfp1P8D7MURIxDR275RXg23EoNhsIELTagO7Kua
	 QgNhdSqFUkfb8LTSzpZY1slHYfZh92q/NmqDsZoCl3KLhOb2354jYoJEsy9/SisYeg
	 iaHmGE5E3fS8Oubi1eecTELgUprTTu3NpKPIGv55jUzXrjO0j/XAHlt26fJFHL3NM+
	 DLznLbpRtMVoQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4245AF0392C;
	Thu, 12 May 2022 20:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165238802026.21441.8312610831488835850.git-patchwork-summary@kernel.org>
Date: Thu, 12 May 2022 20:40:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/5] i.MX dt-bindings update for 5.19
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639455
  Lore link: https://lore.kernel.org/r/20220508033843.2773685-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/5] i.MX dt-bindings update for 5.19
             [GIT,PULL,3/5] i.MX ARM device tree update for 5.19
             [GIT,PULL,4/5] i.MX arm64 device tree update for 5.19

Patch: [GIT,PULL] Rockchip dts fixes for 5.18
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=640420
  Lore link: https://lore.kernel.org/r/2300256.NG923GbCHz@phil


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


