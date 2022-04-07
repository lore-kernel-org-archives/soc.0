Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBF1C4332F
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F0BBC385A7; Thu,  7 Apr 2022 12:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19C53C385A4
	for <soc@kernel.org>; Thu,  7 Apr 2022 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649335811;
	bh=AIKWeAomkkXzbCSPCpk11vahkhccKenBUq2bCRJtYvI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=mSbIQiZjhKm3rvO1PLNW3ybudRNa16IeJhsCl5dgxB1r2QEW6ofLyqkk0JeBbifR8
	 6/icKv8iOwY2QlErJEcOCHlKCy1zkXa/Dk8YV0Y/FeQq0EXpywa45WO//fMpt7Inz9
	 KP9ayfx0jE9S7UqgiU0alUXrRIReswwzV7WyGfpyxwgXhYxJMN2rVnGfTwxlaFKyo4
	 JAtBUaobKY08nRL8yVY4EcG/57vVP+7O1ZQDWrMIL5mgHO+O4mLU1iyvGfgKabE1n8
	 E44EW9FZmXW0akZm/Qkfo3ny9xJR8GPxgltFErdGSX7udnGCOnNOpzaszXEu4a8Rrk
	 L4/ObF4ixCTUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E697DE85B8C;
	Thu,  7 Apr 2022 12:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933581089.7761.653481725626955729.git-patchwork-summary@kernel.org>
Date: Thu, 07 Apr 2022 12:50:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Reset controller fixes for v5.18
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629587
  Lore link: https://lore.kernel.org/r/20220406153337.1265414-1-p.zabel@pengutronix.de


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


