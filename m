Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43700C433B4
	for <soc@archiver.kernel.org>; Sat,  3 Apr 2021 20:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D639C6121F; Sat,  3 Apr 2021 20:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BE9456128B;
	Sat,  3 Apr 2021 20:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617481808;
	bh=Q2e68tFCz4YsFCc2xeaSbGcySMpkD/KPMm/6sgYewFg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rMgtWjTQ+jwRkoJmtQImxc9brs3qnfzYcG/vVDJA6rvtOjripbG8TiSRypPCNY3wJ
	 N08yqO6wNi2irIWtMcHOR7sYikq0juhxpHL88F8/5JQ7StPPiGP6sv+6/7Hb+bQY+8
	 gMvOMYeupQx/U7AKezVaa5s6KIwfsg69tKnP/jwvGIzXMaSY2SRHbWBldIZf5KygMZ
	 HWyUi344XmNuNcMJlU3HRUMR2hGCaLkn5554SAJegj+l3Dt6yIZjZjViB+xwfKossZ
	 pDkyQ/ovj1yVM/uvokd6379tkd27eTgjgJHEnVxgVhlvAwYd5D0rgDPTkOqdWHhB6P
	 JiRcGm0Ukd4HA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AE5826095A;
	Sat,  3 Apr 2021 20:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v5.12 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161748180870.30393.11136491644469687991.git-patchwork-notify@kernel.org>
Date: Sat, 03 Apr 2021 20:30:08 +0000
References: <87a6qgctit.fsf@BL-laptop>
In-Reply-To: <87a6qgctit.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri, 02 Apr 2021 22:37:30 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: fixes for v5.12 (#1)
    https://git.kernel.org/soc/soc/c/6bf18bbe1999

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


