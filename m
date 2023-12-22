Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4934C4707B
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EBC8C4AF1E; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D4B8C4160E;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=UpgUQqDhYMFL/bAiQASqV3ZeIlKE/IDX19WwILkji9U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qjAIUm+OjShYXzAQFoAygiOwRKrdSsggduuOW+WK5daUtWDpicI9QCnjYohxkQHOO
	 MnIIupwoEfG2OD4KdNFXfHQVOHKRgqPYLh13+Anu9DZSwD2C+DyCyG0BtG8SYIG8Y5
	 cQnP55JUz5en3hm8dXy1LXvS+4O4dEE4UxqMkBpzWAOoQ9dzq7sUxx7+nDo8TsC6tV
	 137jVlCtB8Qygkf5RxRdjmOjtTwtHkNZgEuOxY1MleVuDjqNWOt5mY6xIBrLMW3TNA
	 9LTZi0W6HIlGF0dmb0HG5UuyRN7mWREiFpnM/nPiqcQdZxQOBmLy04ne+8ijTve5Qx
	 dYQiF3bsZKWEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CD8ADD4EFC;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V cache drivers for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646737.10550.15780932455987944075.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231221-catatonic-monday-d4c61283b136@spud>
In-Reply-To: <20231221-catatonic-monday-d4c61283b136@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Dec 2023 12:57:53 +0000 you wrote:
> Hey Arnd,
> 
> Please pull the move of the ccache driver out of drivers/soc and the
> addition of support for the non-standard non-coherent cache operations
> on the jh7100. Despite it being an early(ish) SoC and being succeeded by
> the jh7110, there's still people actively adding mainline support for
> some of the peripherals etc.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V cache drivers for v6.8
    https://git.kernel.org/soc/soc/c/41ab5e162569

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


