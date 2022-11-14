Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E89C4332F
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9F95C4347C; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BEB9C433B5;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439820;
	bh=pWkhWDpweZn9nMU49/2AogMk2RqHeecQx0SEIHJT610=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tsfU6Bya1hNDIKzaJmQs6Nrys/0b6N+Ch2smUKpNm0shc0lk8PKinq2T8N3gbYEoX
	 7Qk4WLwpkhtvZolXtf7Xz10RAnLsV9RQ7GIuRbSBdbEgRzqnjJkgnSvqRUUtjeoKbD
	 ynieyw8QYnWBJcqjwCe8CQLx6dKPef3kGwhSOQT08GyCs3+DF+lIayJwCn6n9XeoDj
	 0dWG50Bp5jUyEPWYPkrcmkJPXmZRbbxmV15l3O9qnyOujJCLOR+cNoYApVCPAFt6L3
	 iiqoly+/IY/g4k/rofBpJUxgUMWamSp6l6hJZxXhm7sR5A4JF4Idq1FEYevkpJQZGI
	 uWrFmyaI3ehZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 797C0E270C2;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Renesas ARM DT updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843982048.12382.10787665667112583959.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 15:30:20 +0000
References: <cover.1667558740.git.geert+renesas@glider.be>
In-Reply-To: <cover.1667558740.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Nov 2022 11:49:54 +0100 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.2-tag1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM DT updates for v6.2
    https://git.kernel.org/soc/soc/c/6902029ec8a7
  - [GIT,PULL,2/4] Renesas ARM SoC updates for v6.2
    https://git.kernel.org/soc/soc/c/566fb6711f18
  - [GIT,PULL,3/4] Renesas driver updates for v6.2
    https://git.kernel.org/soc/soc/c/4c1c97fc70e4
  - [GIT,PULL,4/4] Renesas DT binding updates for v6.2
    https://git.kernel.org/soc/soc/c/be15e7571fc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


