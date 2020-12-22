Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AFAC433E6
	for <soc@archiver.kernel.org>; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 47AE323137; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2FAB22311D;
	Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608656407;
	bh=dp1bXPqL33b5EXDNW1h4qCbCuEu3ZVSioresO7HMsgY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=l/M+isxsRbWa2fhakiPxtCPTxMSzUnnjsbqL4w+du/jKuTTPFj24ofJh5vQGZCpe6
	 Lr4yNY/J/+8lQQLUdrYdzKybfmR11CjMdRtRrbeApFH/ITKX/iTNODNRHJx4Wuqq14
	 7jG2JrvVoAaVOtvtJtko3OfCwC44zZonvMsW9BvefDDyH5dJkrdTPrpWIYGd233w+c
	 i5zCotEOf+13yBoS8W7G+yJqxAxJ20oPqLXGJ4H8Rzh3ihh+YJyghfk0gTYk7hHzAS
	 /dfO1W532pN11Zf8zlb9F99n1SaXDsGzMqtTWpKMrbJkSjmqnwevmrsyenvtewBXuE
	 zYV/S3J+w/0Mg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 20FED60591;
	Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Few regression fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160865640712.31426.2766875858341450889.git-patchwork-notify@kernel.org>
Date: Tue, 22 Dec 2020 17:00:07 +0000
References: <pull-1607674932-973902@atomide.com>
In-Reply-To: <pull-1607674932-973902@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Dec 2020 10:22:54 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 05d5de6ba7dbe490dd413b5ca11d0875bd2bc006:
> 
>   ARM: dts: dra76x: m_can: fix order of clocks (2020-11-19 11:37:57 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Few regression fixes for omaps
    https://git.kernel.org/soc/soc/c/062fa6b8ef15

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


