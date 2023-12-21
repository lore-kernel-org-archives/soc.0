Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A804DC47DAC
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F3DDC4160E; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48300C43215;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=FhRV7ZSEIXU7whUw9SCrJPAp6y56LrYjZ/NYRjCp/bI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fQ/c8Va/pWPQg7QvTX4SvBMeGlFMc/+yFXkcJU5Cy47cLydMMZLY0HymKXQe74vL6
	 WEzmNxH7MXNMqn8IZs0jTAb2WXaX/B7BwigVPVVnctogpsbOP88aYRAAxYvkYxru1b
	 aNfemimbv9b/bY9gkbZudvo2F9fUd/5FpFa6HBe9sNlPOI648Ej0jE6WreDjoHqOqe
	 pPFjpEB3jDMdGwuVHnv3FSvEFctZ29JqvxRXE+KzNvovX+Df25Qw+fzuIYzb4FaI+P
	 tTN2A+k6lAf7BD0IoRIH9CgQ7tLh2An3jmJvHYj7HXnTeJ292UtTTKH+bA+KktxFev
	 Oo8JRjPmeUmkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 351E0DD4EF7;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 DT updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046621.3302.664489840609804043.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231214174954.3045355-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20231214174954.3045355-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Dec 2023 19:49:54 +0200 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 DT updates for v6.8
    https://git.kernel.org/soc/soc/c/210e1a339f93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


