Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3EAC2BBCA
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A6A3E23B51; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=DamOPbaXP8snniZBrZ+Ow2OEiYGRsIxSb4gvJy2V2co=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BMqerKDAVPaXg7LSjmFx2NScAjUrU0idcQJHVwCaOsCU34CNIYGRib2uxpg3YZjvR
	 Sa3qPWrYgOo2ZEk7HJdR/Vdgdonu9DqM7lc/uCDB1PHh2k8MZrGbo8JhIM4FvpbwCG
	 PxGHsvAFAbUGx/SeqN6DcpZI9LkIt4agP3NBz3XE59i8RHZ58ab/unpGZ/p47TMI3/
	 jwtcmaEzzG3slCIitOrigIfNsYKHyJP/VPFuQDbXZiDXlyU3pYp9GPGYcTgXoPmzrP
	 /Phbk4ErAPUu1R+a4gkE8jRz2qPuCZVrsI5yYfJb0iGXImPs0qqSNiEMzPz1QI5/5P
	 Vhq6452wVsfTg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: DT for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142954.19687.1144112096093811510.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <20201127220403.GA1735041@piout.net>
In-Reply-To: <20201127220403.GA1735041@piout.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 27 Nov 2020 23:04:03 +0100 you wrote:
> Arnd, Olof,
> 
> Here are the DT changes for 5.11 which contains non urgent fixes.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: DT for 5.11
    https://git.kernel.org/soc/soc/c/ab8d302c4804

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


