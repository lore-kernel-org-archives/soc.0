Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71EBC49EBB
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4851C613DC; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 262A3613D1;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=TOpr5MPr2uzuUTpdR2+h185yOo9/axO3EJGGOAp2+KE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u7+ZHpFqM6Xro4DmfocebWkjvkZcJxGjmmBR5aWP3cTiPObud3XhGRgT4u5jmXeji
	 BbAj4QkLWfENpayY2R2EysHEWABJT/oA1s/27eJx3YjXQxJihq75/ZdmHjwhd7HyJn
	 qlmbOHi2RshZ92oF0RLKOa1WdjZjl+Gip8qkaRNk33Qqe2nTlL4DNwPnHVG+FIsUE5
	 Ihq+Ir8scnURh/CHQcWLDJFgRRvGTTWuc96N1LnocDTyjrfYESCIbCmR8+uL+yTKea
	 G6C+XGsdBir3LmD5/hYpYWA6CgGFgFjkSpaueQdY4txOUTkyU99AtGrtHaz45eUN4k
	 zB1PANJf6TbMw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1CC8A60A47;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241111.24025.4098446630245631827.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <2796982.e9J7NaK4W3@phil>
In-Reply-To: <2796982.e9J7NaK4W3@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 21 Jun 2021 00:34:04 +0200 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-dts64-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.14
    https://git.kernel.org/soc/soc/c/73d1774e0f6e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


