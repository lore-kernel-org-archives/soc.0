Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B547C636D7
	for <soc@archiver.kernel.org>; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52BBEC433EF; Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C916C433D2;
	Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676470820;
	bh=wGj4kbgjMufgrG/RmFIlPDxXYlI+WMb8Sz60QbU53mM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=agRcBh1KsP4+npBnpxboQdWWa/qPHfyl5QHAQpUrk9yn2/Wnzm3BHSKVcRfgoApqP
	 y7YgtvwgaUwFnl6rZuBwTOHa8OsRZa76FyWa8RYb0p0hywdRb8x3JMsLBm0FAkUkmh
	 YjjSSEAPsRbWY6G9yho8/e0AV2DK7ourGADE9s1W7dJnDCtAJpew8A4pKnpVS7a7ft
	 SC1Sy9bCuWbsrX0r9g6IYj0o5GZ1+MSQxB/ENj9G+Pci9t6XS37HvH0ZawwTzZokVM
	 QhgER2iMhSiVMp4qLY5iM50rGFcRhum0MlwpygbkTbwWaGNS4DBJeHXLO/r2SvK5Ms
	 3YjtMs7N3g+mQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1741FE21EC4;
	Wed, 15 Feb 2023 14:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Last set of Qualcomm ARM64 DTS updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167647082008.22208.373178813269795521.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 14:20:20 +0000
References: <20230215051530.1165953-1-andersson@kernel.org>
In-Reply-To: <20230215051530.1165953-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Feb 2023 21:15:30 -0800 you wrote:
> The following changes since commit f069ede81ef438d99e76112d8738c4dc3d1766f9:
> 
>   arm64: dts: qcom: sc7280: Power herobrine's 3.3 eDP/TS rail more properly (2023-02-08 20:09:36 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.3-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Last set of Qualcomm ARM64 DTS updates for v6.3
    https://git.kernel.org/soc/soc/c/18b68c695ca6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


