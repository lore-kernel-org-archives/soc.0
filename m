Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96379C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 813EBC385A5; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ACD9C34114;
	Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657746023;
	bh=Fqvs6NVsqUdJTbe+iERKVWOaFu1lV8gup38gjnBXUEs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VUaDUTTAtXF+HegYfnqs83MjyIHARYh5XP3YPNuOaFL7yt+BKekUxbBdhhgKwSEra
	 Lzd9knIivMJEQler9QE7up7s2fDFxurY/rRXZOOi3bVlSOSZoG87O9FAroruQltr7g
	 QkZBwNyHeyr9bWrsGRyKeOro3dy2aLj4q5hBaEQ0RZqmTP9ae828BYWyY+84Y/+4+j
	 tIJ8Kv8LlwC+hQpvpIGFPsfD2Kix7EjqBion/6wTg6sZhtKxOhVP1K2hjeY+pJTSTO
	 NSWQ+uW59hWQGWkj/kNrmhT1GSbmjs/G+rmtul6/Ha20fZ12mSGmfAkLmtVMdBGGJU
	 m0LX417/+33iA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 518A1E4522E;
	Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 device tree updates for v5.20 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165774602333.1051.13887460636336788928.git-patchwork-notify@kernel.org>
Date: Wed, 13 Jul 2022 21:00:23 +0000
References: <20220713070602.1652118-1-claudiu.beznea@microchip.com>
In-Reply-To: <20220713070602.1652118-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Jul 2022 10:06:02 +0300 you wrote:
> The following changes since commit 4dd1a613e464e9036d5163fc8ec5f7dc6e394b53:
> 
>   ARM: dts: lan966x: Add UDPHS support (2022-07-05 10:42:18 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.20-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 device tree updates for v5.20 #2
    https://git.kernel.org/soc/soc/c/6cd345e5835d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


