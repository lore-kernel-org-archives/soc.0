Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51DBC54E41
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C74C5C4166C; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB2D3C43601;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=7T2Zsv8L9Csc9OQ7LHt8YQD5AkwtaYMRcOfwBrHe9Mw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pFf08ZaMdb4zlkjPRtS4etx3wLAvbK9j59KMePAHry/c8GJjccDe/4iTw7wON5miR
	 HNWGG8BDCjGZeDJR2IVOS8RRWabcF4Qo/CoCpPuYCFJLRHIyjs96RcTXIaEcNAbQZ8
	 b5bH35JViN/Ouhrasyky50HClGAM/DEgmssUEr+ZoNohEPz4Lvnc/xx+VTeb4bE4Ad
	 wqDMCTJQP7aTN0MqcKk/d6mWeNdCDIjxShs+QEfOJKciNekWeTPdMzpTHqkZHC/VVb
	 BvM/vg2HlObUDUvUw5cpz9YUs3raIckVHBmdEyNntjerHxiEoEJzoXS2WO5i3H8WRS
	 W5Ynmhsv61Lrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88DDAD990A7;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] soc/tegra: Changes for v6.9-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612955.13542.16217287262567397702.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <20240223174849.1509465-1-thierry.reding@gmail.com>
In-Reply-To: <20240223174849.1509465-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 18:48:44 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] soc/tegra: Changes for v6.9-rc1
    (no matching commit)
  - [GIT,PULL,2/5] firmware: tegra: Changes for v6.9-rc1
    (no matching commit)
  - [GIT,PULL,3/5] dt-bindings: Changes for v6.9-rc1
    https://git.kernel.org/soc/soc/c/44514c326cf4
  - [GIT,PULL,4/5] ARM: tegra: Device tree changes for v6.9-rc1
    https://git.kernel.org/soc/soc/c/2d56bb99b681
  - [GIT,PULL,5/5] arm64: tegra: Device tree changes for v6.9-rc1
    https://git.kernel.org/soc/soc/c/b1208c4343f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


