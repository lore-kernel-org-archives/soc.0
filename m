Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF70CDB483
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7DAEC433CA; Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7149C433CD;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697469685;
	bh=65QJdzo2pqEZkg5PuOY+iYZYkZvE1eH3AFaYsxWrC0U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=c9N+49Dcz4+mVEsydf3H8QB91pCF1FXQfqkanp4jzfyy9/B1r4X25pJRKwJFAD6/1
	 Lm3ACuKLVnudn7ttfJOFww+eovFGVyOQPxdOElCwpaAy2xGu6JnQcFZwt4YCoVxZP5
	 zNg4gEv9VnQmJmyUjx2zFslm9kMiF7LIft0BqaOy1B2cLuNZyRLgB5pLi7XD3X6FcD
	 t/7v15XycncC55NEEyJVbq4PmEIdmsLtOsllY1u0tz2A2fW0Ku4NFMD1fASVBD05Ax
	 Wh5UQg7zwzMmqrWjojLaq+EcrHJaeNrEqW3S96rASN+GSNz8WQvRB64Y3l8UcvF37s
	 /3VlM0UIEw/qA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AFB42E4E9B4;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas fixes for v6.6 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169746968571.27582.12176776030921424125.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 15:21:25 +0000
References: <cover.1697199963.git.geert+renesas@glider.be>
In-Reply-To: <cover.1697199963.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Oct 2023 14:26:44 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit c1ec4b450ab729e30d043e927fdfcc9f764f61b7:
> 
>   soc: renesas: Make ARCH_R9A07G043 (riscv version) depend on NONPORTABLE (2023-10-05 15:07:57 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas fixes for v6.6 (take two)
    https://git.kernel.org/soc/soc/c/606c577f7557

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


