Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0180C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:21:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 907306103C; Mon, 11 Oct 2021 10:21:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7ABA260F5B
	for <soc@kernel.org>; Mon, 11 Oct 2021 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633947663;
	bh=JlMhIYcvrygcWtgxnYzC4iJacDlxtBGivOYr9w3EuWU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=rXkpdNrICLN5fdwbxyOBQbR2p4jg2h5sUROJvfDpd5LNDufOJd5vdae2YhY1ur8oD
	 sJNTJFc38/mubiKYcW6V2YcQp6w92oTTMMXqDFKJoXuDR0cIonGK1fuOLZzjlfDkn7
	 YkJXj/ekGBFMHV3AarBIC1FBRHDgsVbms9YlSevEEXUlteFKFYUr7ZX6DUJbZ3lRTt
	 Ai8Buo64zLfNXvBE6OQ1izRsrAtG9xvZx59ioCwEAk0skdjs+kldiDYu2Nfcx5xmLv
	 ByyjCcDU/tx9BuCh7s8vBGSGqmLqiezFFlrCX5GHMMwSXhc+50LDRbypIFyJ5RNwk4
	 LlfbiVYTrMr+Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 73F3E608FC;
	Mon, 11 Oct 2021 10:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163394766347.9012.3431787772543490955.git-patchwork-summary@kernel.org>
Date: Mon, 11 Oct 2021 10:21:03 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_ffa: Fixes for v5.15
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=558587
  Lore link: https://lore.kernel.org/r/20211006153231.4061789-1-sudeep.holla@arm.com


Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


