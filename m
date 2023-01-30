Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC657C63797
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0001C433A4; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6CECC433A1;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=i5BrayM07nEmXmYwMcJ+917vWgS0suNK2nrUVXKqI8Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GwHWZUS/U46gHodmVlC7qH+dPOav2fXq3Z2iHnnvVlXdd6kI94Q2upen41XFKr38w
	 DOWZ6TAzkNpZ8VsHzuUnttVDbZ3OCwCOT3+dtoJt7EcgyKp26SdDYW5rPa/sSnWsnr
	 G/gamOO9TWEHA8dnx6MF1h3T32yWm0NLM2n+uZcbKuAiM8vcF15m4tqnGkHujXWO75
	 T0xHv6pg21/v7S2cTK9oIqck26tnBHrUOUafrBrziR4On5hoG9669iKgQENb38dTJb
	 EpyEy9sS9/8fKXgp32enPOJ7Kitr0DKFPKImrrWQMPUF4KhT+lZPhLo7qAAfldokH6
	 mY6fHG0XymXOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 794F5E5255C;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 Devicetree updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786049.29049.15023193580923620572.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <20230126202528.3691539-1-andersson@kernel.org>
In-Reply-To: <20230126202528.3691539-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 26 Jan 2023 14:25:28 -0600 you wrote:
> The following changes since commit 69876bc6fd4de3ad2dc7826fe269e91fa2c1807f:
> 
>   arm64: dts: qcom: msm8992-libra: Fix the memory map (2023-01-10 09:49:03 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 Devicetree updates for v6.3
    https://git.kernel.org/soc/soc/c/2e0f3acb9040

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


