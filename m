Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCA5C27C46
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27568C4339A; Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12098C433D9;
	Thu, 26 Oct 2023 16:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698339031;
	bh=6vtSe0L3kkR9Qsu2SeEvWln43jDI1prm1WByKpO2ego=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IIPjmP8HFMLHfmrInPeykCrCoV/9ec4lAdGzfkTlCFNlCBl1fjEHur3/z9yQ0mMSX
	 O4zcn5BbmbfhUvoHt/1Yhjai2YymCLtJpHJGMaTdOymZkWa6LZF/yTr/cCsLT7iwPe
	 v3SGlirBf7MT1z/a3O8vM3cVHwrbfdzTxYdG9O/H9mHR7SULycvfjKloPhl+qgrGbT
	 w2TF6XN9aJdjlRMvy86Fcy/ux3p6GjW7qap83cEffO3nu5EHedeQDkfxnsbwrP4khj
	 jobnZe6fdMdXCK0p/TYax4BkQ38Q84re1cy3zst1Tr6ZG+o0PvujsXY0Yxaij+aSky
	 pWXob3QVO99lw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D85C3E11F57;
	Thu, 26 Oct 2023 16:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM64 DeviceTree updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169833903088.20019.12289470905688863245.git-patchwork-notify@kernel.org>
Date: Thu, 26 Oct 2023 16:50:30 +0000
References: <20231025200053.1015821-1-andersson@kernel.org>
In-Reply-To: <20231025200053.1015821-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Oct 2023 13:00:52 -0700 you wrote:
> The following changes since commit 33e9032a1875bb1aee3c68a4540f5a577ff44130:
> 
>   arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators (2023-09-27 16:07:27 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.7-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM64 DeviceTree updates for v6.7
    https://git.kernel.org/soc/soc/c/a6e72119e645

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


