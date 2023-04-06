Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52117C76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CC7EC433A4; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FC92C433A1
	for <soc@kernel.org>; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680816631;
	bh=GgzQ/XTKzGe0FaiB/ZMvyTplpxjDDQpSWrvPWjTJiQM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=TO19AHyrGHse65SlxM6Jjp/6BNTe73zSvKRG6jiEPc59SIyJNaS0BT19pNCrYTHiE
	 6eDa4owYt1huayMhFjWje5J5rBiZ7ZSItvas1mO0gjBzF3bov3IIJAfVO0jQ3N43Ji
	 vT8VSV0gnVUMOiNSdZWz1eCPrZuVuYeYEkAfSwubv8zgiZG/sC/urokn1bpMBXug3p
	 gI3ZWCq7c5ZgjJKEYXxv+6arPBkvMhSLOddDq+PNts6FxERYoa3EcGNM7wRBiu/mA/
	 O8kU0uCcWF3VBdI27AdAxEIV1xzrhEQnc1jAqY2C9uxeKu8wVxVDrcstwzzjefS5GM
	 lXS+5ZG8NxsZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08BA3C4167B;
	Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168081663102.18696.1464570615417181721.git-patchwork-summary@kernel.org>
Date: Thu, 06 Apr 2023 21:30:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX fixes for 6.3, 2nd round
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737423
  Lore link: https://lore.kernel.org/r/20230406021602.GP11367@dragon

Patch: [GIT,PULL] OP-TEE load for v6.4
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737042
  Lore link: https://lore.kernel.org/r/20230405062701.GA3391925@rayden

Patch: [GIT,PULL] RISC-V Devicetree fixes for v6.3-final
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737730
  Lore link: https://lore.kernel.org/r/20230406-negate-octagon-0fc2e47dbde5@spud


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


