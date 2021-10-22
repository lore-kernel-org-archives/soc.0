Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CADC43219
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1C8D561248; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F11866120D;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634933409;
	bh=CrDeMXI43czCi5rFBhhqqP4KBZQzBq24NBMl3Od+8xo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uhjctkvY8PW4MKNBF4yfYTYZQ8kULZoamrsoMm4oPk0jHx2hO5IH1+PxQLR13Z2fQ
	 Mh7XKu33LvdZRwEBWhG0Q0c5ZBc8Bmk5eRWm23mqAf+X184Dc7dKgh7e6myvK010Z8
	 2+LghwI+Slh9q9M4+VE/p5QGsZlY7YKVWjNFPqfaR6Bpn/sOybf/00SP0RrrX9Dwo+
	 /xQJi9yKY4AtyfV6kpXbTeDFWoAThll+pQCtkU5l7xSmGPVzshQr3R/0RuTjoa/tkl
	 Wkfqx28eO+7DW8uBDdrAxOD/aoxsbmvobC4uCxvg9iKw7hstbaRqPFzl2uhhT13+J7
	 Aa/At66y77S5g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D617360A4D;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.16, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163493340887.6553.5242070167456665028.git-patchwork-notify@kernel.org>
Date: Fri, 22 Oct 2021 20:10:08 +0000
References: <CACPK8Xd=eAMk-S3akhGgL4i_K190Nz9t=_CrdHQMJ+nbW172mg@mail.gmail.com>
In-Reply-To: <CACPK8Xd=eAMk-S3akhGgL4i_K190Nz9t=_CrdHQMJ+nbW172mg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Oct 2021 06:59:10 +0000 you wrote:
> Hello soc maintainers,
> 
> Hot on the heels of you merging my first pull request, here's a second
> one with some changes I missed the first time, and some patches that
> came in since.
> 
> Of note the two IBM P10 platforms now have all of their device tree
> changes in mainline, so that's a milestone for them. They are our
> biggest Aspeed BMC device trees, coming in at 2400 and 3600 lines of
> description.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 5.16, round 2
    https://git.kernel.org/soc/soc/c/eb425d57a8b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


