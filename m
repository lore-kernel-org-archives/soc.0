Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF89C77B7E
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43182C433D2; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25ED1C4339B;
	Thu, 25 May 2023 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685030320;
	bh=DI4uMyeWFPnIXmOJzydF50D8TCoz8/jyZ/ASoPY3+7g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FIGJXpUqkX5lriiBUnxl6e43JbXq/3vc80h1N7OfXJvQ6KmciGLXCCE9P8Aeour6c
	 wqzhHqfU0y//Qbbi74TZphivP9jtIpdbz+1bP/3sxurptheMtN6C4sa9m+Y0D3UmNq
	 Yrkp8kuT7A198kWMlp6i9qbw25Gfz2GDdcQh1g5QPEvzLDzK4mcKnOHzRRBuVVyv0i
	 F1un8P2QybDV3ZjAB2qB9hCG6r3ld8bHND2RsQXjMpFC9feCyVWk2nAONZ0PYqCG05
	 lPwMwDvyWKazkEsDA8Q23CWKzBMb005eB/fftnI1aeR+Ho6cZ/ZfuMmvRJHHoaLmrS
	 acQqCAOXhsASw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0E16CE4F138;
	Thu, 25 May 2023 15:58:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm/arm64: dts: Fixes for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168503032005.27102.5839195299230486732.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:58:40 +0000
References: <20230509143508.1188786-1-sudeep.holla@arm.com>
In-Reply-To: <20230509143508.1188786-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 May 2023 15:35:08 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm/arm64: dts: Fixes for v6.4
    https://git.kernel.org/soc/soc/c/d14b555c3354

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


