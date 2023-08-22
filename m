Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFF1EE49AE
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42815C433B8; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2395BC433CD;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=sLY5pgXK8M+22ym6+BUElM/paYKziHW7NWkVc0nbH7s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CJFEPXGjNQl43omiyn5aYZn6DCGvo1bhzXHeVt3M/LnjwJBNpLgakGIzm2gMFkNde
	 uUYC3wgYTAo1wcp2X3Yuq41V6zYMic4McyZKhmEFmBlBk/RKDE+9RZK3eyqiVIM6lv
	 rWeOqLZNtz9paH8yrA8AV8GtcB/OBP4qNFX706CFgVWMBHR4/nL3Yzc3SkN5xvMKr/
	 8B0i2dRRYL+dKji/BtLHKmKsLj60Z/4P3qcMV64IItlMD5hbplz1pCXWUWU9nTvs6i
	 d+HqW+PtjY5l8uImbF2aaARDvz0+gujbKaA59EBrFdTd7P+1nO2l0a77FT3FcSR0qz
	 la4e6dPyfsOiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE140E21EEB;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147597.32531.10528100678630269819.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:15 +0000
References: <20230818023651.2484774-1-andersson@kernel.org>
In-Reply-To: <20230818023651.2484774-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Aug 2023 19:36:50 -0700 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.6
    https://git.kernel.org/soc/soc/c/d2dff8d84df2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


