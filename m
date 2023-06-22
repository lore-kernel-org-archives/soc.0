Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D71C0015E
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64A80C433B8; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CC38C43397;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=VC0pOqrx4PR38qyvpoPQ0+lGFsG/fzp6KVAD5JmHl+I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=n/kR9uqCKcRozZWceRPSpkibKbrEMMVKh8mzaW9J9E9KWZmv5qWcGuOpfX2jgBEkh
	 +Vv7rWJYH4nMP/6LyJJFL2/Fgxb+QZA8FqUiPVGLimr/O67ZL4/uP5n9S86eeamn1m
	 zPu4iru3zq7pJgiTAdFUwPZrP727lU1gDsW97iF2MEjGn4Tj8W8OohdtC/WnvVa20z
	 VSbHpxtgXoRJW6R+1xtq0CkUYA3jA2BiCnP/I3uiYN0Ujs+yiB5Tm6Fyj+SOA9Neja
	 PAFaUjtaHCn2hi/HKZ/JD8jeddfJjGyjop0kl179F2fg/IrIOSo+5iqUvrVM53dnRZ
	 v2wwCvItzgN7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30EAFC73FE1;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic late Drivers updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745023017.12309.1785841964986206200.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:30 +0000
References: <a10ea420-7599-3f41-dfd8-1742ef436ca0@linaro.org>
In-Reply-To: <a10ea420-7599-3f41-dfd8-1742ef436ca0@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 22 Jun 2023 10:10:52 +0200 you wrote:
> Hi,
> 
> Here's a late Amlogic Drivers changeset for v6.5, with includes
> a low priority fix for secure-pwrc, a MAINTAINERS fix and a bindings yaml
> conversion patch that were lying on the lists for too long.
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic late Drivers updates for v6.5
    https://git.kernel.org/soc/soc/c/3a00b1c40626

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


