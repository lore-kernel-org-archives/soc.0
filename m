Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEE1E94126
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0BA7C433CD; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAE34C433CC
	for <soc@kernel.org>; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626685;
	bh=1WJzsDyUD2812zM0D8BAAq3O7f0jSYjbRiL56q6rzig=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=eEMhTyz5mbuPV7VQyyo+qn/Dl+pfM8W7Gxmxjklgw/q/pH6dadNHsZodRvow7oxUo
	 V9+W0uFibVfrKJEhdlnnscAUjya9K4hCe+suHfK9m9wXy9y+vbwZ11pljMnptcPc1D
	 TxL/r24gVPsa7e6oVp06zeMX+jkFo4tXU/pcvWqug40T9FFXjK/ChAuHFSv+Fvb7nO
	 KJg6Xf1DMUb6f8r6+kLHNP49AY8J9xqbmLQu18hjRrAtVdcV0tHy2ObWaeIgBQmi8G
	 ODZp2hlSgCtyvSuqJ4kwa8gPgL0AzhHGTkNrQrWzrwd0SKlHSUR9E82aoopsj49Hol
	 Y/PfeQJw/pHBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 994C8E632D2;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169662668562.6539.11093223390171151008.git-patchwork-summary@kernel.org>
Date: Fri, 06 Oct 2023 21:11:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Renesas fixes for v6.6
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=790513
  Lore link: https://lore.kernel.org/r/cover.1696578170.git.geert+renesas@glider.be

Patch: [GIT,PULL] AMDTEE fix for v6.6
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=789662
  Lore link: https://lore.kernel.org/r/20231003171835.GA669924@rayden


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


