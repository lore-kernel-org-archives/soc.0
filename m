Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8402C4167B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5F51423AFD; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=KG0RJyVpurNVyTQbFCKSB2hf63TpyskjvKH17At4WBg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kiFfBRBx5fxGLA2B/X+tyzKzK9BU6cXuHccRN7r3PfIMh1g76lOqv0J/B1PoYIB2x
	 ZksQvZd6j2qb0Ji2geCqvci4SE2OuF0pqcrgU9MEMC+8cpwBDEXAMzWbvEc7dwhL2i
	 1AIVmxf4yO7Pi2eZNOyuFLYBVli5fXsu7wPAPhdK3wbW0WAnx7FRxt0n1X3WRQ/hLQ
	 vC+3xYUPc+rROpuyiMbS7IzqiMzJ/68biMlzotsIM95KIWdH/sVwpQc2ieH88+hw7A
	 ztfpRurIZg+lSL0X/EdFq6jblEsQjpjT6OHjOlcqGZmkl8vHqDs354cL+TI/d1tI9b
	 oo0PwdsO0XIjA==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: DT for 5.11 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142924.19687.5369548682860380882.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <20201206013840.GA627225@piout.net>
In-Reply-To: <20201206013840.GA627225@piout.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 6 Dec 2020 02:38:40 +0100 you wrote:
> Arnd, Olof,
> 
> Here is a second round of DT updates, Some are following patches series
> that made it in other subsystems and it would be nice to have them in
> the same release. Other are fixes worth having in v5.11.
> 
> The following changes since commit e1062fa7292f1e3744db0a487c4ac0109e09b03d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: DT for 5.11 #2
    https://git.kernel.org/soc/soc/c/f8ff2f057e74

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


