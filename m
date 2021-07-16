Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ED0C6377D
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1F1706140F; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0631B61408;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=/1RwpVTWlZKupBqBS40H4QEdB8jlgInk1DF8L/iKZ0k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MYEg36zn69CgFSVp2CcEGCGvH4KPr/0S9NU2mJHmB02s6JdhsLWMnvbECceOILP/A
	 KnePiPReL6n+0spofAJmnAVh+1K/nndwHrvSYmDErTl7ve5snUuOIA7GLYuyvxKHNJ
	 BL7BQ6mxVQgoiA/tQSyvTIvXGye3TqBMAKuYeZLMlDtHxnb3piyhzpv+LnlPH3JLZ1
	 GqFJN2fEMm/v0jTEwWxEzLz1ZZPcEnh7xaYZ6WJqoOtXiPvsAtKW/QkiajeQXo65ZT
	 zcoRuTY4jZSkbX4NueavFB3T/JUxN2uzMcgZuZahIDcZD9I3DB3ThxdVOfWjHktoW2
	 /aR+mI7tRQxSw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F3465609EA;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas fixes for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052599.25202.8658182439204302577.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:05 +0000
References: <cover.1626253929.git.geert+renesas@glider.be>
In-Reply-To: <cover.1626253929.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 14 Jul 2021 11:23:50 +0200 you wrote:
> Hi soc folks,
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas fixes for v5.14
    https://git.kernel.org/soc/soc/c/e0129a0e826e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


