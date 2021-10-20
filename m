Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCD3C43217
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D08D66138D; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B8F8F61373;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634737813;
	bh=laloZUJoFkN0URe6ruqdS45Y+DN8Xjez+03MIqYlg3M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YYNOjve8czAOkRmK74w3bWLe4HAlO0KDvXezmMyuY/9S9Ds6DE27755x512OHfahg
	 ysF1J/TCNXWJQq/OdT/T1Nd4B5ghCB6mbPpYTKHXY7Tz8t/9lOjQRAEVqypPHjPoZn
	 JyjpXM9gFXJeTB8JLk9uVOJqhmWhD/s/jqzlBXMvvzgVDKyJky4vDh2QZB7hm1C72I
	 uL9LexHs3nEzxQ5sOvpNccy513+hD8r7Om5jkGdtuLTsF825yiiJklwDGDPwRUO1sU
	 uqspLSaoh8Goc4BmuSO15vA0Y0TuKMsVVV5XxiboRoC6rFDKzmdpar9YVjXI+N9E3I
	 feu6Wgy/NKAGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AE914609F7;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Gemini DTS changes for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163473781371.13902.2752092944646475032.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 13:50:13 +0000
References: <CACRpkdac5Sbt42CtuLMgCazfHdhcP98mEKGjeZ-DVcb=_N90Bg@mail.gmail.com>
In-Reply-To: <CACRpkdac5Sbt42CtuLMgCazfHdhcP98mEKGjeZ-DVcb=_N90Bg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Oct 2021 02:50:14 +0200 you wrote:
> Hi SoC maintainers,
> 
> these are some DTS changes for the Gemini platform for
> v5.16.
> 
> Sorry for being late. Details in the signed tag.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Gemini DTS changes for v5.16
    https://git.kernel.org/soc/soc/c/7b27dc2769ba

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


