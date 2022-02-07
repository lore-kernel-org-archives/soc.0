Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC545C433EF
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96B4CC340F0; Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81B6DC004E1
	for <soc@kernel.org>; Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644244357;
	bh=syhrzNhjW03mJtyLtRngmjd+CjGDVSJuQKEbayRFaQA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=msaP9K+aRcWpuS7ljsB43tuksLhSaUzFoPyBfs+Jm4hcFYe84WxGJNX75cPZMAdFM
	 wRnLR0vzwBsN5Y+YNcxpKXHdxKaJGrgrT2TccEKOBua/2NH+7y/XNpJqaH4YaYaVH/
	 X2M+SDyNrwnIsNaNm5wWFA0bRXjgx4Ksp/0B+pS6ixfPUWfNNCnb+gmemJf8i9T6BR
	 ahRQOggQL95L+aOe+SAXZyuimTv7npNjyfgjZa1LgJekeWw47ngyz5eSSihel+bRjE
	 8+5FK+Eimw3JXeYBc87e/60NHKQ2liS851qPPOcnMb+50J/FMk4dVc9YNUq4AU6lg4
	 nNutQbCf0UGTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 66B07E5D09D;
	Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164424435734.21264.12723716518733584781.git-patchwork-summary@kernel.org>
Date: Mon, 07 Feb 2022 14:32:37 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: SoC changes for 5.17
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=601110
  Lore link: https://lore.kernel.org/r/CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com
    Patches: [GIT,PULL,1/5] ARM: SoC updates for v5.17
             [GIT,PULL,2/5] ARM: defconfig updates for 5.17
             [GIT,PULL,3/5] ARM: SoC driver updates for v5.17
             [GIT,PULL,4/5] ARM: SoC devicetree changes for v5.17
             [GIT,PULL,5/5] SoC: Add support for StarFive JH7100 RISC-V SoC

Patch: [GIT,PULL] SoC: Fixes for 5.16, part 4
  Submitter: Olof Johansson <olof@lixom.net>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=603809
  Lore link: https://lore.kernel.org/r/20220108202011.GA1760@lx2k


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


