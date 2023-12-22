Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB18C4706C
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EE6CC433B7; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 455AAC4339A;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=4Y1TAtHL3tluvvHHCG1uRrGJtljfpRJxqgvMaNm/WA4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Nde03NsQoC+nFgCp7dbW8q94BpjkBpOaKiYLJOgvLcLrgirdN/V3OnPGRRghfAjLZ
	 27oFwanktiu60cajHfR8ijN5rTT774o0YcYwYK54MaEJWD13JsDJnGedi8AXGvNPpL
	 aZfqwntntYWe1gsv1jmKd7ooj+Nuu7awsCahV2NExwxKgbFZDa0woqveGuUW06zPcF
	 hT+3zqIDayENXSEvYcIfC9aC1b/qDcxOKsB2EbkTfd/7GkuikC4MEaJvhqOvl8qTqn
	 NajMvwUcVYbnP4qvSmcLUumaPkY2nnT06Y3eimWV8ZYZB5GT0ZJ3q1yD73fn0QObUS
	 42e4oDb7vav1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 225F3DD4EF3;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 SoC updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646713.10550.6600647952805611388.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231214174830.3045180-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20231214174830.3045180-1-claudiu.beznea@tuxon.dev>
To: Claudiu <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Dec 2023 19:48:30 +0200 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 SoC updates for v6.8
    https://git.kernel.org/soc/soc/c/6248b4095f40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


