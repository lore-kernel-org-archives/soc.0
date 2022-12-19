Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C98C4332F
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1C3CC433F0; Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C15EC433EF
	for <soc@kernel.org>; Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465642;
	bh=SiTHRhIql1dHOFUPJGv1T+cW5WrsgHBJnRXWHn8JkZ0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=j0gXAQ/Bxvmtr+9pXMi/QaW1fQw/dGRXXj0Y6d+0bdB2VD81I8+8YnhgFD7zb8jNE
	 Dwcdic7vNjSKnlTO4n6qjxZKP6Xgpax16MWKJ6Vndztd5BlTdBqtWybTsuhkAaIx6r
	 KWDbqR7pU6HhXuwanTOuFruPc08XsVJ/6ixAARmyFzv1eblnAELz1+AXWottq+js+h
	 FmPInWY9eD0D8dzu8CPlmWZmukB8FarnZMyFBtyyfjcPJzSldnWJeUBjs10RcRBaS8
	 4zV4vZ+iHLgyl/dZZxNVE0FqHI1fseiFtg8VZ9HOAFmkoC4qN1SDqQAljSaj+jRe4n
	 5O3kmuMpNZLKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78BCAC00445;
	Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146564249.24111.13405204935497873145.git-patchwork-summary@kernel.org>
Date: Mon, 19 Dec 2022 16:00:42 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: fixes for v6.1
  Submitter: Matthias Brugger <mbrugger@suse.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=705067
  Lore link: https://lore.kernel.org/r/af4c45ce-a150-438f-dab4-e47b120c32c4@suse.com

Patch: [GIT,PULL] soc: mediatek: fixes for v6.1
  Submitter: Matthias Brugger <mbrugger@suse.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=705068
  Lore link: https://lore.kernel.org/r/29c8b913-53cf-096f-fe44-832ceaeac116@suse.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


