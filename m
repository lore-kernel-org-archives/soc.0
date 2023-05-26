Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B5C7EE23
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0080EC433A1; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9554C433D2;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685101827;
	bh=pRM5VjvRtwACXLT1GmLOEOACxUDIAptFHPg92oYBxZc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Gk9Q447cVOjnlcHaaoQmJQTZ6lVmw0bgL9eUoJIsDOm4Etb554YlASfmuq8IlM5Ol
	 ZS2wvBgMLxBc1H8MA8ZMzWYSLcT0ub9cVvq/lUvuJyVPN1Rw41Py4vsv0DBn4IFsXM
	 OIc7gbMfPr28f5aqpsIK9NQmRknUkEgvinXjUzgLKKl0MguBJXB6Aun/e24FsMwg47
	 O9vS80oDFOKofEGQPF8sUJwA5X1D5dEKzWIcRyGAJ/y4ktH5G/0LytnzBiPmMjf5db
	 zVovORYC3D3a7FJA5PnzhWGEf5UefNKvQMd4trZLhFXXz7GMCHv1o6PIX3zeS2qlcu
	 TLEV5ErBY80eA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B00CBE22B06;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168510182771.28560.17161522590951674203.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 11:50:27 +0000
References: <cover.1685094238.git.geert+renesas@glider.be>
In-Reply-To: <cover.1685094238.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 May 2023 11:48:28 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.5.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.5
    (no matching commit)
  - [GIT,PULL,2/3] Renesas driver updates for v6.5
    https://git.kernel.org/soc/soc/c/2336ce7f456f
  - [GIT,PULL,3/3] Renesas DTS updates for v6.5
    https://git.kernel.org/soc/soc/c/1bf42cfed0e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


