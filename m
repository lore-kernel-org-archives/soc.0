Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACABC49EC7
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 018D76141B; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DD794613E9;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=YbvImhxJwdTwnxaOYHHbiGBBWB3E+MScomTE6Mpu52Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lNHcDYD1j17K/+J8MszEktxR0kdK+PzjqbEv1OFg47y6TR/GS3M6UxChILY5V4N0r
	 +oxC6f+o5c5C+W3NvXZaCGpAW30EtnTDRzNpSersdVHX9vgMwcTYQTvkKMWFBJvhnA
	 j1xM+E1x3kMi22tnuDQJ9ju5EBYkswuRxUOJXqY9c+SRpzONduCNcwIfZJrEc1bG4N
	 aJWq4LcfdOowA8bhzqscgQyfY8b/oywEWRGqLAzv8pfThbbYvWjvLF57C5fBUztYPK
	 kM2iHps9nfKMeKfJgLyd5BHDE7Fp3eOawubK5qVFfjofrdUnmFac0mCs37Y/Ow1LgK
	 w3retY0f4NatA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D601460D09;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421687.27448.14725792490214904885.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <418cf3a460cfe1d0f91f87e10baaf478bd41f1d5.camel@pengutronix.de>
In-Reply-To: <418cf3a460cfe1d0f91f87e10baaf478bd41f1d5.camel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 12 May 2021 15:38:39 +0200 you wrote:
> Dear SoC maintainers,
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v5.14
    https://git.kernel.org/soc/soc/c/6d9b10fd9592

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


