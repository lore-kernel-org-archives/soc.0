Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7C6CCA479
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E3B1C36AE9; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84052C36AE2;
	Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657746023;
	bh=Fstz8vImm0ooGTeOmUb8qYTw6B/npQ7EQYaA1GvLz9Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dfnEkFFn5aABLfhHBHo3VGkeNnqc1WB/lFHg/GbLClPT+yCapghqthZMH59DoPTzU
	 7wGHzloIDiTLAHIIMl6EztJ7ecUNa6mb+DAfz2LYKfqMKEkOfHrxC9++Qj/wfhjrhd
	 gf66xHRUTjOj9PKCDNY7wISh9QoeanwUNG3HiApEFbsbGqTSPGrKTShplKlO6enTt1
	 GQ762XPgKznstHLoprYq9veWZXthjrv4yFvphVhBzKMM0/umOO24JrTjFEoEDCSG/X
	 NwFKOJfTLaah754D1snlRVj6HzObWZ5N8155GFxTYrtxrY88wWPsA/gPv0+rlROYcZ
	 pf1o15zda52sQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68AB9E45231;
	Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165774602342.1051.9606371321124530151.git-patchwork-notify@kernel.org>
Date: Wed, 13 Jul 2022 21:00:23 +0000
References: <20220712231222.97850-1-f.fainelli@gmail.com>
In-Reply-To: <20220712231222.97850-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Jul 2022 16:12:22 -0700 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/devicetree-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 5.19
    https://git.kernel.org/soc/soc/c/52905140c3ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


