Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17766C4332F
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 20:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD2E9C3411B; Fri, 27 May 2022 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7DECC34114;
	Fri, 27 May 2022 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653684012;
	bh=eWMjzaktaL9cUBPEYJVA8kZUhbq1cNPFUpBFWX8Gh3I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UJKEPgD62QiSuEnT4aT03N8WdwmLMuZ0lhbiK91oHcMx5S0i6U3kT6hjSyEFHUGV0
	 qi9FZ6+CaYfujKjurn2mWua2gL2kruZrEQrRNjtzNVtZx7ZWlqbaZqkUdWXAzAKPhn
	 GpNydo3D34+xv+uTivhg9w7cXxutSIj3ldBITA/NNE/NBSbgVS4L+DcdVUhqxYPpDI
	 DmAJQW5NyEg7oWqc3wSobHVVWdp6EotVc73f5g/4hZRMJIIGgSK+LmM2bCqrLfQAng
	 IHVDSMJ8uUGUwFw75WguVkh8OLjmABL28Hl3BnCtOEFpW8Rx2JON1ISqlu97fJ3zGs
	 s73AVd7z6/VTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 951B4F0394C;
	Fri, 27 May 2022 20:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] Rockchip dts32 changes for 5.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165368401259.3222.14454524739137458419.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 20:40:12 +0000
References: <4798587.jE0xQCEvom@phil>
In-Reply-To: <4798587.jE0xQCEvom@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 May 2022 20:24:40 +0200 you wrote:
> The following changes since commit 53070cfa8228bdc64148d1e8c76c9f97ed0dfd62:
> 
>   ARM: dts: rockchip: rename pcfg_pull_default node name on rk3036 (2022-04-11 02:16:33 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts32-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] Rockchip dts32 changes for 5.19 #2
    https://git.kernel.org/soc/soc/c/440517772bec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


