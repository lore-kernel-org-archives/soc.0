Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFA0C7113C
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFF08C4CEC2; Wed, 28 Aug 2024 20:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9809C4CEC0
	for <soc@kernel.org>; Wed, 28 Aug 2024 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877788;
	bh=dKTRnJ3ykWoQEkdzZlf2rjK6O4uiPBSnMwTJWeJCBMs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Txq4Ire5g5Idw3TSX+S3Wbl9CA+joKUCiGFZHZz1+u2VMW7U+aMelAg6N8LRXVfzf
	 LeJLSTq5fXidLp92P6Gg2w0FKxQpRTSpQAf6Xfu1FcytmnmjxGCu88R7XIUx3e2+5Z
	 KB9pRoJsNEt6br0gV1PZUCECEb33l7jwGidBCdnAGQ1KNMSSBEMc6weCSdj+SFAI/X
	 NWY5AFZip3RHTEckOdFjdOMHlloUCwk0EDNPQc/luCwTcMF2dGLFRHFMLgFrxiMMWp
	 Anu4+8i3JXQYlMYoD0qI6iZ7qhWgETBELJ+RcWnTl2uMs8nKY9rwTpOhHaAedUps1F
	 c7/w/FWuyg17g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345473809A80;
	Wed, 28 Aug 2024 20:43:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487778871.1420116.2676746298222834521.git-patchwork-summary@kernel.org>
Date: Wed, 28 Aug 2024 20:43:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm driver fixes for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=883388
  Lore link: https://lore.kernel.org/r/20240826145209.1646159-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V soc driver fixes for v6.11-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=884358
  Lore link: https://lore.kernel.org/r/20240828-fidelity-almighty-18d5434aaef0@spud

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=883411
  Lore link: https://lore.kernel.org/r/20240826152426.1648383-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm Arm64 defconfig fix for 6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=883392
  Lore link: https://lore.kernel.org/r/20240826145736.1646729-1-andersson@kernel.org

Patch: [GIT,PULL] OMAP fixes for v6.11-rc
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=881499
  Lore link: https://lore.kernel.org/r/7h4j7eyhyh.fsf@baylibre.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


