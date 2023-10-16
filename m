Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1EFC3DA40
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F35F4C433CD; Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCFDEC433C9;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491917;
	bh=B7RXzNj6PrCZq1rM3HT0rTafw0YwvtrfIZPQQVmIljs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=O2C6g52m88Ghw31wSqlSHiryqm239vlgwXW58pjN1M6OwOOppZHWfV14f76j/7Ob0
	 AItK99XbTuolIlqIxrZdKK/M7DGvlSZ8rECBlJp3dTcmDWBfq+gvbkWOxa8ypWlTFT
	 GJ1/uZNNdyZPX4FCMX1rHi6TWV64r7mS0Vzvdr0CR23dwhnB129LENMCV8wcidOr4r
	 nv+PUWGUP+BniHTX+HcFLtRTAiu2taLF596FVKrXjVcrMbmqi2VU6qqP/rNSbKJ9Xj
	 K9Xbshqffu31sTLCZdso60i60bGAhqBOyYwdtUGgO2xBbu47ppCtLS8rcl9VgvB1Dw
	 Dc8Lx8kfBJ42g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7E1CC04E27;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM DeviceTree updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191774.22284.9676751481654108392.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <20231015204558.855987-1-andersson@kernel.org>
In-Reply-To: <20231015204558.855987-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 13:45:57 -0700 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM DeviceTree updates for v6.7
    https://git.kernel.org/soc/soc/c/6fd3e8682b0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


