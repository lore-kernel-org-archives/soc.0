Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BBCC4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BDDD4610C9; Wed, 18 Aug 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A80D6610C7;
	Wed, 18 Aug 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629294613;
	bh=gg4n/k5z7UI43PG1K0ahNlnqwE7P+EDL7JqZK/hDezg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LQtWRrRdj7AFFN1E4myRANCfeGDmg+A3D5s0Kk5MxYAanoCBoRhwiitDcs+068Zzt
	 jMi12WkEj2fBPt3WNUIlts+3buZY+8biHm2jBvGgzLnZKXy8NifZoW9BAnc57Bb6vK
	 9BLc8GLqts0CMfuCaIEiyExILKQnHFWrN7yf1m9VnxpczKpwPeNPtqTeOa/uk0N9cC
	 hCYxNdJL4MqxZ3XyOP2h9gC2z2NOPJlJkcJm6uIP4SXVFFWfnQc58nCqOK2Hr0amTL
	 xD+Cz2qmIuIH9ZvJI/C19s4MIS6z9LUxwWd6R4qN7pMmb4XVqx+TP8/TXB9ioO0uyw
	 v2L6QE7Ls95/w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9E75B60A2E;
	Wed, 18 Aug 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Delete IXP4xx boardfiles replaced by device trees
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162929461364.9396.6814212374930212026.git-patchwork-notify@kernel.org>
Date: Wed, 18 Aug 2021 13:50:13 +0000
References: <CACRpkdY=sPDkzmbmm+0UQnJi7BXZKH14GLmyVwKC+4cLCJpmdA@mail.gmail.com>
In-Reply-To: <CACRpkdY=sPDkzmbmm+0UQnJi7BXZKH14GLmyVwKC+4cLCJpmdA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 13 Aug 2021 15:14:01 +0200 you wrote:
> Hi SoC folks,
> 
> this concludes the first big chunk of IXP4xx cleanup and DT conversion
> by deleting a majority of the boardfiles now supported by the device
> trees.
> 
> The details of which boardfiles are deleted and the two that are kept can
> be found below. The idea is that all devices except the Omicron ones
> will keep being supported, but as device trees. Omicron has publicly
> stated that they have no interest in keeping supporting the boards,
> if someone anyway steps up and need them, scratch device trees
> exist on the mailing list.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Delete IXP4xx boardfiles replaced by device trees
    https://git.kernel.org/soc/soc/c/0fbd7409446a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


