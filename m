Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A6CC49EB7
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BFE5961400; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9DC43613EF;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=vMsaFUn0aR014Xj+sH8Ph53JP6yACF/dvXldg6DQqRI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Mt2DYUMCbe6SQEcnTJzuc7aq7a/iBVx3yHGiWjpn7p1p7QSYmWY413pEC7R+bkvJa
	 Hqw+10LAgyNXPtXBqJbo1veY/2bR1SxUaNqs2zLZ4pwOEwMtb9qmvFRtx7e21ns61r
	 JLWTXBGAWRnIaYLoUrHhbm5usNHGqS1vsNDr6tigiDp+XCrVcuLxeFzBFc9ExXxAD3
	 WcgpmKZXR75o7hHsleR/8ICo3IT4ovlpBls+2oTQEQ8hdu5MGK441OsCs6m5Q+JNyh
	 daZd5dZpm/bCZDal9FL+Vs11Nmto4Ij+4jk6XXWJt6J/cxw63fjoxR1/MKkS010i63
	 9LLTYYh80CIKg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 918E860CE4;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ixp4xx: Add crypto engine
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421659.27448.13293052679685898908.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210605161007.3397216-1-linus.walleij@linaro.org>
In-Reply-To: <20210605161007.3397216-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Sat,  5 Jun 2021 18:10:07 +0200 you wrote:
> Add the crypto engine as a child of the NPE.
> 
> Cc: Corentin Labbe <clabbe@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ARM SoC folks: please queue this patch on top of the
> other ixp4xx changes sent by pull request.
> 
> [...]

Here is the summary with links:
  - ARM: dts: ixp4xx: Add crypto engine
    https://git.kernel.org/soc/soc/c/e6f600e72edc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


