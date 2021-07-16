Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C209C636CE
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E1E4261406; Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C6F15613D8;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470525;
	bh=v055psVH7fKXQTrgoqNBuzS87QHqAqGPy54NolEhXKA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u49zRAFAr4rjBCyMayVwxozO7pYy/Jqj0tDpg4Ze2R+eXi7695FF2ZXSlxKH6VKx5
	 ox3sLHqOOS2SGuWnucsFss4pZULcBSZarm6WUo+8Y9dupIC6QvYEO7LxeYn3wBOR+u
	 MEhwN8RD+au5UjrT5BdTY494R8S3+lqC8HlsWoavzkdEK2n8vEHqGxuUls6UaYUl5W
	 aGu5FZ5gRwa1rOfzb1IANiY1KCdMAResf/XIz8QUEMZpMnEbCNP7aPGohzJIYo4DbL
	 bMoEciYzLDsCnrz0h2gduYFuYhMwjz4WAk3nZ1YZ/wtgYOO9/aw0yMQdpNK9D33TN0
	 7vB6TEF8cHiTg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BBEA460ACA;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree fixes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052576.25202.12223973451899099853.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:05 +0000
References: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
In-Reply-To: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 1 Jul 2021 04:31:59 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are some minor fixes for the aspeed device trees.
> 
> The following changes since commit dd87684c7c9b82ad450cf063c58b4131074ad8f2:
> 
>   ARM: dts: aspeed: everest: Add pcie cable card indicator leds
> (2021-06-07 13:38:55 +0930)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree fixes for 5.14
    https://git.kernel.org/soc/soc/c/8825f2744d94

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


