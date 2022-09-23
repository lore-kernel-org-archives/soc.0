Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DE6C6FA98
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D6D9C43150; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57BB3C4314C;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=vvDvyqTJNxy2u0SC9g8wZCbym9aFNm/cu9kKHTrqivA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KMfF8ToHWwMbdREXFq6UuLaaUwxn53ARxpwh0q6Li3dCgss2H3xvBa1srWSQiPCWc
	 0bPxEshvdXhPTYiYi0ctspNvroYij2+X+Thyqh5L+d/7iC9s9+/lyK4j2Z5yn1EWae
	 L6YfaMPI2OIoVrTvP65RsLlGev0qfgJY6eE8YxPprctUUZIUHo8z6pFIuDBCKGJl6U
	 5bbQnaYZwtEKX0Tfo3ohKltuNssWsMXylDdi299TeXfzADzpWBYsmbkWWLf1l0mvKx
	 SmbXFOvqDjmF1J9CqmHxE2v2ufOgxx/9KVTfe2f0TU2Dj7vObJVs8izaC3xPAC1+6E
	 iA2QUY+aBJx0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47307E50D70;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TI K3 device tree updates for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472828.12526.522782908196478179.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:52:08 +0000
References: <44729b46-27f9-94a0-17ed-8868649a4a0a@ti.com>
In-Reply-To: <44729b46-27f9-94a0-17ed-8868649a4a0a@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Sep 2022 19:47:21 +0530 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TI K3 device tree updates for v6.1
    https://git.kernel.org/soc/soc/c/aa577af3de3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


