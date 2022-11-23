Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6241CC47089
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53216C433D7; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37C3EC4314E;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=K51f+5kw/qAWuG3vvqDZKBOkCUDqFzrZIm3LpERmWgQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JiEpQcggN2c8j9pHrtBlUacluTSZhG9Xn+u8x2F2gJUGJTj1D/8JaO0gStaedTcvz
	 EkqzlIVMo9pU4JqUPZZgJax33638+IvRW2sJxsQ8lQywEDGt2tjmncX4FZVigT3G79
	 vRRH/dTrW4dKYiEHNEGJYCgemTxOtQUX8Q32+IWMTizoZw41iSdR+P78IF4x8ixhAB
	 2XMF/O8gnLKHEjKJSxh7+KKNSWuhtAKK8ATEMEZb+hgySVFO+8K+Mhfvz6aXSUEemh
	 49ZlD8XTvufGIf5cM6axi7hBp1d+hssgmr7uPFnMSQiuogzy161i4vOIySn2FcVMtH
	 Y2oSxvXgquv4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C173E21EF9;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM defconfig updates
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482411.7332.16131950811831144022.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:00:24 +0000
References: <20221122203452.1855254-1-andersson@kernel.org>
In-Reply-To: <20221122203452.1855254-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 14:34:52 -0600 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM defconfig updates
    https://git.kernel.org/soc/soc/c/3d7be6e5fb27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


