Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07039C49EC8
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 683E9613E8; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4EA82613DF;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=hKHbg1ixglqr2Utj7Iq6V5peYG6rT8Wn9QPYcFbfad4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OIMej4k21h96PeZUCc4clK7y9PhRXe9hRdC+AT9VFv7CPFOi+vtRqoVZ+A8O6dRHc
	 cU6G3fbBNksZhJgzjEoGcfCHunZ3QWmvyYQGM0Ac9MlPhihWKnHrCjQjaWmTqzBXCB
	 QWJcr7h9O0wn09DclvQ48VZ5fFncOmM94uNrtajXuKN5fJ4Au6eAEgoOVTCTU60zdq
	 nn/Zrzo3umdKirTkXLN9RfjDV4bp16NL72GWJgw8vT5AOzKmHmyEMtyonrMQh7HyVw
	 kWt7+6FYsumukf5zw7QzyYHkGNasR6JvLQ3QoHPragtpBVHLZeT4JGfgA72sxi/0gz
	 3ZyQlFD9s0ujw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 41604609B1;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] IXP4xx modernizations for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241126.24025.3132734093518682766.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <CACRpkdbw6HSpp7k6q1FYGmtafLmdAu8bFnpHQOdfBDYYsdLbkw@mail.gmail.com>
In-Reply-To: <CACRpkdbw6HSpp7k6q1FYGmtafLmdAu8bFnpHQOdfBDYYsdLbkw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 18 Jun 2021 10:50:31 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> here is a constructive pull request for modernizing IXP4xx.
> 
> As modernizing architectures go, it's cutting some corners
> and being a bit different from regular new architectures.
> The main details of the contents are in the signed tag, but
> note the following:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] IXP4xx modernizations for v5.14
    https://git.kernel.org/soc/soc/c/95ef71523663

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


