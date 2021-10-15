Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3322CC433EF
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 20:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BBD1961181; Fri, 15 Oct 2021 20:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9E8DA61053;
	Fri, 15 Oct 2021 20:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634328606;
	bh=b0Ca6VCo0/IVh06wCvEvmDQNhcpMcRN6dm8YmuiVuyw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OFNQn2UCv9c724Eof1BFi3kd+d86K7R+SUU6XRYl4qEzW7/YCXOl/hCQuqOnP1yLq
	 GG/NiGfLGG8AKafsOGqD/BySt8y0DdlB01MGqcncF8mejqjQsYCzkiNsm255IT9ct8
	 7ivJtRuIo+HNU/GAqx1zAtJeXVpfSnMrkJ/x7W2lHNXdpBqGq1XRn9WFSf/iAkIaRR
	 lL44Xr9LV/3j4zwtEFdJGtpYQdCUSeJH4jh/cUtkPrt392J2G1RV3/LDLfmpeuWT+Q
	 QpRcPvgtFojudlAbP2dky1GmNY9TGmyISzJMoLpxy/LKibulftIMVuJL4CwkkYtwRI
	 eDt0HT3e+5D+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 84A30609ED;
	Fri, 15 Oct 2021 20:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.15, round 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163432860653.16882.10321546209043901949.git-patchwork-notify@kernel.org>
Date: Fri, 15 Oct 2021 20:10:06 +0000
References: <20211015070017.GI22881@dragon>
In-Reply-To: <20211015070017.GI22881@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Oct 2021 15:00:22 +0800 you wrote:
> The following changes since commit 3518441dda666696707afe933586151c0fb29db0:
> 
>   arm64: dts: imx8m*-venice-gw7902: fix M2_RST# gpio (2021-10-05 14:26:21 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.15, round 3
    https://git.kernel.org/soc/soc/c/011ace4a7fad

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


