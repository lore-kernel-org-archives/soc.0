Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D9CDB487
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30916C4339A; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A358C433B6;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=xAFGyb/nCT/ioqcgJ/ZpBPu+cKX5RLVQRzGJ/sTgvno=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KE2bQyIK3qxle9n+05S75mFhr66Ao1Y0/qwC3w4pXEpQKtOGIZAmCWa72mRRtBy+H
	 bcwZ3SsaXqHi0PYG6gEC7wnbKaT91yEpnxknVjoa1W6NN9ylqfeEz0w8BoAxhO8xkU
	 6Vj1gfFRwtEN0pLwzmzzWQAht8suDjbaucc3COjfS6YE5iullAEurD6keFJeY8g9gv
	 eTUjCXcb+00xy4RsFiFQKSeBv42RU6auQuQR/NQdrnJILWadYKuAnI0xr6ZjwE1AhU
	 mQcuw3JrzXf4tOiBoIl53ptZBOKQz5l9XsW2V3//QmSyskgQtA1BqPKc76Rq2SZkd+
	 ktTfebq35cGLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0397EC59A4C;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: vexpress: Update for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191801.22284.14686090588848606633.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:58 +0000
References: <20231010124339.1620012-1-sudeep.holla@arm.com>
In-Reply-To: <20231010124339.1620012-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Oct 2023 13:43:39 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: vexpress: Update for v6.7
    https://git.kernel.org/soc/soc/c/765e4aa6be02

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


