Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0E1C41513
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 15:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF5AFC4339A; Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9553C433D9;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697469685;
	bh=0AZxRUTOkh55lnC4yAGzLjICfDAnXo9pHxb76k2S1OM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mJQPXD37CygH6v4EZMFkBAXwTjs0OnnFnilddWkp6SPEyd37K50TCn4aV92/fFLIT
	 jCxsSPcNzfV2AVIWivjOAeFy6NYb+ws/XnLglOuy1D2uGN27vYYrOjWX4aDL0z8ao8
	 WQW9hhj59vDgFXOCPi/GogNrr6V1Ms2rNUDw4NtMpz46zKnXdpqh1dJOEGfcd/SBmg
	 7cnC4OUNW0StMNsM4HlP6hk42uq/c8UyCUVoiY3LzQbbCUWMsYw2PN2xG3LtwMjfdV
	 bRGZwGNLOSNf50MNW+D8qem/RUPTg9DlVSRm5kEKCNcA8ywPNvk1Zt3Xw0I0XYHbtD
	 B7Oaw9Burz1qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A991AE4E9B7;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.6, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169746968568.27582.13049887567391308000.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 15:21:25 +0000
References: <20231015090202.GW819755@dragon>
In-Reply-To: <20231015090202.GW819755@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 17:02:02 +0800 you wrote:
> The following changes since commit f09752eaf0e8f8befc26b44c4d3e15633e56d16a:
> 
>   arm64: dts: imx: Add imx8mm-prt8mm.dtb to build (2023-09-25 10:19:52 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.6-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.6, round 2
    https://git.kernel.org/soc/soc/c/48519d648b1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


