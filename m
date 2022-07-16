Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC5CCCA482
	for <soc@archiver.kernel.org>; Sat, 16 Jul 2022 21:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED9FFC341C8; Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3140C3411C;
	Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658006413;
	bh=lz7cANENdtGRyKN77IcO+C8ua9j7f+VClD5RrEDufU0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uO50GE3YRvRJR1l3O2vT/bMLKRMZdLajHKi/CX438qzkX/yXMN4tfxOX+bzFhKs+J
	 nKvoNS9v6EFKIs/uI80RQ/W/y+dOfeCCCLMOjoBo5vqjQqIexUI+TjnSc12hxtAHCl
	 ZOs2Te7AhCRAcnS14YxKlZG2nHzqpOkKz+B8PONs9xKRWpa+u0kl4YcUgNCQYxvlGd
	 GbPX3LvbtlYXEiiR9+l6nVzjMw+y62dZDpIiLO74tkdpe9WM1ZYH60U6C1puLTOHqf
	 j2byzulmEK3yHzLjtuFmIH83c6mjVE86uqdrFPTjKgfBiIBp0nZrkOlAwwjbtcPS6s
	 +VsP1w23UNLAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ACA0FE45227;
	Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Delete two DaVinci boards
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165800641370.26933.9016780967135255234.git-patchwork-notify@kernel.org>
Date: Sat, 16 Jul 2022 21:20:13 +0000
References: <CACRpkdZh8GdZzGsJ=h_E8RPgAHX8HqXs1871w95TVZD0SXHbkA@mail.gmail.com>
In-Reply-To: <CACRpkdZh8GdZzGsJ=h_E8RPgAHX8HqXs1871w95TVZD0SXHbkA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Jul 2022 10:11:19 +0200 you wrote:
> Hi SoC folks,
> 
> two patches deleting two unmainatined DaVinci boards.
> The patches describe how I tried to update these boards
> but there is no interest in that so now I am deleting them
> as unused and unmaintained,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Delete two DaVinci boards
    https://git.kernel.org/soc/soc/c/b1f8b0cfe397

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


