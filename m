Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4C3C43600
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:30:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 137AD613BF; Tue, 13 Apr 2021 09:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EDD65613B7;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618306211;
	bh=aVxqMeoHCFqQpxHzjup4KVC9BKdInEI5fgG8+ozKiag=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fxh+Zn60/ZEB9fh8Nk0NPWcaRtuxLksJj0y/UPMOMS+gtm7QqUJ2YLvMyno2oUbFF
	 AVY37QORYWLUBXy2CpG6YtLkKWooTj93CSfswJNoPwYQRdXYxLtXhw2VsgEFArGFUV
	 FAINSDzjGnliEYNvHDGi7Wh9BwCV2BpVn67iesVWHhs8StNLLj+NZezU8hsKngzstW
	 efsAooYj8NaIdfguWVeyVe6xvdgkgPiA+p2j3cUOPgIGhYfZGOglFJ2XWGnhcSgodt
	 rRj+HykrmXELm5wYNpM5vhs9otF8Xb+h7e6pvKn5hoYJ2Xg8ODPIb0Dypsh4g8bPQz
	 DJa7i4Vfb8g8g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DDEDD60CD2;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161830621090.20348.4996938543513069468.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 09:30:10 +0000
References: <2191862.ElGaqSPkdT@phil>
In-Reply-To: <2191862.ElGaqSPkdT@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 11 Apr 2021 11:44:27 +0200 you wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.13-rockchip-dts64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.13
    https://git.kernel.org/soc/soc/c/f00a99a7a5d0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


