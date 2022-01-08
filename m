Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85017C43219
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67570C36AF5; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F7DCC36AED;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679214;
	bh=iTV9sFDDoTtUdRYRJze+nG3xvYoHt9LFUfi2tvZAZYk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dUWk/JW0LeLziJwJ3r58nySbHm35F7SgdoQvBNAXxdcHOdrBJ5KUdhkoMal1VlOtD
	 7GhobIfH9lOzuoQ369Naqmcrmaq2F68tKcxJ0Szv6cg3iZHpTl3plNSl8YO6DWFArB
	 exgbCIWSqyxdODa33pAsvve9FPATyD3o/PAyQ/lyfdJJI73F0rkODRVz2R2ZAnwEJp
	 Ey8CgADl0MI89zeXkbBd6llU7+dinsziFPdeCYh/ZuR1AcjTLQNFlpBHnFNX4/aA9m
	 tDxT/Pd8mpspjWORxMU1yG+s4n/2LYTsat8nvaSygfyaCqttnK+6fuFpR/l6dORnKe
	 pehrwJuQ9Kv5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 385C7F7940C;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921422.24856.9837607866688262039.git-patchwork-notify@kernel.org>
Date: Sat, 08 Jan 2022 22:00:14 +0000
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Mon, 27 Dec 2021 12:29:59 +0100 you wrote:
> Hi,
> 
> Second pull with DTS for ARM64, on top of previous pull.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: samsung: Second pull for v5.17
    https://git.kernel.org/soc/soc/c/c79295d7ee1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


