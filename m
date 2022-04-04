Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A61C433F5
	for <soc@archiver.kernel.org>; Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B09FC34110; Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75D12C2BBE4
	for <soc@kernel.org>; Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649077547;
	bh=pRBGMgB6p3qZjk8jaGzny37kQZujZXLPRCZ0z69hRqY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=pTUDgLTRlBnhRzSVSsKEJfx5/gYq7rLZwgC5OPzkvG/2hwvVm0bH9SbXH7PBPB79T
	 6lkrtnqNLWGTlekRw/zOMUd4IAUPE5BvLz5l2krIWbl5ut2Mi2p2ZJoo1FcNpUyrDq
	 kHoHom/oz77Du9OkRYrJmfvfVxHZvrCJGiqH8pHDmmqaB5qrc514pWDTPW9rw+gDnl
	 MmoBbqHSqUQ2L0qvn/T+/tdBRIPnEiRctcB2AXMS94cx5oJZoFFeZdIfiAKlYn30Ze
	 u2y+/BormDTMeGlzS39AUnTPt0QxGahlQhBYqd0wBjz88SofDkN/vMOE5DpMT8H6kH
	 Ct3cYHtooYFnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50009E85B8C;
	Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164907754721.14449.3735328541745146913.git-patchwork-summary@kernel.org>
Date: Mon, 04 Apr 2022 13:05:47 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: ARM: SoC tree changes for 5.18
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=625879
  Lore link: https://lore.kernel.org/r/CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com
    Patches: [GIT,PULL,1/4] ARM: defconfig updates for 5.18
             [GIT,PULL,2/4] ARM: SoC updates for 5.18
             [GIT,PULL,3/4] ARM: driver updates for 5.18
             [GIT,PULL,4/4] ARM: DT updates for 5.18

Patch: [GIT,PULL] SoC: fixes for 5.18, part 1
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=628140
  Lore link: https://lore.kernel.org/r/CAK8P3a22UV+zTMjSVdWxbVK+G1styc6KqR4o1B9FE=oByYzRwQ@mail.gmail.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


