Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449C1C43217
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A9BAC340F7; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0B4BC340F5;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=6NSngzaz6kNrmknyKvFGEPtrZ2fEGP/5kqM7QeyHu+s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ExLcapVsuo1YBWoeKU7gwE8wvil+Saase7u5lUKrrXESYuPDtBJdxHH+bn9qRpAW5
	 VaWbjHn/dSM1vw3LxZTtZJclCvulX290+J+aLztVJee3Bvs+kYmIn+st5wqVg8elvc
	 Hlb/AxQF06CZrr0+XAOraX/+BnaegHMpCcWDnXrDSk749xxI/3bK4zjd9wumWdOBig
	 TlOEaiBPhQklPUeXtBaWw6Sup8Wb0qI31hcZEoSxWNsdPF8kJvF5tR3y9FU747SEZW
	 y7Cb1a6dWTc14GQnwbfMuXQ+jFgzp1FG6DAZTmYmF5cBplQg+rLMe9Ylc363bz57ZN
	 aqXZogwmSEkGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7A8BF03839;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966287.15608.12934206258097145149.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:02 +0000
References: <cover.1644587197.git.geert+renesas@glider.be>
In-Reply-To: <cover.1644587197.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Feb 2022 14:52:10 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.18.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.18
    (no matching commit)
  - [GIT,PULL,2/4] Renesas ARM DT updates for v5.18
    https://git.kernel.org/soc/soc/c/3b34d3a9190f
  - [GIT,PULL,3/4] Renesas driver updates for v5.18
    https://git.kernel.org/soc/soc/c/15cc8d030cd7
  - [GIT,PULL,4/4] Renesas DT binding updates for v5.18
    https://git.kernel.org/soc/soc/c/8e9e1aeed2c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


