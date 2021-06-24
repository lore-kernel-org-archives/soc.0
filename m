Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF288C48BC2
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A4B9A613B9; Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8F11B613B2
	for <soc@kernel.org>; Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502406;
	bh=HUG+Ic1ySnOqCuYByZocdxIO3ldKYenuiEbg1D4eU1M=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=DLc0v1XfGlsXxhWR+HFBpeWuMhSsdE1QsQhKUYbTXjbBwZ9vy3FotMFXU3FV25E5X
	 6iHHt8eV6L5zSpknAEQcUv0SYbVXW70iUfJaMZjLVDo9Q70McBiy8Tveu5qEfHqn0n
	 ZOhsnmp0B7X2a25hVs+bo2TZtyPZdb6TlhnGYBBZQQXvVoUnSzKfGyyyqKT2Xe7zdq
	 DakNeDMPKnSqD+Ie6Z+h1+NnJlvXPAlMw7S5sek4XWzAqVKwX/rG6PKig4faBiqNcU
	 MF0BwEqAkDqmVxLmufDb+b492/y5fHhXH5T7qAbeNQkmgkdPrwKMwkCwMpPUytB6Jh
	 ybfuZDL/3sCDg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7CBCA6094F;
	Thu, 24 Jun 2021 02:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450240645.24025.5237928557897071478.git-patchwork-summary@kernel.org>
Date: Thu, 24 Jun 2021 02:40:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] TEE reviewer for v5.13
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=505033
  Lore link: https://lore.kernel.org/r/20210622130454.GA2196996@jade
Patch: [GIT,PULL] USB4 regression fix for TI DRA74X
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=502999
  Lore link: https://lore.kernel.org/r/pull-1623999845-180025@atomide.com

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


