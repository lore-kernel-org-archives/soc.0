Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA33C54E59
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8562C433B2; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D31BFC43394;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693829;
	bh=u3UZU0tcFNTNfF8bCxoR/+ogyrRuG/dxYTF61skSatw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cOMtdwPWMzkxovr5f8Xrjq9igFk3HFsg+Sq0ajvPBXwLGqpbg+PP+QLzC0UhcS43e
	 16ZQwRQOsULb2mZYgca8aZfl0Op55G/K+5kbpXYtag49Tq6aDE9OABQaiAki60OUup
	 JDzCQhRBxA6edYm/eR5ubY8HdX9Xslnf78o+5sbWSyauLxBxeFyr9OJOsBgL6id9EU
	 4mmqZN1q+CkVsMg5Pdde6o0VsDqGz9PmTBVuIHsTZZ/ua+61EeehPVGahmPKa7b7Hz
	 XLvd9kq/UzRKCkLSsENhf2k629K12rsdRpKtCDl/8YkGi5r3n3kGOgs1d1VYgVT1uT
	 bCiCGh9wWU3kA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C056DD84BBF;
	Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Cache driver fixes for v6.8-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382978.28623.589270618826609855.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 13:10:29 +0000
References: <20240221-keenness-handheld-b930aaa77708@spud>
In-Reply-To: <20240221-keenness-handheld-b930aaa77708@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 16:27:33 +0000 you wrote:
> Hey Arnd,
> 
> First of a few small PRs - I'd send these as patchsets but my flow for
> sending a PR is easier. I guess that says something about how poor my
> patch sending flow is...
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Cache driver fixes for v6.8-rc6
    https://git.kernel.org/soc/soc/c/bcb323bd10a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


