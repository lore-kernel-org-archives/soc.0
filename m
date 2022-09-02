Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5DCECAAD5
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70D48C4347C; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59A57C433D7;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116424;
	bh=2oRQCamnlTFt9WCQDy1uHUzzBI5PhexpmlxyeyjnaQI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tSPGPle/jokPHvdtqWJ5b29nYMTt1Ea+j6iIZwhhQUG3bB2LxN98tjUHXjoE8ykcb
	 ocQtNWj2EYWo3wTijJIZuSr/PKZ5mJ04OVNa4JaD+JjWc772qaZKvd2pDaN4YQrmJC
	 3ThQEHAqAAZPyVQCcRhsjzn7cipI3AIF7KmRWRb8SWutIWY8e+g3dxR/EyEx9zeNkT
	 hoJJ3xsH9H2qMQtkkz4YTSJY0LPHjiCOyUqOfRM42szx/AICpx5f4j/SElAZD1x5bX
	 A7R3ZMvYCndJ8KATpkjzzlP/7/eNcxDHERPCYgcnRbzN1G0oGE4t0JJJrYSJU0HCii
	 riRbAZRKmFXpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 478ECE924D5;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] arm64: Kconfig.platforms: Group vendors together
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211642428.12856.14895962445441065204.git-patchwork-notify@kernel.org>
Date: Fri, 02 Sep 2022 11:00:24 +0000
References: <20220829173830.3567047-1-f.fainelli@gmail.com>
In-Reply-To: <20220829173830.3567047-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Aug 2022 10:38:27 -0700 you wrote:
> This is a follow up from:
> https://lore.kernel.org/all/20220712164235.40293-1-f.fainelli@gmail.com/
> 
> such that we have SoCs from the same vendor grouped into a menuconfig to
> be visually nicer and assist in selecting the specific SoCs.
> 
> Florian Fainelli (2):
>   arm64: Kconfig.platforms: Re-organized Broadcom menu
>   arm64: Kconfig.platforms: Group NXP platforms together
> 
> [...]

Here is the summary with links:
  - [v2,1/2] arm64: Kconfig.platforms: Re-organized Broadcom menu
    https://git.kernel.org/soc/soc/c/96796c914b84
  - [v2,2/2] arm64: Kconfig.platforms: Group NXP platforms together
    https://git.kernel.org/soc/soc/c/566e373fe047

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


