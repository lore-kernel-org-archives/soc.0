Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795FEC636D4
	for <soc@archiver.kernel.org>; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 494CCC4339C; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33551C433EF
	for <soc@kernel.org>; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676470820;
	bh=V61rCrP/WqJqWipq7VM4YTQ/wXm78gke5C+CCgSmA4E=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=sRpQKfyqyVKiGaLwnhx3mhhZ3WVIhZtqGbwCbggwNAv1XpOS6mzlnhimcl1IN1f11
	 6Uy3kEtfitH5KWSvebvHcZnu+PGAdh2CE8LDz0dsZDPzCu7hHBLHnO7HGOxf1DmLU6
	 6BJ24VyDUlibqArjO70xpWIfOmCjv7W29wPIqB7P7ykoKL6bZEb5G6PIh4UaciwOKb
	 fb7K4e9fglNVHj1NaEJL/Cd+u+kolxHUc9566BIowAxl9o+QdGC+llujuyO70TRq3V
	 dSFkq6SHp/s1yXF1cqHsqjAYN2XvfcW4+runlzNQdlbHV0vnWSHVwL8bpiCMWNt7U8
	 Qe8bq7On1QLMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0BD9AC41676;
	Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167647081992.22208.740234508371492191.git-patchwork-summary@kernel.org>
Date: Wed, 15 Feb 2023 14:20:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Last set of Qualcomm ARM64 DTS updates for v6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=721986
  Lore link: https://lore.kernel.org/r/20230215051530.1165953-1-andersson@kernel.org

Patch: [GIT,PULL] One more Qualcomm driver update for 6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=721977
  Lore link: https://lore.kernel.org/r/20230215043658.1156472-1-andersson@kernel.org

Patch: [GIT,PULL] Few more Qualcomm ARM64 defconfig updates for v6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=721990
  Lore link: https://lore.kernel.org/r/20230215051757.1166709-1-andersson@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


