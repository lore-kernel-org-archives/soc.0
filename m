Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37910C77B7A
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0934CC433EF; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6EB0C433D2
	for <soc@kernel.org>; Thu, 25 May 2023 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685029638;
	bh=GGTMb4UVw9dAseuEZsYMVRxE+OXcyp+DOrm0qID2GCk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=BZajVA8FwHtoAvM56z3onPv7oElAos+h1jsx96H/3i/oBvM0lKlt3iHMjicVPuzSC
	 2IAkp4JAY98fL6CjTXPRfNctecvdE1C0RbJUqwzE08pGyzHdzs/o3oUbUwNZsM3Clr
	 flAO1S2ZZh7Fj0HdPWfKRsqxDqmm/Mgm12ubJ6sK1QSBTryabYczEU1+gcd71aoJlO
	 iQvG1fUQICWPlv8dqlrYkQSfw0u+jGv8MOJUBy/14jVzvwReBuDcJzo1CBG8WBq8bJ
	 YbBGYgbxGyTzXnjDmudh6Kt9Ec6SEJtWuvcOK9I0JCWzoAzNS0+7Yq34EEB0ToRvFt
	 i4ri5ElKYt7rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C7CC0C395DF;
	Thu, 25 May 2023 15:47:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168502963871.27102.17105434820624919434.git-patchwork-summary@kernel.org>
Date: Thu, 25 May 2023 15:47:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Fix uninitialized variable in OP-TEE driver for v6.3
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=742003
  Lore link: https://lore.kernel.org/r/20230421075443.GA3136581@rayden

Patch: [GIT,PULL] arm/arm64: dts: Fixes for v6.4
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=746145
  Lore link: https://lore.kernel.org/r/20230509143508.1188786-1-sudeep.holla@arm.com

Patch: [GIT,PULL] firmware: arm_scmi: Fix for v6.4
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=746146
  Lore link: https://lore.kernel.org/r/20230509143529.1188812-1-sudeep.holla@arm.com

Patch: [v2] MAINTAINERS: update arm64 Microchip entries
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=749682
  Lore link: https://lore.kernel.org/r/20230522-wagon-stencil-a164ec39322a@wendy

Patch: [GIT,PULL] i.MX fixes for 6.4
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=748008
  Lore link: https://lore.kernel.org/r/20230516133625.GI767028@dragon


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


