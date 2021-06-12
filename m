Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31EFC49EA2
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 74862613D3; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5795E613C5;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=OxKseVTY71QRmgWxrfGenJQQAR/SGY8MH1/P4RCEgpU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HOOVdl5gtHX5iN1X6tM1yXpL3rqAqYafsw8pL62zAQqj5FNASaTnSGdEQVX3AfChs
	 zwfwXYrNWCwFs0tcSx1fcXFUZvFKhLIste9M2AhLEjfUVPpN4pNNx+Mp9ucUkHUmbC
	 QwEU+2RTEytwg3Nf/TWLZ1hIs3ZHLqHR5CKmh4AdVz2ZhW/o498qOP43yMcKxJu7l3
	 JAXUhewNczSU+W0KL0RbiDiLpytM0Y4wa7Qo0pQrP2OZ2hsIlZO8y6uMpqOVcGotci
	 DjIJm6PDd+S1soGw0rNiyOTWNBJU0cjt15djGPBjjpWSZ62bCDbLBWCNm82OXF+Ktr
	 wkLBeMRumHLtw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 420C660CE0;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas ARM SoC updates for v5.14 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421626.27448.15439033843507300197.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <cover.1623403793.git.geert+renesas@glider.be>
In-Reply-To: <cover.1623403793.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 11:47:00 +0200 you wrote:
> Hi soc folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v5.14.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.14 (take two)
    https://git.kernel.org/soc/soc/c/f1b1d76afdc5
  - [GIT,PULL,2/4] Renesas ARM DT updates for v5.14 (take two)
    https://git.kernel.org/soc/soc/c/d4dd4699366c
  - [GIT,PULL,3/4] Renesas driver updates for v5.14
    https://git.kernel.org/soc/soc/c/ec7f5cff6eff
  - [GIT,PULL,4/4] Renesas DT binding updates for v5.14
    https://git.kernel.org/soc/soc/c/a3c52f08ab8f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


