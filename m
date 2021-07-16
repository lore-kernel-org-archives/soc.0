Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467DEC6377A
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D7D1F61402; Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BD7E7613F3;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470525;
	bh=CO8/TztkSOJEbuUjGyM4sc9zh0EefoxKYfyesyoG70c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GaRrqwiLUw2ciGW9zlY3gGm6I6jyW2nG4DuEEWYrjqgPKWwzkQ971TlOvH3p6HxbD
	 V5fEZHoxF96cgCzAWBKwWjL4rbmmCCZwgVu7WMLdo/f0OFRwo4UYlzOzZG9gKiaK3z
	 JQzQcg8Aus0uUDe7LWXvzqRY1fm0RK8egcOn8dqlIG6M+j4qO/BazQriNDZKqaz7xU
	 YJmQSlH/mH1XpDHhSrBqxJeDwI0qxpv2/rZtd0QIFyM8zlZ/ogd0KfH+II2EDcBsf9
	 O9e7poJ6kKDevjJ0GrSCPuvSVxo/7+ZDj4cjIKgXj9tnEqCWHa3k0P7LAcYYkv2xTc
	 xq+cjEsrSYNTw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B349060BD8;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052573.25202.10969672447017490873.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:05 +0000
References: <20210709150220.2543875-1-thierry.reding@gmail.com>
In-Reply-To: <20210709150220.2543875-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri,  9 Jul 2021 17:02:20 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit c7289b1c8a4e10bbbdb7097a71a90652beb767a1:
> 
>   arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: tegra: Device tree fixes for v5.14-rc1
    https://git.kernel.org/soc/soc/c/93346fb3f669

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


