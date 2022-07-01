Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E044C43334
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D252BC341CD; Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC198C3411E
	for <soc@kernel.org>; Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708059;
	bh=gaqHDkqF8lfqNow8LcHPF8EBbIoDNuLgcZXIFuKhYZ0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=sJWd0UW0nYjnogZZKI5fWG5p8LGd5Zxe5vFGM1ac63wptRlPNQw04W2O+u1YpePVI
	 VzKkuAEmh7t/uCcv+HhVBUE6GaCuuepsvnXC+f0xGVFwmZtVoFFoDAvKfLg8E2tqI/
	 MTkkVLQVS0Iq6TxbLTrEzGLdS5sQl2KPAoEypHyy8bLv3vF+VPAu/n58t8haNGhBXa
	 zBwhYBf7Cek1TMr9bPrGlcQmDUZgeNIw29Pjc0NQa+iAB+RosBqL6FBQTSZL6AWCyw
	 sx26eCwoNQsYo1UuolesEWuRRtGaizm6cSwr9Y3fAHRt16WDJ2stUwD03s+4atCHv/
	 myfAmzw5TiZ8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B399E49BB8;
	Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670805949.26141.2718888962363076151.git-patchwork-summary@kernel.org>
Date: Fri, 01 Jul 2022 20:40:59 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 5.19, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=654825
  Lore link: https://lore.kernel.org/r/20220629021244.GL819983@dragon

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.19(Round 2)
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=654620
  Lore link: https://lore.kernel.org/r/20220628133315.699803-1-sudeep.holla@arm.com

Patch: soc: ixp4xx/npe: Fix unused match warning
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=653888
  Lore link: https://lore.kernel.org/r/20220626074315.61209-1-linus.walleij@linaro.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


