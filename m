Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1331C4332B
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 00:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD0FC64E0F; Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 890CF64E0B;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611964809;
	bh=fqZ3U32DAB4BRiEuiIrP592V/497adx2IFu+UaFhmrs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uYfUtGsxGwblWIqR2rXwPpf1a2xyd/lwaaCIfT14KfgUJHU1wN5d1NOLlBUPxX3M9
	 3Y/CDCAIpndaxlOBFiKQkv5foWDoI0HRzFe3UpGXGAzbKuAtYZixp8Hmo3NvK5Mt/D
	 dBIXqmcsneAlC09EpW4aOAE/P7Ayo+kmBO3jAJwYfvNsv0Ru15ihp766n/CgOS/ubx
	 2Pso+WYhz0gJYcOSgL6HlDeEgGKMWsK6k1yvWApdo1rnb8M6xCw+iy1s+Wh2V10rro
	 pPD6qHxFjs/fDsKqrLmpioSgh5stsNmEv8GHMH+xm469xk7FNkOlT6i9b/tO7KfOQQ
	 j9ALqymJdQLFQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 798F960963;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas ARM SoC updates for v5.12 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161196480949.10199.9514190081534299956.git-patchwork-notify@kernel.org>
Date: Sat, 30 Jan 2021 00:00:09 +0000
References: <20210129090815.2552425-1-geert+renesas@glider.be>
In-Reply-To: <20210129090815.2552425-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Fri, 29 Jan 2021 10:08:13 +0100 you wrote:
> Hi arm-soc folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v5.12.
> 
> It consists of 2 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas ARM DT updates for v5.12 (take two)
    https://git.kernel.org/soc/soc/c/af91156490c2
  - [GIT,PULL,2/2] Renesas driver updates for v5.12
    https://git.kernel.org/soc/soc/c/e53686bbdfd2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


