Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420D3C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 15:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C39CC385AC; Thu, 21 Apr 2022 15:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1674FC385A8;
	Thu, 21 Apr 2022 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650555063;
	bh=jileo7uqKyeuBIQTPEWLnhDQJtm0Kgwn0OTFeKtn9Uc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=umPg6vXjvqeYh4gyRZB3UDiZOjE74YLiKPSURFd86LtxD6Yx0NPmIDgNP3vKK00eE
	 qwjQATII0g+OV6eJb0FK/EYk5sl5YAOFt6TwEddiuSOVif9eIltx3R7NCCQRX+lWub
	 FSXzsxedusiOT+KB8rvf1PyDVUc2EQPHbaIzfHkKeY7RdRQnG0xlchcgOlJ0f496LJ
	 My+r5qGL9xXOTp+4AIdl+J+p4z/tZQXgWYA5lsXRO5Sqc3K9l3ERkggPBpiaMCrUKC
	 ZiErd4NiPFNPQuIqgRqum3JaC6IzMZd8PHoTe8EZU5PTJdptIQVkQlVFhtWXq6RVOG
	 iPHhYPKXlbZrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01C43E85D90;
	Thu, 21 Apr 2022 15:31:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.18, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165055506300.23603.15442292390284963060.git-patchwork-notify@kernel.org>
Date: Thu, 21 Apr 2022 15:31:03 +0000
References: <CAK8P3a1ZGJJCrEzg_68XJmPA_Ajk0TmfayBn2Li2J8Zau0hPNg@mail.gmail.com>
In-Reply-To: <CAK8P3a1ZGJJCrEzg_68XJmPA_Ajk0TmfayBn2Li2J8Zau0hPNg@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sat, 16 Apr 2022 23:36:32 +0200 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/soc-fixes-5.18-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.18, part 2
    https://git.kernel.org/soc/soc/c/70a0cec8186b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


