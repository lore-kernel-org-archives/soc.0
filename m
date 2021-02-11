Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB0AC4332B
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 83D7964F37; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6B7E564F4F;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613056808;
	bh=ygFokSiEWJzBcWxTAp5ZuWrfzMVncFghE20P2+pDhII=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fHr4jk/PutOb4H7+AxSU6ED4iaIjC4uaB+fQ5QELd+Wbgp5I9IpEOGggKoYxuzBbN
	 L6xDKAYaBqqC+4puT6rMz0E+spGcArG0JW6SIyYcB2cifQx3+XTUdipz46JYcIpP2s
	 Pu2FL0cy+XWjnJ00PGgGtvxu5bwCsSxlWMGNUV6xCYiSHKT58GwZUih5sjGRBo17gy
	 bur9LOf8CqM5zYDNxIpMmo5DA8ewME8rxSm3oQ859sDiIAGV06CuiQn/dfviqIg8gi
	 eR5c0jw61oC1eba+JtltIXx6wYAa/C6V4688Vli5/5s1XL1XnkWmJbGOCpD5nnYdkC
	 cBc+BFF5INCEA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 63C8A60A0F;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] ARM: dts zynq: Xilinx DT changes for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161305680840.9082.14666951094281124445.git-patchwork-notify@kernel.org>
Date: Thu, 11 Feb 2021 15:20:08 +0000
References: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
In-Reply-To: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 11 Feb 2021 12:33:01 +0100 you wrote:
> Hi,
> 
> please pull the following DT changes to your tree. The major part is
> adding one new board and qspi dt binding conversion.
> I have dropped one patch based on communication with Arnd.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] ARM: dts zynq: Xilinx DT changes for v5.12
    https://git.kernel.org/soc/soc/c/78155527283d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


