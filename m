Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A7AC2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 08:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF27CC4AF0A; Mon,  1 Jul 2024 08:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F15C116B1;
	Mon,  1 Jul 2024 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719823097;
	bh=bujA0Rbx5yvyHiTjM9lo6AMhY6Q7Ys32s9ONDASisLs=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=c7vbemcd9L6zpiihULBKzaoUeO+NHvU+lu76oQJFlt0znXh0zdbi31i1R0l/y3DAy
	 R4OpzUa0mG8zjLEbPfUaYedVRTs3QirB4zxdsRLOcHtSjOp8sjWvuB/DZXzj9cTn3q
	 KwOOkfVfkzPF++AugfAaaOzVx6KffX0Dyf6h1D4aEmj4mZO+4P8ehmKR9xaG/8vPh7
	 yVGZKspI2K7zTtBqPfu0u+Xdqiop+eeZEekJ+86qKw+vXfkDQQirnw+mBs4Nihq7Tc
	 NsVrNKa8/Kplje84WTEUwwqUqZtth5XKxh3LTFKgsQn+nA7aqMk38pgxnyjzCWjt5m
	 tNNN0d0TZLVgQ==
Date: Mon, 1 Jul 2024 10:38:14 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org
Subject: Re: [PATCH v2 0/2] armada-370 irqchip DT changes
Message-ID: <dvufzppit43lfjqx74mbw7bfofvteoj7v2hucxubyg2nfoh7oq@xapay2u6bcf2>
References: <20240624145355.8034-1-kabel@kernel.org>
 <171960965002.14447.814682141364192708.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171960965002.14447.814682141364192708.git-patchwork-notify@kernel.org>

Hi Arnd,

the second patch of this series was accepted by Rob Herring into his
for-next branch:
  https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=for-next

I guess git will handle it during merge, but the commit will appear two
times in history.

Marek

On Fri, Jun 28, 2024 at 09:20:50PM +0000, patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
> 
> This series was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
> 
> On Mon, 24 Jun 2024 16:53:53 +0200 you wrote:
> > Hi Gregory, Thomas et al.
> > 
> > this small series coverts the marvell,mpic irqchip binding to YAML.
> > The conversion patch is preceded by a fix of 4 device-trees, removing
> > the #size-cells property from the marvell,mpic node.
> > 
> > v1 at:
> >   https://patchwork.kernel.org/project/linux-soc/list/?seriestreba%20za=864184
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v2,1/2] ARM: dts: armada-{370-xp,375,38x,39x}: Drop #size-cells from mpic node
>     https://git.kernel.org/soc/soc/c/2af8d8a583a4
>   - [v2,2/2] dt-bindings: interrupt-controller: convert marvell,mpic binding to YAML
>     https://git.kernel.org/soc/soc/c/f7e642bcd622
> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 
