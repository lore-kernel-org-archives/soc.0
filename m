Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71326C4345F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41299C4AF18; Tue, 30 Apr 2024 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B367C2BBFC
	for <soc@kernel.org>; Tue, 30 Apr 2024 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484430;
	bh=+NF3ZhhMHW2LcmhtFkOhzsnM+41C6z9pZdNKZG50dEA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qIk/fXrjgbpzBCUE9QE0tkzFf9qzJhnLkjToJdN5g512W62+fvCIBARAwFuZ49PM3
	 exFPYhucoUm6cSBzVCyHv07AvB0rxen1rMbqu2j2MDDmgXZnEye2Np6ZB4D7l473yS
	 o+BmsbdQVvsaHaGXILkSEdW3xZyxPkLqsARdpqGBGIpHCxAGFfygofYZfluQ/rhlMc
	 Eem9pKnZTTf8cwcuyc3adUmaQa0TzTrFtzZ5BoQ85lDeWaxj4b+jniSNM+SirWo4uX
	 D+b6N2/ME5JQZhCq4xgvgcn/FmZctXDzrV11JZs1Wqf14qYGKrWIufyf58D7XypJAk
	 OnnmTx+WlUT3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 161D9C43616;
	Tue, 30 Apr 2024 13:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171448442999.21603.14448774765964157126.git-patchwork-summary@kernel.org>
Date: Tue, 30 Apr 2024 13:40:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V SoC driver fixes for v6.9-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848485
  Lore link: https://lore.kernel.org/r/20240427-unflawed-humorless-690472f9c5a0@spud


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


