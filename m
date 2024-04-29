Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867F1C25B76
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 796DEC4AF18; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 639E8C4DDE0;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=y9EnHgz1sT7o+4x0sQixgfPNJ8fBoGUI1PTZtJzFJYs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bCYFw5pwhd+qXY2EGXR3lqC3SNTpXk9VcNSbXhBw6kUjYrAhtVA4mQ7DhCLst/Ve+
	 50TaG+E8Lv5zD/yaTbwM2B8+Cs6D6B/vbvCIyeT4LdFQpYExLL0Omw00ZXrgtLfANS
	 4sbOI9qKy4XRb/W70Vb2gmEFf+h39cR0PmA/benvLEBsRAYmhl8PRvT5TU+vcCQfFo
	 fl60SQ7eMUMU4xbU1N0Pk4bbuBZVKfwT+B37fiWSELO8T/GViwCZMyvJDzOmKrKKgN
	 Ly0ZL98dfjGwRYacZSrJC76BCZY7/ed5B2NrB6wXbwfJZ+BjtLqZ9QGfrljvyAG/yg
	 MlF6Rtb8n0RUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5904BC54BAD;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas DTS updates for v6.10 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888836.20509.4340692139235404929.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <cover.1714116737.git.geert+renesas@glider.be>
In-Reply-To: <cover.1714116737.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Apr 2024 09:35:19 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit be4e4dd8a1994e5730dfdb8dfaf1f2418f8a199d:
> 
>   arm64: dts: renesas: rzg3s-smarc-som: Fix Ethernet aliases (2024-04-09 09:34:52 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas DTS updates for v6.10 (take two)
    https://git.kernel.org/soc/soc/c/2173e5472a75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


