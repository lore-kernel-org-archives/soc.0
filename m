Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838D7C678D7
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69666C433EF; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53A74C433F0;
	Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390532;
	bh=WdNEHO0VRKv+8Mt2prShT7wXnDyo3+q/XFz+b2jDNA4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=t9h67oK/c4jea554JOFfc+9OJWwh/AqlUdnyEwFEANQPbe31bhl69I1XKf68XeS4U
	 rRnwL+wLEQX3z6TE5xw5/Psi4ZLJGqjHKOvqQyL+QDKhJT8q1tFxC0RPOWhWpYIyVK
	 33+YLaMfmvMHQR/ATtgFTlIHnOrDP3K6xq3orT2Nocep5++cVxpNb2dSy3gSbz907x
	 c8P/FdLde6Aa+fs2Fd2WWYwBzOUk600Q7by/FmuMHoPzMyIfL2lle6pxj67YiFqKoO
	 V62tPHJKm7UbV+fwsT4Gzp/DcNc+5iyliHfUKZCoBiglshrDEsaJFycMzylJZcgwr8
	 RjFg7MEkFhfVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3E98CE524ED;
	Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DTS fixes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167339053225.5083.13498246119094640508.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jan 2023 22:42:12 +0000
References: <20230110213724.2183668-1-andersson@kernel.org>
In-Reply-To: <20230110213724.2183668-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Jan 2023 15:37:24 -0600 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DTS fixes for 6.2
    https://git.kernel.org/soc/soc/c/23d39547655e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


