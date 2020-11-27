Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD237C64E90
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7268A2224B; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606497028;
	bh=A91ROk+084pIa9vYWiKyRIHNFluQiqpCqhVbbsohZls=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FOr9LqeOV2J93dwZ4Y3nIwLcncZhVp/ESSneNnkGcmpNP1g0GYOOILNqUXQfWilFE
	 4rh6GLtq/UgfruF/PvBOJ8WFQpklLBpWLgiM1ZFo/OOW2B6fRIyZ/31N5CRDjLpjF2
	 FCD7+vD73qUwYA1FjjhJLoQG6nJPFrTqIG3d3tB0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas ARM SoC updates for v5.11 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160649702832.7685.1480566177231338902.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2020 17:10:28 +0000
References: <20201127132155.77418-1-geert@linux-m68k.org>
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Fri, 27 Nov 2020 14:21:52 +0100 you wrote:
> Hi arm-soc folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v5.11.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM DT updates for v5.11 (take two)
    https://git.kernel.org/soc/soc/c/eb149c927d58
  - [GIT,PULL,2/3] Renesas ARM SoC updates for v5.11
    https://git.kernel.org/soc/soc/c/334d09c218c1
  - [GIT,PULL,3/3] Renesas driver updates for v5.11 (take two)
    https://git.kernel.org/soc/soc/c/72c7b0857069

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


