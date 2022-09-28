Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB7FC6FA93
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 914D4C4314B; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B398C43145;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=uaI5GF/jQacHPyouRAR59oq8atMdcqpbs69tYi8f0Wk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Fb+K2g3FmggSi5nG1gtK5SsFiaPVIiqzPClzU2Oy5yB6+7D15eUSnEU80LRoJ1XOc
	 D+Prrt1rPARlCtd5+EZyBbKavFNMyCQA4qJJjW/i+QVLmdd4BIQM8enqa3m5b4a2/k
	 xj1hVBAVKQbdqw2fNMW58PX5g+AnTeqqXl2aymyo2ME9aBgqBgUjflvxtYmLaVG0Qn
	 UjQ0nwJt2FqF9I+bG7HtGg6FJu7V8XkFjJ7fjpcZ3E+aBS80JpvkfchZqhJtavj1sU
	 x+f2UPVUaF9lYf1CqE7bnsKwH0Dt57pfGHbGH4QQxkVkp9JYorGd0TZ9n/zBcZ66b2
	 z/UOQsc677kgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65B36E4D018;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.1 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882940.18494.8070447481521378228.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <38114097.10thIPus4b@phil>
In-Reply-To: <38114097.10thIPus4b@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Sep 2022 20:58:30 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in subsequent pull-requests
> some more Rockchip changes for for 6.1
> 
> Please pull!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.1 #2
    https://git.kernel.org/soc/soc/c/286c1d1c3074

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


