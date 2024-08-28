Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C02DC7113C
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 589D3C4CEC1; Wed, 28 Aug 2024 20:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D710C4CEC0;
	Wed, 28 Aug 2024 20:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877725;
	bh=KNoltp53/mx9YiRi5TIzvgHFbEwm3a6nglKl9939Qm4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Y5EnE+e4nkwW3TbggfHK5q5M7gByMFxzWXvnvy+sXzpJuTyMHBLiC+fxy6SWSvLHU
	 OOHBKv611njBrD8zlACJR3sL5EeEozz5/ZBR00xr7ZQiJRKpzud/pBWX9RzDqwek1m
	 zBCOV2n+4QIE9j/n2PCLi7R1tfh2sefI83RAZYqbQmqzTOdoAWnj8WmJWCfrsXSGTP
	 3t/xBCOs9rC2P26KtnYnF4+UiahlaAiuWx/KGsMSXYgAF1ie1eVQBWhh6LSvI140TK
	 XDyqwtey9cXJbyD0a+2hkR9MXCqJ5+yOsRPNalAxUxnurts7pW9EX1KvTXhsUfnpCo
	 iq/s9Zo5H+cCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE5403809A80;
	Wed, 28 Aug 2024 20:42:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OMAP fixes for v6.11-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487772525.1420116.1724561021817015057.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:42:05 +0000
References: <7h4j7eyhyh.fsf@baylibre.com>
In-Reply-To: <7h4j7eyhyh.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 20 Aug 2024 14:58:46 -0700 you wrote:
> As discussed here[1], I'll be stepping in to help support on the legacy
> OMAP devices, so here's a first pull from me with a fix for the v6.11-rc
> cycle.
> 
> Please pull,
> 
> Kevin
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OMAP fixes for v6.11-rc
    https://git.kernel.org/soc/soc/c/0351a9841ba1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


