Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CB9C678D5
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2F6CC433F0; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C5F3C43392;
	Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390529;
	bh=Fcv5bV0WFxQqN/0vbQ+4tR6aICx03GPyyUCZPnOhHCo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nVJo9lspREh7YN40klF8v2FJu7SA9QCnnYiMXSbB1X3uLKfUWQx4LCmgDZ70kcPnX
	 mE07+c53d2GGBVGRslhfFBioF7I268yutVCnavwyhMVIMnMXLUp7mVtnHNq7hV53h1
	 P4dJju6Yk5LN8W/WuYSpZBfaX/UFKR6uxkDvabcZelPc8K5IWpy3lAmybOz8GAN+7N
	 +yPqKne+t5YpJI/vf1RjsGoysdld0sP5H2D7ejYU0U2yBwhtoY261ttGvi4gAPp5E+
	 bY7JWFu0R8Y1/+bD30eE1PNfTbGUJjE7pSDr2+CJrZgZG+hb+pF46qZvS3FO/oblxd
	 +dLieTNy3Ydzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C5ADE524ED;
	Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM32 DTS fix for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167339052944.5083.10960286164764466267.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jan 2023 22:42:09 +0000
References: <20230110212750.2182904-1-andersson@kernel.org>
In-Reply-To: <20230110212750.2182904-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Jan 2023 15:27:50 -0600 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM32 DTS fix for 6.2
    https://git.kernel.org/soc/soc/c/985d7fef1121

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


