Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161F7EE4980
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 047C2C4CEC6; Wed, 11 Sep 2024 09:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FBCC4CEC5;
	Wed, 11 Sep 2024 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726045230;
	bh=9EeRDuJf62r+pX8tkPxLZVRbQWHVpOWH5P7VFMbVBbk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TPdsEueZxV+0gC9imvHKUUdTXdvUZMHmb7sxBEHjXjSQTKcH0tBQRghn2h7ye6F4m
	 p9IKVuzzct0Hmf5NEIS4O1KP3DmmCWq9t3CSyzQ6SvhZWE8+t7ewUtbDbuOXF5WCvz
	 cWMQtBohT7/qIWCjAbvFP7uv+ftlTaiieDEpfgZEHeR2pbgsH3djtUoeR8f0+PpjLj
	 mkX1WnmdLSQfmtsT4D+UuqSCgpYpeS0xmtAn6PNsGkHqQMntbqMzBy6gO8+U63/QCk
	 aHQ7mUh5JIiegd7Vq458Bhq0D9UElQ8tuY5lVaWLZ0lDX0xn6Zbkbb+qu/MAKyQX3X
	 SX5qwrtWV1h7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B573822FA4;
	Wed, 11 Sep 2024 09:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc fixes for v6.11-final
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604523201.547769.12598544714625487965.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:00:32 +0000
References: <20240909-hybrid-groovy-601a33b5b309@spud>
In-Reply-To: <20240909-hybrid-groovy-601a33b5b309@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 9 Sep 2024 15:33:36 +0100 you wrote:
> Hey Arnd,
> 
> Here's the fix that was being discussed on IRC over the weekend.
> 
> Cheers,
> conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc fixes for v6.11-final
    https://git.kernel.org/soc/soc/c/0e7af99aef5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


