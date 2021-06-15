Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D22EC49EA6
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8D3C8616EA; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7292E6162E;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=vATTzdFbduH+yWklljn7F4x84tdKAQrT+eX9PeKyHdg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=M9MFAYHXIUx+hosEdho59aagfg0mG3tg8+HfpTPQS7HZhN0ckBvwzjBMvY2Ru2MBp
	 IRMsRhhr8URaxoJ7KCWvaLeIZissWAMfMTmKEn6RmNPXLjnJOChmpS1eBwsayu26gK
	 bU91dHByHaDKc7j0yw/AX4AFZ6UgAilY2+x624YHW2mdUaUlcngqtKg4R8rlhVJHNs
	 xuCRL4Q0Gzy/ynPSxks3H2cN0q4vXU1iUkkPcjE09a4gi82GHiWzXr5zUIbc0JBq4J
	 cDdab1wZPLyWvf/gINDznweFrCUDgS/ggyGf0U+zMXwz9VI8CtSQXNVztf4kvBkNhJ
	 UMXbS/tvG/R9w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6724F609E4;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm DTS fixes for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281341.17464.565268305980555409.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210614215552.391887-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210614215552.391887-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 14 Jun 2021 16:55:52 -0500 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm DTS fixes for v5.13
    https://git.kernel.org/soc/soc/c/f2a4ba9ec23b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


