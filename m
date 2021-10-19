Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5614EC433F5
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 19:20:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 370C26135F; Tue, 19 Oct 2021 19:20:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1ED986137F;
	Tue, 19 Oct 2021 19:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634671232;
	bh=QPO3fkPCHFbhc/ak/u6dw3lTAdZgiugdKUJ4XJ95cEU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kXNs+Sq8H4DAAj+wrP4VpUx4RMVXK8/mbyMAH7MwIayaNG3oGvWZ3SeT8LDkSSkYS
	 ErzdN8rNsARQcbSFpD5dqry6BKhNQZxVjMgAO/CL3bQ4E3vkW7y1cT/In9OcX/cpdb
	 ZBJmadFfJSNjmqj1MtqYkdxnQh4lO1+r67nVbAwHeDSln1mo8fHwxDglmpgyBX86jy
	 po1ukOyDm8ZyKeCxQgro6UHZ/xw0X1q4JktOt1k+l8K12UOGq4gEe8hW7zkvxqNof+
	 JWJ/QnznSe9p6yHQrdjhtEvuZ2kgqBf7sX0wQG9fUxTNRKU1Otjye+DT+iuEtWd9bu
	 UAZll/p5bvoHQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 115AF609F7;
	Tue, 19 Oct 2021 19:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.15, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163467123206.14172.14660630950082559810.git-patchwork-notify@kernel.org>
Date: Tue, 19 Oct 2021 19:20:32 +0000
References: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
In-Reply-To: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 15 Oct 2021 22:48:54 +0200 you wrote:
> The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:
> 
>   Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-soc-fixes-5.15-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.15, part 2
    https://git.kernel.org/soc/soc/c/f04298169d9c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


