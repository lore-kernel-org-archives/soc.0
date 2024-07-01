Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8503C3065D
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8C8EC4AF13; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9356BC4AF0C;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719867637;
	bh=yDXNo+WbTbHODA84PLnJfsqK57dHDqZvg0q+2YvBBuM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=B+2eXvuXl94cwYaGfc6BgC2euM0FOYdAj1fzL3Zx77AYcgQlH6m4PTpDaHdxYPRoh
	 SyowoC4YvfylTbcPzcUqJvK6J7onACj25gpy7bfJFejHpJYXMtPzLRZUvVHpj6xLUV
	 Alzp0WPn+//P7FcdDEN2gEwD6Y3zJ3Lvj1Lm8AZOROIPTFqvIdWakRVlHy2aeMbLvM
	 BexKzUpZ6fWFUOmzJQBIr79evS8mQW0cdjHDtTwL30A5JD9qX11QckxQsqoh2hDQ4p
	 GXq2btBd6f+bae/2X2sH5NmhZk/Pfiiefz0LxYRRWW80MW1nH6BFKtWhGMKoA3p5Dt
	 bng4hotyuczDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79E84C43468;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip ARM64 DT updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171986763749.7657.7779907044436916262.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jul 2024 21:00:37 +0000
References: <20240629174051.665027-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240629174051.665027-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 29 Jun 2024 20:40:51 +0300 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip ARM64 DT updates for v6.11
    https://git.kernel.org/soc/soc/c/7f8165eee188

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


