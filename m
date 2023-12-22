Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CAEC47DB1
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCF47C116D5; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6988C4936D;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=q0wf00nLGlmYr2l2QiS6dav1AjYW1vMo1mNDE1vP0Sk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AP0jVy7N93zD8ETgvdlyTIi3yuwJR6rFYgFEOP6SfPHyE5QE74UZXZnIAflD3/Xxm
	 IWw39j5vf5oTKociM53J1r+9dBT/X2N7miS8a6ChzPPA4vV+A39OS1MmD8D2MwLc5z
	 Yto2aybZzqo8SSb0LD1RKH8cxZnM7gCkpCEv5x3bRzrsVUL4gs3MSaexGcIno0EQEN
	 1cFmYFNeKXnnxYHlGKgmWdhv8riThjfEiAFXpvJvj524q+YJKwdXIrEeQqrbgpk417
	 R+rsnJXZ5K7amE33QSaKMUEuJEda3qt9Ldr0SGnpLiiyY9j6z9XvbNbDCydF22KFVp
	 Y8rrYouPRn0iQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A3B12DD4EE2;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Improved TEE shared buffer support for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646766.10550.8349752162318075080.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231214134139.GA3098718@rayden>
In-Reply-To: <20231214134139.GA3098718@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Dec 2023 14:41:39 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this patch to add vmalloc support for shared buffer
> registration with the secure world.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Improved TEE shared buffer support for v6.8
    https://git.kernel.org/soc/soc/c/db0a7c09b2a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


