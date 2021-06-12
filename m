Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4E3C49360
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A48861376; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 24A716138C;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=pWot+AZtXh92ps8ssVo1n5Y/5aKQpBqMrSaI8oJY7KE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=temPXy5CrJP/zvElIRQeHNaSDZfw1u/ZLexVns6+81mccIIej1vJXFbTyK2LtK8hI
	 AOQmgVMP4ExjHnxT9SLJ6cNiDgiCjbCur0or8lmDDMlcKZLhSX5tmnV/E42EiNSZWu
	 mOpVafvxEmwWkyQZccEh3qmTzKijcJ+tI0XNk6Nt4DYXzxAD7fB3WI24LRy0IqkbPu
	 urQUzAHGSlReFzaBB8wMY7U7FPo3/MCd0J3t7xGucXPMbgjdaeYivf27AR6Pu1baVV
	 COMA02z7YimfUpq6sHatHkiyqBqoPsu7hNSYQXUae6ZkBgeEQNOhDAzM7YNMw+cQie
	 gaTlRrT78UrKw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1FEFB60A6C;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ixp4xx DTS changes for v5.14 take 1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421612.27448.1596642440194225382.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <CACRpkdbmRjGW7vpr7hG+jiRTqNMZAyKZNhtvzj=SqhZmb1+F6A@mail.gmail.com>
In-Reply-To: <CACRpkdbmRjGW7vpr7hG+jiRTqNMZAyKZNhtvzj=SqhZmb1+F6A@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 1 Jun 2021 13:37:54 +0200 you wrote:
> Hi SoC maintainers,
> 
> this is a stack of IXP4xx DTS changes for v5.14, adding
> PCI and ethernet and some other changes.
> 
> The PCI bindings have been reviewed by Rob Herring
> and are pending merge through the PCI tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ixp4xx DTS changes for v5.14 take 1
    https://git.kernel.org/soc/soc/c/3b0898f97886

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


