Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E55C3DA4D
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 753C0C4AF19; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DF23C4AF10;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=/hJMbXaJ3Sj/6mszG9zHDFLkVtQKNHrPA4I3UtLkGQo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LSAUzzg8Y+HSRvCDR/BviNp4oefebexv1NBIRlCGixsWxBnJwtLEgJcnPZJaxBidu
	 RS297bm1xoYtoqV3cEF8ZomiMwOY+x60WLd6wxdqqFlyY6TvtnbbN0lk8htaLx9nKk
	 JTMSkwK2xjQrbXTpkBs3S5Smy62Sn8umxORquHP4BlYMv5S5/NvpojWkXqh+TAX8Xo
	 UoM9dGB6E3TaBYXTiMI5gaM1lH9wViFOcUhFPsGkwq21gnamDUTDQucIjGExGuUZk3
	 FXx1xxpKNpwmgk9JEsnLNF7gn6QjoOQkN0iJHqiyqCtZvqe/hPISMCDJX/gzWtWtsA
	 lIEKkqUqzhiMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 512A2DF3715;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V cache drivers for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743832.12156.6897387383124270654.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <20240707-whoever-undesired-c5f6e96ae403@spud>
In-Reply-To: <20240707-whoever-undesired-c5f6e96ae403@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 7 Jul 2024 18:27:42 +0100 you wrote:
> Hey Arnd,
> 
> Another attempt 2 with a fixed $subject.
> 
> Please pull the addition of a new cache driver.
> 
> There's a wee maintainers update in here too, I put the series on this
> branch as one patch is cache related and I have no soc driver patches.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V cache drivers for v6.11
    https://git.kernel.org/soc/soc/c/9e6b81559330

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


