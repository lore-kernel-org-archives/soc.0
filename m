Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3598FCDB474
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D200C433B8; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05781C4339A;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=8If0BDKeJfwpq0Lp5SQ1fLlsf1mBQVgNuVWlYoA5BTM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TxFVipzx9G8zXpmkGWpgA2jIiJGwkbu9g8Dr9vUk2WfXRBN220Ox5l+Xa+rZtOgpI
	 P0TWOrZvm6SpryMcjI2lRSU2dQQUDuvDGGLnVKZtxcCN9i3lYSVQG48DH9bHMHJX0m
	 JGewKAv1attdSnclg3uzBIst8TNvNqFm2E2KCC1r9C+s4XqqG54wNarPbiz1FowuNQ
	 lOCc+2L9fZWqIfyNc2n5wk1yq3TbvU1e/9Nt/CzDRTxhfYdPJyHlpfRlMxgtPmnm+1
	 OxShDNhGMQwO+9R/5ogHLbB6cIKYNowEXh2RF91H1x9/p3dnPN4Gh18OXNHwWZzLex
	 6gm/3GEIjxdIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D43B8C595D2;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191785.22284.8773171370676327433.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <20231015191107.854658-1-andersson@kernel.org>
In-Reply-To: <20231015191107.854658-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 12:11:05 -0700 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DeviceTree updates for v6.7
    https://git.kernel.org/soc/soc/c/68f1d4198cd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


