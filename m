Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81042C2FC22
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BE50C433CB; Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55B08C433C9;
	Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692276628;
	bh=JLmozRWf46UgyBjc6h3TFb8/V5XIRpT4woEIimqJLGw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ick3hg0Ga5hK2DX1y1Ivn9138wlkaCcZoqYNYPZDA+wN1hRGNEEeaLBiie/lb+/K+
	 clGLxOqc2RrJmGtKb3hqCh3AUrypFeyFEZt1ukAN9DrIBM9dTJUu4SLa9oYBBciN3w
	 gygHI2lF7Y4aXoEOSQFw114I5retUuACGKL28HFTOGTfwfqjAkIrLUwCNH/XUc026A
	 H0hcA0j21IWX7ZPStJnHWmfN3JbjT5z+mtvnake5EqG4pbw/i/uZpiLMKUxD16CvEP
	 XAdzD42NunhsR77mH2z7QiHTofaocM78Y9A5FYeOI1/0X1mx628iz+7PfOdgGTsVOT
	 1XBzv874haBjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4062AE1F65A;
	Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 fixes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169227662826.28155.16052561822167667022.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 12:50:28 +0000
References: <20230815142042.2459048-1-andersson@kernel.org>
In-Reply-To: <20230815142042.2459048-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 15 Aug 2023 07:20:41 -0700 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 fixes for v6.5
    https://git.kernel.org/soc/soc/c/3c78dbf25135

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


