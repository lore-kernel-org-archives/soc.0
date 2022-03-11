Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF5BC433EF
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 10:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8868C340EE; Fri, 11 Mar 2022 10:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7304C340EC;
	Fri, 11 Mar 2022 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646995810;
	bh=+gy9SqhvapU7GQ8Wmua8LahM+Dx5nK0vQvFjrdZ3Uog=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iVLgE083RpjIzykq/31lb178UzWSSgZHTh4lGo1kvkZ2dPh1E5pACeSrKwGRe439r
	 CgWHxlaXbyG5bipNjwEWAhfgaN0iFkQ9wZbVgvKXDYVTQFWIcKgaMMD0e9bTD0wsNJ
	 3+7r8o29s786nnSMC/zOQ/HmasaGoDQsI0jrbMO3Y+dszS0GEInLsLvKLtjU89x0Wv
	 +PtY79Itrrm2WafpfzScmlZO0TcSMnep8Tcutpv1y9L/jZhpBVIyZMsbQRbnIiToN5
	 0x0NzX8IGkMrD/zhrGXeGf7LaIKwx3o2sKmGAiya8FRbfTh5SL3rVks9DFDicFpLXW
	 5zuqIOGvz4gcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F6CEE6D3DD;
	Fri, 11 Mar 2022 10:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] PL022 DT fixes for seattle, lg and lpc platform
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164699581051.25725.6706762400815957104.git-patchwork-notify@kernel.org>
Date: Fri, 11 Mar 2022 10:50:10 +0000
References: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
In-Reply-To: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Mar 2022 15:07:57 +0530 you wrote:
> This patchset is an attempt to fix DTs which are not compliant with
> pl022 spi binding. Please note, there are other fixes required also
> which are sent from other trees.
> As git trees for these platforms are not available, Rob advised me to
> seek help from soc tree maintainers.
> 
> Arnd and Olof, could you please help in reviewing and merging this
> patchset.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] arm64: dts: seattle: Update spi clock properties
    https://git.kernel.org/soc/soc/c/2201faa9fd72
  - [v2,2/3] arm64: dts: lg131x: Update spi clock properties
    https://git.kernel.org/soc/soc/c/19297aab805a
  - [v2,3/3] ARM: dts: lpc32xx: Update spi clock properties
    https://git.kernel.org/soc/soc/c/dc89633b8a1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


