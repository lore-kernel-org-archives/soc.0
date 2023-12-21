Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8A8C46CCD
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9B8DC433C8; Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9E21C433CA;
	Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180434;
	bh=hz6w/xTs/kGqV6tyJObVKZrKji0tI+SYQgMIadMUg/U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oAR5a/Ch+thBxg/laThz6qjNfF4x4aBn7gyFkFDkdu+11i+WkgiH/iOdIXjuJZzvK
	 E2P2REHAPUOdrZVHNtcBh4GDm9SpoOTXfyUlOl+Lx8rYW57ccbjfCvTtXQ2zENnqdB
	 6GJEXJjOL5YR0sB+gF9TguipGp1AXhRvb3h/l/vQaFMPwQyaRHhN9d4NJEV1Ma9zER
	 DQo6dTWWNKloDvM/0Agl+A2yRbyCuhBQtfZhtCgR3iO3ZTqgyJ46nM2eks1zAGQB1P
	 orqF65UUrhxVojZ0rICPu0Hw1L9yQSwhKvNKOxW8o3zOzWJcPAYfOJep1WadRBA2ub
	 1TcUZGeRBliGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C12EDD4EF3;
	Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix for am335x usb boot hang
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318043463.3302.9041191824164467811.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:40:34 +0000
References: <pull-1703071616-395333@atomide.com>
In-Reply-To: <pull-1703071616-395333@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Dec 2023 13:30:14 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit c72b9c33ef9695ad7ce7a6eb39a9df8a01b70796:
> 
>   ARM: OMAP2+: Fix null pointer dereference and memory leak in omap_soc_device_init (2023-11-30 13:57:00 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix for am335x usb boot hang
    https://git.kernel.org/soc/soc/c/02350805eeb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


