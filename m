Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44850C6FA8E
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32D30C43149; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C63FC43144;
	Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996625;
	bh=It1/Jd96woZUQ68ZrPfD+98YJRgxG/tCDITGGmNhVtA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WLrmHoFQLJEXWb0+3za5QCpcfxAYYxhNLFeRg0xEqBwyIuLpMrbd/JCSgDMI6BA+U
	 ytIIQ+kKXYMV5JawCP9h7khTxma4lHGp+vnq2dlX/mbSO1D82aOUwc3y8DehqeVIF1
	 coaWZdD1XwKUs/reKuou4lgqHBwvPb9eIf854pnpyoeY9eCe4j/qCcB805c+mDTNvW
	 lOzQS4u1S3tFF4P1AzMhggb0iFZLxXBMfXmWxRHLeHVzRwtFUaSA8Mxm8uWSroULPC
	 sCgPncWkqToyCWqL5UDH8RW7OuxUWBuYRWwR1OK4i5LE4kOnsC4RABWG3j9GKWa6h7
	 4qfqrRV7B7LjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA405C73FF8;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Samsung SoC driver for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662495.5098.18275875959748374948.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:24 +0000
References: <20220909150849.820523-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909150849.820523-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Sep 2022 17:08:48 +0200 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Samsung SoC driver for v6.1
    https://git.kernel.org/soc/soc/c/d6ce6d14316e
  - [GIT,PULL,2/2] arm64: dts: samsung: for v6.1
    https://git.kernel.org/soc/soc/c/2c12f88cef39

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


