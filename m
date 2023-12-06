Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EEBC10F09
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9FABC43395; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C458DC433A9;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701883050;
	bh=Is75olqngL5u129esu4Ouh7mk/j41xV8bdIhiyOpoLc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uDnQ7T3/w+giUx6JkNjUab90nka2vJPG9NcuLeKVY8C9y7mwK/t6whPme53VONKuR
	 TxctmMO469pI4KWbvgcsykXhvdtMmWyS8+Fo5Ypso9qtJQ7XVqa4Gij2qloGxMt912
	 gQPuspqSlRuInnTZYPYnvcOlMT3J3ORfamAvQrQpoai7mlWHhnuLa2L6yHxdFP7v8z
	 7kYdheGsiS4XDL31bn306cRQ4WCrTYZWzIKk81x9POUP9Yd7aT0NArAaPJG1/GF9DB
	 A/sxW8ZLxrrtPtXc+c4sWpnsnYf7dcOMPSzYmZ4n+YEMoxOklvFIdWClAb1ynF+mwx
	 Bkw5JaP4i9ZWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9EA50C00446;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PULL v2] bus: Convert to platform remove callback returning void
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170188305064.32642.2144448491877681718.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 17:17:30 +0000
References: <20231128174927.m46dgp4juig2omci@pengutronix.de>
In-Reply-To: <20231128174927.m46dgp4juig2omci@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 28 Nov 2023 18:49:27 +0100 you wrote:
> Hello Arnd,
> 
> On Thu, Nov 16, 2023 at 12:53:07PM +0100, Uwe Kleine-König wrote:
> > On Fri, Nov 10, 2023 at 07:32:01AM +0100, Arnd Bergmann wrote:
> > > On Thu, Nov 9, 2023, at 21:28, Uwe Kleine-König wrote:
> > > > this series converts all drivers below drivers/bus to struct
> > > > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> > > > Provide a remove callback that returns no value") for an extended
> > > > explanation and the eventual goal.
> > > >
> > > > drivers/bus/fsl-mc was already addressed earlier with a separate
> > > > series[1].
> > > >
> > > > All conversations are trivial, because all .remove() callbacks returned
> > > > zero unconditionally.
> > > >
> > > > Some of the drivers touched here don't have a maintainer and there is no
> > > > maintainer for all of drivers/bus. It would be great if someone could pick up
> > > > the whole series, maybe Arnd might do that?
> > >
> > > Sure, please send a pull request to soc@kernel.org if there
> > > are no further comments.
> >
> > here it comes:
> >
> > The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> >
> >   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> [...]

Here is the summary with links:
  - [PULL,v2] bus: Convert to platform remove callback returning void
    https://git.kernel.org/soc/soc/c/a351940d61e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


