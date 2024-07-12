Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FB6C3DA4D
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 10:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17658C4AF0B; Fri, 12 Jul 2024 10:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3F9DC32782
	for <soc@kernel.org>; Fri, 12 Jul 2024 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720779631;
	bh=7Q+f7UWDzqxSk9uWMmNrG7nsxtA/GiMT0JpvHj2zuKQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=DCG0zBeJC7/gGZNPxhJ6DatmUyqvczVK5dG1/hms6FnQ81AQ6qSeIml6Wwmk0e65W
	 b/B3e9IUS7wjKPWpKBxj3JDd7iJo8MsIb6BjU//AivcZGZVD8d4/C6UFFUAOPHOp97
	 phKjzi2esuEarYna0/kjk7Va0uPkGT9ntQczQKxpMGaWHI8H5DOuWUs/YghhhxZm1a
	 UZAKkl+9LN32iMQY485O9B7e5UyfijGZ5cT9M26k7HE5I2nL1TYZvRsb3JIuyHHp9w
	 PFdBd2AeOEtYbE2momgRpQdqMURCPmlAvv8zK+ETFlz8ujRZwpRzrS6MgYJlhjWQKS
	 cOiQ67+p3r1pA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DA421C433E9;
	Fri, 12 Jul 2024 10:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172077963082.4770.15610891536046518679.git-patchwork-summary@kernel.org>
Date: Fri, 12 Jul 2024 10:20:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Allwinner SoC device tree changes for 6.11 part 2
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=870203
  Lore link: https://lore.kernel.org/r/Zo7O73Afx7lZcBRi@wens.tw

Patch: [GIT,PULL] Allwinner SoC driver changes for 6.11 part 2
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=870208
  Lore link: https://lore.kernel.org/r/Zo7T4YsfamN0PbYK@wens.tw


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


