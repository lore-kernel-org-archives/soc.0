Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19366C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:50:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C64E4611B0; Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AEAC1611AB;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617954610;
	bh=84pkOH7tXGW0IVWsWaZ7oDT9UyS4ub8E6t3WkeyS7EY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=owV5nt+Hsot3XpehyyGL72CEWBmod1CpLIMEB+r59QYM3arZG37g5BTex9sp4+Tyi
	 6Bq0otL0lmzhTF8AfQX96lP0RIlUGa/9wMjm+YHsowbuv8MBeN5+zcpUnuxrT91MZd
	 2PCrTtHVDCaqBAIfj03sGgJ9LW2s5ir34A4Yo9atVZDwqPBFesMmRDOpxHQJGdzoIz
	 htbjC2WR5cn97GYR8C0tZdyxjFk+5A3urdtC9LZAGUmcZTQR7u/lhPVS2zHk9koOie
	 amm2gA8+g9bTKR8akuLl3i1WhiDYol683fsseZ01WF/aSa1Nn+aOz9Q2AuyZhdWV40
	 vgSgXGNtDpEmw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9F90960A2A;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161795461064.18683.6240792276986834003.git-patchwork-notify@kernel.org>
Date: Fri, 09 Apr 2021 07:50:10 +0000
References: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
In-Reply-To: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 9 Apr 2021 06:14:27 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here's a pull request from me for the ASPEED and Nuvoton changes
> targeting the v5.13 merge window. As you can see I've chosen to
> arrange the pull request as one single "BMC-related" set of changes.
> If we choose to continue with this, in the future I will cover the
> ASPEED, NPCM and soon to be merged WPCM (legacy Nuvoton) systems.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: bmc: devicetree changes for 5.13
    https://git.kernel.org/soc/soc/c/e3bbc53ac882

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


