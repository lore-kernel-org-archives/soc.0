Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BA8C05027
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D725CC4339E; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDC03C4339B;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434644;
	bh=Df1VnfsbgYKEw0GiGqEf4aqqKqGuTIIFrZ93R8Y0Scw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cyLyNLT9/OmgVY0Z9tKvuto00rf34j1g9Y5wrwnKipR3YN2jFU3iGIcu/gvZ390MN
	 2rKKd+tTArfnNpJwcsGW+K+bBYE4Wc0VPRnXGMKUNv3lplbZjcdyNovsm1dG3la6aa
	 wr/nfWDca0KJHhJF4rF5Bebqx/bUVNZxYAAFle7tNLQatCvuGwlgIE3a+wrNNLq7As
	 ZXv58eJk67jhGbAVuTyZ+StW8Ff0zlYZqgh8ZZmeoB5lneV+uCHAlbmHOr6GjUFD5w
	 VbBN0Jidc9BE1KJ/L/vV+IRmPacoQa/4eyE1ZzDvYfhfKsNoEeS7uwjvWMwuisamOr
	 ZhEIa8s1R/f0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7F65E4448D;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: multi_v7: enable NVMEM driver for STM32
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464468.16250.14911284902132874638.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <20230202130040.25233-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20230202130040.25233-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 2 Feb 2023 14:00:40 +0100 you wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Enable the STMicroelectronics NVMEM drivers used on
> STM32 MPU, STM32MP15x and STM32MP13x, to access OTPs.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> [...]

Here is the summary with links:
  - ARM: configs: multi_v7: enable NVMEM driver for STM32
    https://git.kernel.org/soc/soc/c/f46bbb7f9eff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


