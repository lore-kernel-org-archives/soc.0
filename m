Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D9FC54EBE
	for <soc@archiver.kernel.org>; Mon, 16 Jan 2023 10:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5835C43392; Mon, 16 Jan 2023 10:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE9A4C433F0
	for <soc@kernel.org>; Mon, 16 Jan 2023 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673864417;
	bh=xs2iuuZApiAgcu9v91Z56BcWa6Lt5S9hc8172Q91ADo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=NCKs84FhoMIMuAQgQf0eZxCqqec+JzVa9qKQj+BqjjPmA5mcXFYVE9CcIehw1bl3T
	 5ypZNdGoAC8AARB2ePUtkqvRIfyMr8vmJyAOk5FDamE4BkOgC/ST1qtuVZ1eY1KT15
	 J+yWpEV85TibstrfdcT4Um2yLEDiMvWfuB1+RqI2aiVJDIDrUD3RZktVaRGVV+RV+j
	 50PS+5J02mOlFKLltQdQS688hELf3iG/Y5jwA7BxJklNVsGPME9LILmogtZV9F5/+j
	 r/J7HxEqNaxJke/PzdafZyExOFfSEGq+7wL41F/E4SKootsFhvSIyB2seLcY+SL+LU
	 m7miNRZq4Fmmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BAA4E54D27;
	Mon, 16 Jan 2023 10:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167386441751.5760.13155195718639228808.git-patchwork-summary@kernel.org>
Date: Mon, 16 Jan 2023 10:20:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V DT for v6.2-rc4
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=711125
  Lore link: https://lore.kernel.org/r/Y78rn+0fVNOxHLKt@spud

Patch: [GIT,PULL] ARM: mvebu: fixes for v6.2 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=711730
  Lore link: https://lore.kernel.org/r/87mt6mg08k.fsf@BL-laptop


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


