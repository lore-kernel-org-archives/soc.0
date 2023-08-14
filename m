Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623F8C04FE2
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AC34C433B7; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DA87C433AB;
	Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692033027;
	bh=Hlo/TgtSke+aClxfT18FqQqT6RRaem2AT5tX0cQ/tX0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JXp983QLyYbUosg5dQX3shAJSBgan26+V6esFM7XUQZPNvDH/cdsdSwICpMwp/wwY
	 SWPBzfpXTU2Oj6RQUzT7BngKmeqPQmc/9N8dagsuztkGzOZgF8JZWJt7kGs/4GhaMy
	 KGCeSKgwVIbyCqhp0daf67FzkpG+ryRFE/r77gI6/btTvnR5N+PHTWy6FKIw7YcC4d
	 Q53+vNJJxuV/NB515quQLewJFV9zf6waFYK9sJSqwMi1xReftaqoqSEZEECf9qN9VE
	 kgq+usZ4uK9A9aeRb7sgBo87yeZQV7VxbigRqzHo/xYlbuEivoKc/uZTqcl8Jsy8PZ
	 tEIuYdapMO4aQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EFD79E93B3B;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.6 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169203302697.15030.13892184464494896013.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 17:10:26 +0000
References: <87h6p4t0lv.fsf@BL-laptop>
In-Reply-To: <87h6p4t0lv.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 12 Aug 2023 23:25:00 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v6.6.
> 
> Gregory
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v6.6 (#1)
    https://git.kernel.org/soc/soc/c/eeb751c41060

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


