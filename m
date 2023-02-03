Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CBAC64EC5
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CA44C43446; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 167EDC433B4;
	Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434645;
	bh=W/iJTISAY/vpLWZ9Pkbv+WflzvPEfwIC29N0SCkDjao=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=g7OyYttJbN1p34byyD3t97uyCcyKuIvLU8duCH5TugXCB+udH1wkWNyqm8BpKj3M8
	 OrBLPf5QKZE9elJsF1dIDjtmmSsJdpiru/VtMbDhTDKCGpgZERznxg721hIbvd2KMP
	 66iOuieamZEWI0Zc32dLRn2BxiubJryWSbloh1q0SLWo3lHwmByJFhfozHgQnKQnln
	 yLgFoNyMxLVo0u7Paiw0ogJRGBZdjGfLGkyiCOjS+wC3fYt3Goorn/iUVxavRjB2z2
	 vBc0Glaw9Ncgmhdzp1erbQJG8Z6WrpNCpsD3fQCwMhtecY3jTf3WzezB32Rgzl54vx
	 j2008a2UGKHcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EECB5E4448D;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.3 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464496.16250.13718236844342791198.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <3e815504-e85e-cbd3-6e6d-4e5a7aa7469a@foss.st.com>
In-Reply-To: <3e815504-e85e-cbd3-6e6d-4e5a7aa7469a@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 2 Feb 2023 13:57:22 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this (late) first round of STM32 DT for v6.3 cycle. Main
> changes concern peripheral support on STM32MP13 and yaml fixes.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.3 #1
    https://git.kernel.org/soc/soc/c/34b84ce9c699

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


