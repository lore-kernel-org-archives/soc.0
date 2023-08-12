Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E83AC04A94
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39C16C433C7; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B128C433CA;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=U6+psgORYmhLYpyiYk+ci7JLwAmboNuS+ZVt3BYJUYA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Vq8lv4ozoJC3AIDC0W+mnNfHN2UNilX8z9pz8ZTAmChegi8T797wsMySny5s5SB0F
	 QwSvSiCLyKvtyB9Ztj6v2t4RmNY2ekHCVhfFmxEPWZ3QUJJoc97zJroTeA5hezqO99
	 U7qo1YIkvflIWiJ9mhcCpqSo7X+GEP/kiNloOcmBxpqlLKAn2Y8mzFWBHrCOmHr8Jn
	 cvp4mAeN/YIMy40K9RwigcR/9c4NOgtue4dJoveGkdu2IiJ29rUx66lBF7pSGzZKhH
	 Dw0UWcJTMKnLm/tgyvifbNJ7R/jaTPT3h1RE+Zzu4js/OVEQQTdnpNq1Wv7QmFCyie
	 Q6e8/PafWQhmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EBEE6C595D0;
	Sat, 12 Aug 2023 09:14:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 SoC updates for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168896.30475.13449757473634015111.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:48 +0000
References: <20230804044118.231478-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20230804044118.231478-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Aug 2023 07:41:18 +0300 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 SoC updates for 6.6
    https://git.kernel.org/soc/soc/c/61029e2b3740

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


