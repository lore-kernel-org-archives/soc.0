Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F012C54E63
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 535A4C32788; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 387A9C3277C;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=3NS+jMUfF5abniZzMWVGBubE8YVBoiv5xKkEugGYB3k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YjlndQtC1fmz/NaDXvPJgM0NvMjgWjpX7B9kMDQf2T4q5lBaE+McA+zmVCx2EhPGn
	 FqPIyfk0/dZJmJ/jlNfWACv6jVI8iPiyhPh1U63l+QLk1+IiJAHO5wjx0l5cmQepwp
	 o5lso4aGMCoQEpu7h071YOiZbXen9v1m8OQWOVO9VYtQ2cZp+arp01MEdS0eu1JEZx
	 AqUK7TUHGG5E+g5OXcjArFOOJabI8zLMuUmFhbe08b4ZojqMdb8VTIIMrSMeTpUufZ
	 uv6L+M99GDHHfu2gAHYpFQTy7Bl16PGMwAQW7UXFjCEm1odGm5OAs93cZOjnCEKM4x
	 +Q+14lHXVKJXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 250E4D88F89;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927514.27833.16891097403602063211.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <20240223210408.GA9248@jernej-laptop>
In-Reply-To: <20240223210408.GA9248@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 22:04:08 +0100 you wrote:
> Hi!
> 
> Please pull following device tree changes for 6.9.
> 
> Note that this is based on top of fixes for 6.8:
> https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.8-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.9
    https://git.kernel.org/soc/soc/c/8511eaf682e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


