Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4504AC63703
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B527C433D6; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 041D8C4315A;
	Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042344;
	bh=6vTflppCfRhm66OVgtMD+Qfvq6LEknNUuNP0w4nuecw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GNm/pSMP+xCzj3p/86vi981Bx5Jxr/cRc5D6lTHLV6h1j7b7KbuolvLYgymc6whR7
	 8X4/Z8GeDKHfVcfEqr7GA+tj1lOXi4LIe8ULJ98sBtBT2TBS3D7eSskNYPnuRWX2Hv
	 Xr1EzvdYXK6K6CoUNrRrIvrWlkBowY8xQ0EPFvqLgS5gY/1YlfOSTCkWKgaszVba6j
	 4UmoFJYPBp8oEqUA2uGbsJQUiSyTC0d1LM+ggwBhCPq1ydSVmIM+Cm9f2XeydDwyAd
	 SNw6Xm6dZJ0NGdtYaQ0fdSgke9KDIIxlBcj33L7XwWDTMl/ZQD/u+i8RSylZWBqbUJ
	 IMoi7V4q2i25A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6AE2E29F40;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.2 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234394.4359.10907859131002454898.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <3235e5be-d89f-f76c-5e25-5d1210feb857@foss.st.com>
In-Reply-To: <3235e5be-d89f-f76c-5e25-5d1210feb857@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Nov 2022 11:36:46 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v6.2.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.2 #1
    https://git.kernel.org/soc/soc/c/27269ac4f68d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


