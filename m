Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C55C3065C
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 310FEC4AF14; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B0D4C4AF10;
	Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719609650;
	bh=SyqXOKQe2h8b3qOEBb4ZLTa7xwrwJrzRki60XbKauAY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YdGxeqdJaPar+VKVCHA/AXF5Evw4LD+79bUYfu9VBzJwhOVfjBSONU6CCFs71QjmU
	 5dFko06anHnC0e769Rz+z3I2JQhm2VdlmLCw9QaE3hOvjrVr+Pu3yyG7SBPUYA3VOy
	 Nk/nMQu2tF2iAW8pk2rJ8K/rVAmoAavax3RdS9yQCfb0x7+/FpbbTW+GiqHjznE6aB
	 JgBQXXQBgaq+UQZLYBMZ1lMllh7OzQn8TYB8avrSd5NhDjNfiwh3xUXORfKqY9gyDw
	 VgfGf7J6rIwYssBCbyHQ4E45y4/VVchG8a6tQzZOenOe0RsDEUraWiEZXsTSftpHAK
	 CWzMiPKtC1nuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 074D9C433E9;
	Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] armada-370 irqchip DT changes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171960965002.14447.814682141364192708.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jun 2024 21:20:50 +0000
References: <20240624145355.8034-1-kabel@kernel.org>
In-Reply-To: <20240624145355.8034-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 24 Jun 2024 16:53:53 +0200 you wrote:
> Hi Gregory, Thomas et al.
> 
> this small series coverts the marvell,mpic irqchip binding to YAML.
> The conversion patch is preceded by a fix of 4 device-trees, removing
> the #size-cells property from the marvell,mpic node.
> 
> v1 at:
>   https://patchwork.kernel.org/project/linux-soc/list/?seriestreba%20za=864184
> 
> [...]

Here is the summary with links:
  - [v2,1/2] ARM: dts: armada-{370-xp,375,38x,39x}: Drop #size-cells from mpic node
    https://git.kernel.org/soc/soc/c/2af8d8a583a4
  - [v2,2/2] dt-bindings: interrupt-controller: convert marvell,mpic binding to YAML
    https://git.kernel.org/soc/soc/c/f7e642bcd622

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


