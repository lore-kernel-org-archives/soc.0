Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FEAC433EF
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D65A8C36AF4; Sat,  8 Jan 2022 22:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0BA6C36AF2
	for <soc@kernel.org>; Sat,  8 Jan 2022 22:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679210;
	bh=jkQwxzWk/bH2E6EwASiULWaJVKuc1JALzmQVfD4QxzI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=D1GPqryoHDLYYjhB6bqRbhSN6FD0UbntTnBuxyRN0e2OH6D2IfPyllUCph3k84TL4
	 IMXQ0tGebdewEkbNgnT3bkABJB6eTn/JFR11ehc8MLEmTxGlLAdKqoAewzr8LeBA9C
	 MemwQUQUXv9zorsHYKY7rJWniJS4N0tsYA4J+zY4713IyZVO6RNM8D4qTC8MLm0tB+
	 s1tsBdFj5Jm0OoeBHEshmtnjpn44yI8DdT6U0NbQqAXXjahNkbyijbAtnmzRR5OKcf
	 4y6uz2M65ame55inqRCmInCJOZlhtOP8ZJdaHXor2tly8RuKneXGh8PsLPMRJRMTlw
	 Z6lBJXCMQkqYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90F72F79403;
	Sat,  8 Jan 2022 22:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921053.24856.15312127723292666338.git-patchwork-summary@kernel.org>
Date: Sat, 08 Jan 2022 22:00:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: dts: gpio-ranges property is now required
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=602663
  Lore link: https://lore.kernel.org/r/20220104170247.956760-1-linus.walleij@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


