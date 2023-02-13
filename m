Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDB9C636CC
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3082C433AE; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A75A8C433AC;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676302229;
	bh=5KBikGD2O28kzSqdDeQ9S/iS6saopqGBUYl9LNO6Wo8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BmySDlrsc+OAf7XeyRDrM6P/Q4d+jyG0RPNKu1ys4LSnYKzDDPIM6dxccJnotQ1Tb
	 +eI+4Xxy8I3UW5NtW9fcLw67piSB2ooTlXFoGtXIuMKlhOXdEmQOCQWRVkTZKOlWeM
	 9MNVmCC7tb/nWnVMzFpBDD5+FCDy02VKHdQl5kxHYX2lqx/knkXnVfdDgH8NIpZ49y
	 AVwgmNwSkI6otnUhkwGt+abtlra77h2jOpWH88TL5K4K2IpZUWNgGsXn84bQCiPUmz
	 qGQipbbgsonC28B6peLq8cx/M/3IXhoKd24XBVdY6CAmapkWXBhbRhjOmlCj5WZHFA
	 xenlytGFpEVvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7B103E270C0;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM64 DT updates for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167630222950.5266.3645653443895777261.git-patchwork-notify@kernel.org>
Date: Mon, 13 Feb 2023 15:30:29 +0000
References: <20230210192908.2039976-1-andersson@kernel.org>
In-Reply-To: <20230210192908.2039976-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Feb 2023 11:29:08 -0800 you wrote:
> The following changes since commit a63a420d050d47a6afb5e2198181dadd08e71f97:
> 
>   arm64: dts: qcom: sc7280: Add a carveout for modem metadata (2023-01-18 21:35:25 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.3-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM64 DT updates for 6.3
    https://git.kernel.org/soc/soc/c/7dbdc16fc85b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


