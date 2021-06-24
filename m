Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC95AC49EBD
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 43DAF613D8; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 22DBF613D0;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=7bPqguT6x754jhV8zXdmI4MP+9Iar1gzoCyjyc2EZSw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Yiv8scmC88I3m0zvzz2X2B03abx5be7G/FeVdlNpE28yObrCyylR2Xpovic4W6iB4
	 zuTpCqb2ZesY7tgvs5jZkAm0bvljgEP8K4X0512jK/hL+Kw6CmmrdzAO3fuJaBsAxJ
	 MCTqJbCGGxNSJKCanWd8rkbPM7hn7CPM8lWz1yescWsLNw7pG9zD0iBTUG5k6+00sC
	 XUA3LECD9afabXtPVFSWpRYiyS4SUCHExgkp9pbpDYO1D1RN6eyeCuWYUGVj1+AqLz
	 EcKme7/Y5OSjqgTtPE75Z0jcQQEvAzzHP24tOhX/0SEJAVIPcbSClalWpPEGY4b3bJ
	 hozJKPFZ/Q32Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 13C7A60A4D;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: drivers for v5.14 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241107.24025.14254619450167311462.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <87bl802a2d.fsf@BL-laptop>
In-Reply-To: <87bl802a2d.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 20 Jun 2021 10:51:22 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for drivers for mvebu for v5.14.
> 
> Gregory
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: drivers for v5.14 (#1)
    https://git.kernel.org/soc/soc/c/115484216b07

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


