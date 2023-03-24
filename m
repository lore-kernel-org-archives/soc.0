Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB7FC76196
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85854C433AE; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 702C4C433B0;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679680822;
	bh=S/t2bxpEZ2WDN4YtvuuASYEa/Aq8zYH68nIiwFoEngA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=i+Btr34Ww5qPb1+8dV1BTmkQeiQpTwiW8kxW3Zuftg8gfYomxTBOA4qytuykxyofw
	 j2CbmI/Sp/cEdqzX8LnNc5GwAWLygklf+Y44JFF3Lw54YR5y8kkGt5BcHQijLoQZ0w
	 q62sgygGYPj6ZcLK0mQ6zJMP455+NyuPL7x6Njr+uTvwzcZN/3EraIebbzJcPpPZsn
	 MEZcGxq0V/kVmb/ODL1L2eToPSmff8DlUvNKfcf2+cpxxdvvGDvft68SMk8HgsguV3
	 vLLqOSvJ+dAhBZX6DavqpeduvdkIvUiEmLD243SOnk5ZUVo7l4GQMheLYqjNWQkf4c
	 biAyNHJd0FV3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 39E38E55B3E;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: few cleanups for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167968082223.24696.17387410371919840253.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 18:00:22 +0000
References: <20230319152740.34551-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230319152740.34551-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 19 Mar 2023 16:27:39 +0100 you wrote:
> Hi Arnd and Olof,
> 
> Few cleanups where maintainers did not pick them up for some time, maybe
> expecting me to send or maybe because they missed these.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: few cleanups for v6.4
    https://git.kernel.org/soc/soc/c/7e11bc075999

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


