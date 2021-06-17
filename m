Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AD2C49361
	for <soc@archiver.kernel.org>; Thu, 17 Jun 2021 20:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 75686613E9; Thu, 17 Jun 2021 20:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5FEC7613D8;
	Thu, 17 Jun 2021 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623960603;
	bh=cnvQj4fr0cWS6i2apxY3xEPp2CL8jXgrHpV0afdx9Ck=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=k/SMdkpgpdX7HrAXEG0SmgU348xLHYU1BOiqPv25689Yw8rK5MD6ItacKNmKcliv1
	 SB8BxcfUSzMPBn7+6iL/0EqnLKweVE/xYf2ebTdLn4Atz9y5H1k9LEJWU5PE+v9T4O
	 0/nhZR+koVI5oS0i5KFP8SC4t6ovPiLjY+hodYGzcZDZRfZDMnL6Qjn/vF9iM7ueim
	 1CKR15n/PUuT8lx3Vzk6Bh/BJ12aig0IzUoivyBSEuwAS+e3ejkMj8dxSCpXU5KB3U
	 obXQ9VE3/SQrR4lzLwZN7Mvc2xDiAbJ3e5DVpAx6nCU4hKtqwCTO6WDw0Cc8vyiWUS
	 BHukQCEUb2gQw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 529AE60A23;
	Thu, 17 Jun 2021 20:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v5.14, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162396060333.18016.12923090555710715751.git-patchwork-notify@kernel.org>
Date: Thu, 17 Jun 2021 20:10:03 +0000
References: <14d33ac19b2a107e97ce1ab264987b707baa9ba7.camel@pengutronix.de>
In-Reply-To: <14d33ac19b2a107e97ce1ab264987b707baa9ba7.camel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 17 Jun 2021 14:56:37 +0200 you wrote:
> Dear SoC maintainers,
> 
> The following changes since commit e207457f9045343a24d936fbb67eb4b412f1c6ad:
> 
>   reset: brcmstb: Add missing MODULE_DEVICE_TABLE (2021-05-12 08:01:26 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v5.14, part 2
    https://git.kernel.org/soc/soc/c/25da503ecce8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


