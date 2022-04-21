Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D089C433EF
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 15:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A4B6C385AB; Thu, 21 Apr 2022 15:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 049F8C385A5
	for <soc@kernel.org>; Thu, 21 Apr 2022 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650555063;
	bh=vfVqm4bz+jPGB40gt6S1zsTQ8JE7bgGkcfD/TD2KRdU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=XRe7Nd0oc0GeroweUfoftrauHyC1V2e5JohdYLCC2X9s9Pq2psJPtTR0tRQkDZXam
	 vgh54MbEwHT7VkQRqSlbh3uAafUBXb2hSz1T6GFFaiF4N9AthaAqrbXxElC2WVehem
	 onlJZCNI7eFmJJ1TODtBcIs+KSJLvVprvgdmcSB9WSVJRNTtRjSf2fEzsAMb5anATq
	 bhZToKwa9krbbhHQo92lW0UG609ziKcZDbHr89aCbzTO+xmgnMwYtFjI90UbQ1TAPC
	 CmflPebx5uMcjqAr+F+GpKH362v6UBur3jN3Qx5xgWxrol5DWsKUdexWZzfxWvpbjw
	 WOBNejh6rXhCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E32E2E8DBD4;
	Thu, 21 Apr 2022 15:31:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165055506292.23603.15391884797434810056.git-patchwork-summary@kernel.org>
Date: Thu, 21 Apr 2022 15:31:02 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=634143
  Lore link: https://lore.kernel.org/r/pull-1650543308-836725@atomide.com

Patch: [GIT,PULL] ARM: SoC fixes for 5.18, part 2
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=632812
  Lore link: https://lore.kernel.org/r/CAK8P3a1ZGJJCrEzg_68XJmPA_Ajk0TmfayBn2Li2J8Zau0hPNg@mail.gmail.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


