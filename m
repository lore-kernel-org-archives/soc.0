Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912E7CE7B05
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BA9FC433CC; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 561CFC433C7
	for <soc@kernel.org>; Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888103;
	bh=jcYLYKtNQwX9FmpSu87wfnx9TPaMF92a6fIEl20adao=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=cP5WGddvCMhO3A3U2CSBI+3jWXYsb4ZNd8ofNXsQo+lx1SczjQd6aC2aLShidnS37
	 eRdyVE1pTIinsIkO6BFrkOgHXpsFeQ6smvDEkXRa4HPNR3VqhN9OFUaaTEKYgEZo/P
	 oIHFrZF2+NjS8WvzE5TiT3T34wxyBcYcPotUhn6tb6GsD/woB/6OSzewwxh2AlAj3l
	 HwZs+niPxSjOwdQ/HlUQPQwcLEwVELDvGrwVh/3mN52UxZ/LSmudlldtgmwYqE6AWn
	 vuPOQgY5fNlFYjpiiWb3C1TCHU7BxewRWslokkqKoFSJVSCjZzVIqqkpYOv4kr9/c+
	 7guD97DiC0Bog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41C17E29AFE;
	Thu, 28 Sep 2023 08:01:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588810325.3136.4366560338713104625.git-patchwork-summary@kernel.org>
Date: Thu, 28 Sep 2023 08:01:43 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_ffa: Fix for v6.6
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788086
  Lore link: https://lore.kernel.org/r/20230927121555.158619-1-sudeep.holla@arm.com

Series: Add AMD Pensando Elba Device Tree
  Submitter: Brad Larson <blarson@amd.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787404
  Lore link: https://lore.kernel.org/r/20230925195610.47971-1-blarson@amd.com
    Patches: [1/4] dt-bindings: arm: add AMD Pensando boards
             [2/4] MAINTAINERS: Add entry for AMD PENSANDO
             [3/4] arm64: Add config for AMD Pensando SoC platforms
             [4/4] arm64: dts: Add AMD Pensando Elba SoC support

Patch: ARM: defconfig: cleanup orphaned CONFIGs
  Submitter: Trevor Woerner <twoerner@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=785614
  Lore link: https://lore.kernel.org/r/20230919125112.15515-1-twoerner@gmail.com

Patch: [GIT,PULL] firmware: arm_scmi: Fix for v6.6
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788087
  Lore link: https://lore.kernel.org/r/20230927121604.158645-1-sudeep.holla@arm.com


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


