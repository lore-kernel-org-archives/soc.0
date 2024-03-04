Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE18C54E5F
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E48AC32781; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 282C9C4166D;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=M+Ei2Fu5LPliIldtkarS9bXu/Gt2RTjZ66hf06ShFfw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oOw4YMqupjkBRkhlDzhMqBZRP8YFOnyS4DRWpn2Y3LzvuFIwaQIFyA6zjsWwTeS9w
	 zQ6t6gJvNg+p6lhgCnr94uAk2V9kdWENl1twcidl87qIuLOMWgLrtwfAU696/GdvEg
	 md3Mpcjgn/y98fSLcwPcu6kkV5SiKTl2krsZ+DpLv/FwPI5+TaNCD4EGVse303ODeC
	 Zh0E2grmZhS17riTnlrKJNqOR6vZ07jmimxX3fLr2d9QJ7zZWoRkotk21NK/q5/23j
	 WuOnGmb2THecIEc9qWUfaRWrNSsk/YBG8vCtkG51RgSE5F1WK+8h+vksHHl/uSJLRy
	 p0yIQKMdnrR+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 020C7D88F87;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927500.27833.6940483705058562446.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <20240225050146.484422-1-andersson@kernel.org>
In-Reply-To: <20240225050146.484422-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Feb 2024 23:01:45 -0600 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DeviceTree updates for v6.9
    https://git.kernel.org/soc/soc/c/aefe054f2cd3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


