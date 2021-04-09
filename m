Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A81C43461
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:50:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D9800611C0; Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BED08611AD;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617954610;
	bh=1KVe1iu8b30OHcxX/uufoEVeRDqAunXKrxKMceDZKak=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Uw1FWxwrqSRwNMrpmFKOaS/orK7iQnVm7xBdjLCXlzSzLNPx6ugxLk/2L9YgcrzSD
	 Js97GV86Qjj/rzywgPZSitVSjfMQQshp9VnoxYQ6iKUBvKa3l08q+kNEmsUpceHI6z
	 s4j/2UcxXnDVysrUATiLXe0D7X1vDojBljhxfJE3rbdq+Y9FIZO9bbRW0Q5eqzlU2r
	 eAcFCZmeUF7yZjTu0iZyv3FvWQRInKPqDRWYaDpA51mam7L4yTeSAVjhkd3nNwMtdl
	 LgyvviAaOU5zztyzO5HarR2sooNs3m7fBH71kXFNWVOaHXXHFGG06g8iEy8nYqGpY+
	 3bsatRW06cFZg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B0E6760BE6;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: lpc changes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161795461072.18683.9396605476195023790.git-patchwork-notify@kernel.org>
Date: Fri, 09 Apr 2021 07:50:10 +0000
References: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
In-Reply-To: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 9 Apr 2021 06:29:52 +0000 you wrote:
> Hello Soc maintainers,
> 
> This is a pull request containing a slightly messy device tree and
> associated driver changes for the ASPEED systems. It corrects some
> design decisions made when first mainlining support for the BMC
> devices on the LPC bus that have stopped us from being able to write
> drivers for eg. KCS.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: lpc changes for 5.13
    https://git.kernel.org/soc/soc/c/d60f314b93b6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


