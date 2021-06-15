Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAEBC48BE5
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4EB3961606; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 37C7261480;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=fpbqontanRZv42OyK9fK78iQVciHNp1jcCtBAJ6Fw1E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qKFfzuXruDXN0rks3ExA+jjR3xPTgWZwYNa5VtclVVVAQyvBidNZ8BOELPfdpx3Xp
	 lotLovCjjcd0umEe7InwohcxWDCIuAliRmgLXQ6yMQ572OvUZ3UYWG+Mp9J50mfOWQ
	 XQaXvxJZe32N5Sz4ZC14oC6uqqIeWIHkuFaLow28P44YVKboYjDmRUJlcJcYmr5FSX
	 4TNzOF5d3BWFxUPbUInBtgdhwZhZ1xnOysXg3YraYkKdKjyuCuQ8jOu+HhJqgDq9AR
	 1vIJLobGq3ki8mBw+2AaoEM31Iuzd0dn74DeBVXfKTKTlw87qp9SVnTOl3P3YPpHSF
	 DCdLJaq7xsBBQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2EF3460A47;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: DTS: Keystone K2G cleanup for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281318.17464.17162057280513969001.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <1623564020-9958-1-git-send-email-santosh.shilimkar@oracle.com>
In-Reply-To: <1623564020-9958-1-git-send-email-santosh.shilimkar@oracle.com>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sat, 12 Jun 2021 23:00:20 -0700 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/keystone_dts_for_5.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] ARM: DTS: Keystone K2G cleanup for v5.13
    https://git.kernel.org/soc/soc/c/406b968552c6
  - [GIT,PULL,2/2] SOC: Keystone driver update for v5.13
    https://git.kernel.org/soc/soc/c/eac7b3b75880

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


