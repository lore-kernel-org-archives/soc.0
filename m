Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E391EC433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AADDAC341CD; Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95283C341CB
	for <soc@kernel.org>; Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657314614;
	bh=CsG3eq6CchtGntRvd8p7JS1CEzmzaY+jMViuQ5TyKSY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=b59rr/qV2I6pRvW1RF0X5R7mDlW4xqfw+TyJJgSafvb+Q2aJAO6raOPFoT6m8+dQl
	 z0Km3mmUWafZG2G2GHrs961RbN8HvLB6ac6hpAX9L/JVkU6ws60o9CF9LUCClSLZI4
	 SePLctZarEacKHpOZ5TJ5EXRr8WrDQr/d9tyVE5ewAQTCXv7TKXwJlppy9WSRVih8y
	 4xB0++e91EePR1PEYcWxJyNhLqFKTaJvOAh/2gL91qc/Z7Jm3QH5aLCMo01c3xCUEs
	 8KnPWqNpOmQ5A/Vfj2ycaCgYmVYU4a++eBSFS63pnD8NejbqcTyMFvL7/p+Gk6Envg
	 5IMeF+BNIj2Og==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6A1E5E45BDB;
	Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165731461438.21745.16324398838158851919.git-patchwork-summary@kernel.org>
Date: Fri, 08 Jul 2022 21:10:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] AT91 fixes for v5.19 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657903
  Lore link: https://lore.kernel.org/r/20220708151621.860339-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL] TEE Fixes for v5.19
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657878
  Lore link: https://lore.kernel.org/r/20220708134607.GA901814@jade


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


