Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB98FC5475B
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 07:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 634DFC43394; Wed,  6 Mar 2024 07:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C14FC433C7
	for <soc@kernel.org>; Wed,  6 Mar 2024 07:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709708428;
	bh=TRqD7B/f1+n1jdb5vJ3T0XCDYdRxXWSNhMtirlMGzCY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ETI4dn6KBpXq+NCyXAYVSnwd//FIYXlWFWCtf5xBNo3YVvjdsBuabjVXiSYd4PPP7
	 t2R2N5XkYDVKTGjiUCRXAubd+qcgeN5U1uxxDBpogQX3zf2LwQTDOUl+s0AZpYozpt
	 Z2nQg8BIcOfn/9oUloAaO0+/fC9SsP9DJ1940TM2i45hayN9Qns1E2DGgNtXhEvjz2
	 goBOpu2VX0aWp789TZg0d+UX1QZNzsMUFZTfVc0PQMbZ7+ovYU28Xpu1/mpTjaCh40
	 VfhWOq02FGsLBdeFruO1KzLdDqLjj4EUzPPVEkK2FciIY6tIo1VmFp4/zOhnk42ysT
	 y0qrIgcQEB0AQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2596AD9A4B6;
	Wed,  6 Mar 2024 07:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170970842806.7525.15103012372936002287.git-patchwork-summary@kernel.org>
Date: Wed, 06 Mar 2024 07:00:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V firmware drivers for v6.9
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832694
  Lore link: https://lore.kernel.org/r/20240305-vicinity-dumpling-8943ef26f004@spud

Patch: [GIT,PULL] A few more Qualcomm Arm64 DeviceTree fixes for v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832796
  Lore link: https://lore.kernel.org/r/20240306031208.4218-1-andersson@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


