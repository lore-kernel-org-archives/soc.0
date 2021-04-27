Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5846DC43460
	for <soc@archiver.kernel.org>; Tue, 27 Apr 2021 21:22:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E18DE613F5; Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CA46B60241;
	Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619558562;
	bh=JyXNJVwMpBowTe10Muw8wCqD7LGW1uEJ1KBqLIi2hNI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=M83nKOfySasJn4FGjRwt1NjIWKS1uxH5kuwc+YmbmfxzlZZDBIpprAejY9LQ+0Hmj
	 /ppH5zrgWvJTIrYlMorkPIWUC9Wgg8TQCv7Z+DbpOqUOb2qsHaM52u224IEpXUAiRu
	 m4XJV/6GsXXtHmZlUTi4tTLeJWMrnbnRXX7sNKEKa3gOZsbyIT4SOZJbtAVqjjoJ/s
	 6qxasyL/LP0egtFrowYBIvM5OJg9LSQ9jIQKDrGQwf7yIAEbx80YBzle4KXjllEgxD
	 k8VgS50c0d5dMZq0i84+3ovdpkEt1d46sJ2QBe6AAOfV44ijI2i+NQs8XF5bUjKiAO
	 /BDEwgmIpAdqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C113860A3A;
	Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM SoC fixes for v5.12, part 4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161955856278.21098.16425214312269337459.git-patchwork-notify@kernel.org>
Date: Tue, 27 Apr 2021 21:22:42 +0000
References: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
In-Reply-To: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri, 23 Apr 2021 21:55:22 +0200 you wrote:
> The following changes since commit b9a9786a13ea158ee3b23614217f2e3158178421:
> 
>   Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
> arm/fixes (2021-04-08 17:56:09 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM SoC fixes for v5.12, part 4
    https://git.kernel.org/soc/soc/c/6d1d45cb9834

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


