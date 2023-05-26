Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520B2C7EE32
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2448CC433AE; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E190C433A7;
	Fri, 26 May 2023 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685101828;
	bh=ULmYpNlX3/DiQLwW/pyKkHA5DpiRLtRblJTMt/fDt+Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OGzJHrg8tgsZAgzeWjd2xD4Q1Vw8z9S+nVueiRheipAyi8wqVVdcaO8IsLDMvdFf/
	 klwHN+njq4PuT5l3t0uTtn+5GPMtpYPPFD+7ANpStiKGof44o0OaqE8B+vSQYrWHCO
	 Cs+l0LDsf5dh/FSaT1e3s9/7yEKBvNzm58tCaHbIhad0HagggWhD6CiLPh+c2mQfCM
	 WU9xp77VbR5EEXS3ul72B18MlTcN73mPU7ZoiewVQI5kPkbRcKy04/ic5929gzqUxr
	 H5gty/DII0IhMraDKf8ACaIZAk5G36bkYWzr0P5r/1kHW0LnjkzMMQLmsvRd+V0KbS
	 O4G2TZUSA/DPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DBAABE4F139;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OMAP GPIO numbers cleanup
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168510182788.28560.12908030019424974256.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 11:50:27 +0000
References: <CACRpkdbtE9yfx9kZqGwsHim91WsxHERecrGwjnr6TQpCUMsQwg@mail.gmail.com>
In-Reply-To: <CACRpkdbtE9yfx9kZqGwsHim91WsxHERecrGwjnr6TQpCUMsQwg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 24 May 2023 15:07:03 +0200 you wrote:
> Hi SoC maintainers,
> 
> please pull in this cleanup of the OMAP board files removing all
> usage of the global GPIO numberspace.
> 
> It's reasonably reviewed and tested, any remaining issues can
> be smoked out in-tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OMAP GPIO numbers cleanup
    https://git.kernel.org/soc/soc/c/5fa035bb7156

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


