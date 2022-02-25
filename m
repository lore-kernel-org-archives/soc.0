Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665A6C433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38683C340F2; Fri, 25 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 230C4C340E8
	for <soc@kernel.org>; Fri, 25 Feb 2022 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645821611;
	bh=/aeGnME0Tdufc/2BzT+LcicdL0BsSo5aIhLU+YEC6G8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JmmjY5zDOpH6XVkSUdDkYaZ/d+Qc9b6p4LO38i/1QcBTJaIKOc71IRlHMW01mb3xy
	 bmlwl8BbN5tq3iEbsQYmU2oB1fBTnlbTfyAkkR7KZt5EcDQvkrpdim3w13yhPOia97
	 vJc04x54l7FKcO7p6nLJw922dzZJBiWL3yM3/jlfDkDVbGLNwoVXp/+H1UIaovcAaw
	 JAoe9RjzxgOT6c3wnWFVN1okP71kjwUBKbOrL7Q/UvOpjkJBmQU9j6QmL7ayREI+/4
	 OBPZdfCs88JqWtxBKSMsbWozz+vro2nMhwbg21pvVXPjkayX8aisTZLkgcGwzATo7U
	 o/jNKx6NjvXTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2BB4E6D453;
	Fri, 25 Feb 2022 20:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164582161092.24382.11547621200348374094.git-patchwork-summary@kernel.org>
Date: Fri, 25 Feb 2022 20:40:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v5.18
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=613503
  Lore link: https://lore.kernel.org/r/cover.1644587197.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.18


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


