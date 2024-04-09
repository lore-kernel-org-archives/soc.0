Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA28DCD128A
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9399EC43399; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A00CC433F1;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712678195;
	bh=sCb0syeaGgjvIFLZsoYNZ0Go+z20ZttO5K6KRSwGHRU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FzMUZxmtIiye7249dqOxjbxmFPDh7oqkVb3VfrF4Ioi8QH+PWA5eeaMPDAFDI3qqT
	 0bzOXYjnITMlmIcPB4kBmMDow3p1SWzPKuUrwiMClQF3/MpSbONM/wzj7cLwbCEGxr
	 nU5M5LnKxf7UpvAOPkMh9lkCffmhZ91sKSwbNqRUweRfK76/wqq5F0fHPCG9qIM3aQ
	 xiK3ztHpjAkTBOQZqUPx0IXr3Fhz46etqRA6UVKF3mYGoSQo94y1eRZu+7+NQpIlbo
	 /h36663UhLU0WWUtN8WZocwWTwpq5ePyOahLJY3HxXXcJXnISKQmaAbPQxPcFfFdCY
	 8HQ5Y4+O87gfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6FBABD60312;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] GPIO regression fixes for n8x0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267819545.12038.797090207606980441.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:56:35 +0000
References: <pull-1712135932-125424@atomide.com>
In-Reply-To: <pull-1712135932-125424@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  3 Apr 2024 12:22:29 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] GPIO regression fixes for n8x0
    https://git.kernel.org/soc/soc/c/06bd7e4463c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


