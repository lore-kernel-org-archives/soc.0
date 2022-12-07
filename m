Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A0AC63709
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7553FC43148; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52E0BC4347C;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670448029;
	bh=8f+H7rd2B2fQ9sGX1Rd2Oh1RUvnhUhMe64/aQezUtoo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gze+KUgyv2tTBi11hLLbAaR9MRahFPtt+NMfsc5y5MvdGZFaXTBhYtn9xqCHIbxC6
	 2zJF8VISLtYeI8bOYkjECCa1rjdF1YK/qfe14PU6JORyF691lpMdWRCuaaLJwRLZyz
	 t0Kl9jpriNhRJn/C8urnKSa0pUHQzOPiLncjsqf15XZb5n6AXvPaKg5zf8G2KuRwKI
	 jKAw231roeL9x3smpU4aC0OEUtp1sGi/uHqXggVQ4ohqil2y3X06xoOoiidAqnUJby
	 Pm3KoUqBVj0ycwXve+EWzMwSBa0lwBBg5GNdDR6qMg0ee01+p9ko2i+wE4Tlg/Z5cP
	 BBFq/vb3vkvZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1FCCFE50D9C;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167044802912.32577.13747926910975515983.git-patchwork-notify@kernel.org>
Date: Wed, 07 Dec 2022 21:20:29 +0000
References: <20221207154134.3233779-1-andersson@kernel.org>
In-Reply-To: <20221207154134.3233779-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  7 Dec 2022 09:41:34 -0600 you wrote:
> The following changes since commit aa9f474014b1e2665194a97dc4675aa187534bb9:
> 
>   dt-bindings: firmware: scm: add sdm670 compatible (2022-11-11 21:28:52 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.2-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for 6.2
    https://git.kernel.org/soc/soc/c/9379885d07c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


