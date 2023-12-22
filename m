Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954E7C4706F
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51701C433AB; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3942AC43397;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=K2meV4V3KAp4GGTEuPIlWgkg7+fCBdtvaWUj9vDyON4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gFjtWIhdYbw0w1JmoQvFyph+KVeS/gxQ/9BOM9aQssBuYA8yH55STF08RSRQvoTUM
	 GVXfU8i19UFtL35WPB9cCtIZLNZcutxjsBjYRgCqho4fJ/Si2GpmaswkPwAFQF9w7v
	 2w7wRj0LkgJdfR4tjsuFC1HsEsBeP9oGzqkovD2WiV1hgvZrlWhWEda45vdEgUsoIF
	 hoYI8C+cNRHUTGkWVyeCULBTKPQunnRjSQVKf2RpKDMvqbcxmDVurve9B1H7aKh033
	 YBddw/XumURGdZ3yMmYZ0RpReJhkWzlmE3kNeKEPCxr+JtFv+nOXfjHV/Oq27gFfld
	 8wViHwBXQp2VA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C603DD4EE2;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.8, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646711.10550.13707033175767238667.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231221101956.16351-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231221101956.16351-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Dec 2023 11:19:56 +0100 you wrote:
> Hi,
> 
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.8, part two
    https://git.kernel.org/soc/soc/c/6fe341a24b9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


