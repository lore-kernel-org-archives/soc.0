Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC92C61DA2
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDAA6C433A0; Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D76DEC4339C;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674663618;
	bh=GINmJQyhfEdW97hW5WJeUEMTbOHKm26SroIyea2gyAg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gI0Od3kPRPR/f1RmgrtDK69urE3AL5kFklpQWj2JS63hJI+HRdjlVAjRnZ3G6NgXe
	 QSFBf1kD9PmYCBPHR5Upc/t8n7i35FqAb2UdpZZSrGIxUfPu1rbOQgC32xDGjygZyp
	 JXSKh4BzAUnGn0kWKld3PCTag94N4LBQcl53zdK4h8y4UoBVyVQeUdzrrHGe6yYWgT
	 XSkcu1bmd3GK7+0R5/zhofG61VqDnCobesVuub/lYtuF+M0V0lMsYKcNQVImXGYTvE
	 dR1SnSdEuJ9+eP17d8fdp76DQc49npHz5C1hSZnI46C9VqZmpQRnUxhMYxvs78EvI4
	 d647Za2zTGbMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B5513F83ED3;
	Wed, 25 Jan 2023 16:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 SoC updates for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167466361873.4524.10287614933604063509.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 16:20:18 +0000
References: <20230119113202.43543-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230119113202.43543-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 Jan 2023 13:32:02 +0200 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 SoC updates for 6.3
    https://git.kernel.org/soc/soc/c/b22fbaa707fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


