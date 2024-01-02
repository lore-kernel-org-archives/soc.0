Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF33C47422
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1102CC433AD; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF3CBC43395;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190301;
	bh=kk13AO10wuS+Xl1F9PKD+Qf8IosQQDaEF/QbLUW+G3g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nXQrVyiqDNv3rknLG5Yx0dAE0Go6p6T1EdO5GTFgDjsE2b3fno6jCCLTCpHJiZbb1
	 ANRxlsKnFpGm11FR4MUBCJvG1DGBvY/qYvetrFnmw2rQDSjMfLlUuDqrvEa35XdazT
	 5P6g4jtlxN3gjTqeO4yeCL2KVDuXv22Ds2N0MZbIu8P6aJDbRWraE30fvtewWJwPZo
	 rS6rBmBeOElbqJiZ3zbwDQGym1cM6nzOG3uL7QnYIBxqLH4K52tGA1aPUHADSDK3/o
	 ok6L0xkZtUr1iK3iEH2Y1Blv5jc64XpD1EfLYExo6CO0haRsiFG8LK5MUrUBl4yO2y
	 K5riZLe/BKaTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D962BC04E32;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm Arm64 DeviceTree updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030088.6407.8964024744780935503.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <20231231034108.3262678-1-andersson@kernel.org>
In-Reply-To: <20231231034108.3262678-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 30 Dec 2023 19:41:06 -0800 you wrote:
> The following changes since commit b7b9a6aa7aea2bcba2d35d65e4ce2913115485a3:
> 
>   arm64: dts: qcom: sc8180x-primus: Allow UFS regulators load/mode setting (2023-12-17 14:28:17 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.8-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm Arm64 DeviceTree updates for v6.8
    https://git.kernel.org/soc/soc/c/f3a4d7c3ffc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


