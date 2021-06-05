Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816B0C48BCF
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 375CD6142A; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1ED9D61423;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622934026;
	bh=7yRlbHukYK+fpqs6xCl7plKddFnXtR7SexYvBw43eZc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WRkbHfQu1WLhNaTWl3t1A4nhswZuuhiY1swz3yb4S8PoUlopOUpiG5T+ZJPmROlTo
	 j3ipK2VunebO1MvdlxbZWSJS7U9lJaZ0Gi8vyZ3gBqXpoMLAqDH+lbMNv0drRheVpR
	 rgl9gHqXY8lldkIruJmYN3mHtqTito6kVF3AKw72hqpp5Rb+L1vFtFm+8MPoccTfxL
	 lR1f/qqeIrLg1fzO/e4/+5zd4m+h3PQOzole+KxZaXFa7YIzauytpmKgKXPLW0oAOt
	 +KKRiy6q1pPgGv2JG2VP1f/ki/f/99uRkBqsBc+mtIQRlG15D5GvkRJYQg1o86ghpZ
	 +82RxrdVfUqsA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1898A609EF;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic fixes for v5.13-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293402609.32315.3141187119979999105.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 23:00:26 +0000
References: <73e76706-f3f4-bebf-10dd-d2ec9106a234@baylibre.com>
In-Reply-To: <73e76706-f3f4-bebf-10dd-d2ec9106a234@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 31 May 2021 09:41:36 +0200 you wrote:
> Hi,
> 
> Here's a couple of fixes for v5.13-rc1, one for the amlogic Kconfig and another for the meson-clk-measure soc driver.
> 
> Neil
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic fixes for v5.13-rc
    https://git.kernel.org/soc/soc/c/3091a9e74240

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


