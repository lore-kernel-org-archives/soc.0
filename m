Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C7DC4332F
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C6B1C340F7; Mon, 28 Feb 2022 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3E7CC340F5;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646060418;
	bh=0p0mwjwICUlvIhWiDYnI1q6SkQwotXjR3mwd91x85kE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hRJ5ANMlG3Wd9yM2VExLTlAxYYqrxwOsp9+z/A7799jg0SuOjoXel/ZtkQ2tprXPX
	 kO8tEBweHwIdJjk4S0gp3hr8GPjDff9Voqm1nKkfBZm+jZg+NbV+HMzV4gf0HYDTqX
	 Pkl+eCUt9BZrlm2FRSO6SATHt6ICC8AAIaJ4puoo1HyCP4LM4RKAi9/XTcoGpJqvcq
	 DDocxF3QdT/2EyH4qexdymSR5NeVBBKjYxYXZFPBWHixH27pgzonJU4GnkdxyPx2/G
	 8rQmhvHdVvAdWOF+Q6LbKSYO6TOIvq/OuR8VohTWpzK7uwM/DIXG7DicdpzHcFSxql
	 09zUP1UTd3Zzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3105E5D087;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] ARM: aspeed: devicetree changes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164606041779.949.9766263572484122007.git-patchwork-notify@kernel.org>
Date: Mon, 28 Feb 2022 15:00:17 +0000
References: <CACPK8XdUXy5cnEDKmNirtByNMBGCjXwZpdKqJ0ytc0f34vzbBA@mail.gmail.com>
In-Reply-To: <CACPK8XdUXy5cnEDKmNirtByNMBGCjXwZpdKqJ0ytc0f34vzbBA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Feb 2022 05:56:30 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are the aspeed bits for v5.18, with the tag on the correct branch
> this time.
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] ARM: aspeed: devicetree changes for 5.18
    https://git.kernel.org/soc/soc/c/2d9f1dd1f28d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


