Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B7BC38141
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 10:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8BADC433EF; Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3119C433A0;
	Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674209417;
	bh=nSqrTUWVIOpEQdND7yWgJAK5J1/uuMGDO+YNpqYPReU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PhqINpqa4p7nit0F4ANuPdtfaiRpU4s32LieBglINJ0tB5QoJ6LjX7vgorlf6YZmS
	 w6jlxRs5b5hI4fGgqCcBXPALE/tMy2WYvmKik9jfDp1sgOwgN6Apc7tyllxZrbjPy1
	 r131uRV7OiMYP1yJ2cKj0ckaym88Lz/i8IIk9GZhP6a6reoyoCa9WNIsVxg8V0IKRg
	 3uLkVTNoFfm1mCJSS0nKTeRm7G7W6c7v+SoSbEwIWUx2CNHnpSW6QTyNgybyaDRjaL
	 JhfP5qhxd5EK1LZIvBSr5Yz5EI8i2p8XR4gJhpMBCQ9ALIP8/5nvSXCJL0KjVaFLgE
	 vgaq+mhZyyEwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A64F1C39564;
	Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 fixes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167420941767.17943.15597267736366721957.git-patchwork-notify@kernel.org>
Date: Fri, 20 Jan 2023 10:10:17 +0000
References: <20230119112101.42045-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230119112101.42045-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 Jan 2023 13:21:01 +0200 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 fixes for 6.2
    https://git.kernel.org/soc/soc/c/aca5d87d9343

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


