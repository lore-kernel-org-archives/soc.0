Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E991AC4332F
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C566460F0F; Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AE83660C40;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635265810;
	bh=FcPJIAIbK3YY42FRoXqa/bN4y87V8yM4CKIGdxLS60s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NOr8Ta/DT1Zr77uTE6gCV1HS0k8pwsV212jnp14P0C6UdnzSWZZhZXQiPiqOoG8vt
	 OVRomvuKXNYDFXu2F62b8/acM0usrKbRKjNvcYR2b/X8x4NWPcTdhM38RRIVe18Gjr
	 1PDrOGaumbwx8eoFyeibIXLH3N3BMZWeSRQYxhexpwRo2HuQGzMAD64DNTce+2akDo
	 SORt0wMJCjgBxsXOO3hLN3W8/Ilo+rn3r79MgJL4oGNVPIdZ0nL9Nll1WlqawVqgNN
	 Xc83MgazNwVEHmqNA4PLqUJiTu5xJ16459tVlobr6IuwAO7jNo6p+VpU2YgPK6b1Gl
	 CLKF/EgQVjMXQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A98AE609CC;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: SPEAr: Update MAINTAINERS entries
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163526581069.16112.16916936567855829349.git-patchwork-notify@kernel.org>
Date: Tue, 26 Oct 2021 16:30:10 +0000
References: <b3e7584fb5fe7402065f54f13954c9eca9c47bb7.1635140757.git.viresh.kumar@linaro.org>
In-Reply-To: <b3e7584fb5fe7402065f54f13954c9eca9c47bb7.1635140757.git.viresh.kumar@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Oct 2021 11:18:10 +0530 you wrote:
> This merges few entries for the SPEAr platform as separate entries
> aren't really required.
> 
> Moreover it adds soc@kernel.org as 'M' entry, to let them be cc'd for
> patches, since they only pickup the patches for SPEAr directly due to
> very low traffic for the same.
> 
> [...]

Here is the summary with links:
  - ARM: SPEAr: Update MAINTAINERS entries
    https://git.kernel.org/soc/soc/c/095ecaa9e94c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


