Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70217C7EE2D
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 311E5C4339C; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B581C433D2
	for <soc@kernel.org>; Thu, 25 May 2023 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685030320;
	bh=kkGYGumd+Y6IMb5+B69XNp13NN34BXxfQ+9rRFqUpe0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=CFurRAsgI/LrRtRz6BwXC7XW5SXifW+aYnCfdnikXNvXsZuve40FLTcokn9ufJ/Bk
	 3YZ8goZacrC3sv8b2YmO/SO/4fMhALqfaZjfeb0CXR1yQxuKnaMprn/QDk6PHtom3a
	 g3Ahp35Xq4A0vc1rSxpdywVOtC3gAaLPuTDKLFvQc2lOwlfG25eTeuFJ11x6aheUKv
	 BaWAXUss/IbwZJ9VMiH8kTkdxjdordGmDidGnadH/1nb6NVFghlA0waiA9shKaRm6M
	 UBvJNbb0WKYdDhYS0WpoE6G/OkrqcNleRY/t33xm1U4/QEPPAm2cc6CHRNJAlM9nqO
	 GYqkctamgHqbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC581C4166F;
	Thu, 25 May 2023 15:58:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168503031989.27102.13248340711565359617.git-patchwork-summary@kernel.org>
Date: Thu, 25 May 2023 15:58:39 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

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

Patch: [GIT,PULL] i.MX fixes for 6.4
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=748008
  Lore link: https://lore.kernel.org/r/20230516133625.GI767028@dragon


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


