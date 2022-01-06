Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C310CC4332F
	for <soc@archiver.kernel.org>; Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC64CC36AF6; Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96247C36AE3;
	Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641498038;
	bh=VwXVzG3h++MosKtdMgEKMoTi0lxEZofPUXyDbokAMKc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OXy1ZdbRT6iw9R1wGYSGtpNKlhqk/MA+btbMNNLo3Ee5HipZbIgwF9uyLY+cQsnDo
	 pIDQKAemvsCgufVGTNd1Hzm2f3npRCEjfsNJdbkX/qfYZEe7tCiOsdXmycUeB9kZjS
	 5NNUz7sfUZSo9SjtIi6gQaU4AySB5L8zoBSfMAKvQd6d/Nz//BJVoTuXCvDCmWUr59
	 9hfCJ2cV2MkBl56VSwlggpM2re9bmEpuFdoBsGwzHh1taspCAVrToujU7IhS+JtOp1
	 TmjoQA345OTGw0qJ8oK8tMKhlf6LQNkNPAWpV7canDVXEFSIafheABjcMipS3eZqkV
	 WdKv65ScJ6tjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 846F9F7940B;
	Thu,  6 Jan 2022 19:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.16, part 4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164149803853.26637.2360883964414357995.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jan 2022 19:40:38 +0000
References: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
In-Reply-To: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 23 Dec 2021 12:30:53 +0100 you wrote:
> The following changes since commit 2585cf9dfaaddf00b069673f27bb3f8530e2039c:
> 
>   Linux 5.16-rc5 (2021-12-12 14:53:01 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-fixes-5.16-4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.16, part 4
    https://git.kernel.org/soc/soc/c/c8cc50a98e4f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


