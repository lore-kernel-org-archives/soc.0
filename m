Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9DDC433DB
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 704A364F51; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 564C764E87;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613056808;
	bh=JW2zPGDom59ywmagrMxRjp8+JjVMsEG6YvF6aL1WDgg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eeJ485DtB11kDBW/Ft/4kpeO7fVV0qWuWEfT00lp16cpoRXjea4Ume4M7PnRF753e
	 NZjKWF18e7t0Uyd7pxS5EYRUOzRgy4MuIf4qHrTJC1gdqeJd6rrZ879gcSc/EtH1MR
	 p9Ux1Q8P3aw6Nw8zWJ3PeTl8Ju5GOXD8D86iq4ODSu53UpNHpQqCWVL4ze2JEQTxE7
	 Dd4MbrEcPC5sWVnGZYXwbVc2tdxcGolXSRaVu9V/i04Gx5cws+BevLaEyiYRCHxhy+
	 JVgKOBnMtMHJpL55/gPmJ/kgkiE5fRilqfevhaJEbGTKDMuGztfvSen2Bn0sck3q1q
	 +eqnOYlsjbBew==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 468E260A29;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161305680828.9082.5881568314308527931.git-patchwork-notify@kernel.org>
Date: Thu, 11 Feb 2021 15:20:08 +0000
References: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
In-Reply-To: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 10 Feb 2021 12:28:23 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here's my late pull request. I've deferred some LPC device tree
> bindings rework that need a closer review, so the contents of this
> pull request should be straightforward.
> 
> The following changes since commit a74c6525f12f35a5af529ff057e63cfdc461704c:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 5.12
    https://git.kernel.org/soc/soc/c/52ded9eaa25a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


