Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27904C49EA7
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AF76D61876; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 95BAD617C9;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=NuAKjgGXxreL90pDXU4+TfyT7cFrjqSoj182nNDnWf0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZJ2DJTliBJDy7Y1A8mJFYmpyYNM+t9NJt7DMQGHzTEQHOPN5swHQ08R7EDjULpUA7
	 W2cGgL7nRSssCpLS7UBJr8/PZ8BjEaGYXztQiya4NA2JjL26C6OiH42GPogSn7VI0/
	 dQScnhTMqBXy4SO9wAvdr7pDFoCUEKfMMPuua8PnnE1dM61EqTIsjPdKrT59Eldy5+
	 PDTNsv8oTYUGfLuE0HRUBcvLu4y03a6488+eqDIAPkQBbiXBLnhd5HOoVN9gmBQDcu
	 +NV8Fu2iAQUO2pJ0SNtT3J9/YwarC3cbHzc+5IEI+UM/bsuqT75hVC9PFfDM+qc2/7
	 5Rn3vU+6rsNag==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8B16560A47;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] ARM/arm64: Samsung pull for v5.14, second set
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281356.17464.9032993314973751097.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Mon, 14 Jun 2021 21:33:07 +0200 you wrote:
> Hi Arnd and Olof,
> 
> For arm64 DTS I have only one patch so sending as is. Second pull request is
> for defconfig changes.
> 
> Best regards,
> Krzysztof

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: exynos: enable PMIC wakeup from suspend on TM2
    https://git.kernel.org/soc/soc/c/c2d0501cdc6c
  - [GIT,PULL,2/2] ARM/arm64: defconfig: samsung: pull for v5.14
    https://git.kernel.org/soc/soc/c/a996c70e4d7e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


