Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D09DCDB474
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBB9FC43391; Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C51B2C433CA;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697469685;
	bh=F8loCxa3aHBITcrmw7/bAdXCPRBjxS11ndzIK/x2De8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tcJL/T8gxw+S7BrpxtwBJRxoYDmBwd/NGG3yFwopFRKTuKMjHUiuR91+RYSRI1MXs
	 eemG4f3vO73paNGgeK0VqrKnJAt/okts7edfLPb/zhzvbPFAAWqUA9ULJDmvesmvq7
	 00EuGH1XMmM7mM8mO1DWMhUlhMY2h52t8kejBXlcHGO2S/2pSgVrQgyL99oSTPxcIi
	 6pSRLzKEkw+rVzTj8vLV8/4gGTV0mK3fY7u1lKBSea+VHlTmrkJzbRJ1p2MLLtvLZF
	 870qOTbhNbOmch0mHcL/J2VYXQHJ3LNdR062HOdY8OFB6flEfF6NuJOWfRm4N2xnEn
	 abMSJAJlbo55Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2A7EE4E9B5;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169746968566.27582.14011932216007251943.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 15:21:25 +0000
References: <20231015180112.853805-1-andersson@kernel.org>
In-Reply-To: <20231015180112.853805-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 11:01:10 -0700 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DeviceTree fixes for v6.6
    https://git.kernel.org/soc/soc/c/5e24617f6686

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


