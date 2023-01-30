Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B8C636D7
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7CA8C433A1; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0994C433AA;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=NoOJ9bIWnWLftuAoipGdYddDwoCygtcmxxttv41Xf4c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jtJKbYSmrEsURuMfNuLP3af5piDMgv4WfNTjROEAZ3RXjkJnaf8HG7OZ0A1zCNEwT
	 74vnVFqAio5eEPk37zkvIr16Zzt636C1zDqCT5DFZev6XOR1AtQYymb9kim56rZdMz
	 pqfZLbwtk0sYpqM52XyZl0yd3wzlGBi12aMrCBaP/mfpCgcdLWUVuD9lRqOjz/H2G0
	 r6ci8WwCmPCKu3WoyirDz0EI2hrqbey8/c7D3Ww9njxe3Sl1hJVreHXzOkilUFYtql
	 0Cdk2QpVBG7Sh2n42AcLhypV/AQt2pKH1UK7VC/XOtTvVUZtzP6XKv5uJeSjSajcuR
	 6nQemg6VzshvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 944D9E5255F;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC drivers for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786060.29049.10393466080572590252.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <Y9LNIm9pkr+Owv/e@spud>
In-Reply-To: <Y9LNIm9pkr+Owv/e@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 26 Jan 2023 18:57:38 +0000 you wrote:
> Hey Arnd,
> 
> I'm sending this one perhaps earlier than needed given there's going
> to be -rc8 this time around, just in case something about the PMU
> driver isn't to your liking. It'd be nice if there was a subsystem for
> these power management units as I wasn't sure if the API usage was
> correct. Heiko, who has experience from the rockchip driver, reviewed
> it, so I am happy with that.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC drivers for v6.3
    https://git.kernel.org/soc/soc/c/75dae633c9c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


