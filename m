Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F571C87FE7
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C465C4331D; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06030C43444;
	Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316228;
	bh=c0+zsNRb4OOrbcbxnTz+4IDVOLZgAiJ6gP8ztNQkZpY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VodtUg1yWQs84W5sXt1SgmTsg2f37FmQiLU5mTttEuvaM6qrOZrE/DagNxrzEOQWj
	 cYuSbFqbSUKOqLjKhOkQsL8tSD/pRMb7YmcDp8pe7g/kn5Z3VzR9fOxFnkFtGEq1iT
	 RXe/zMUxJC7ZeVzpP7amKJb3+r+D4L//B9BaMOG1nkDmXOIxrDE0HiF9m/SFgFvCQJ
	 SROVhO9zkiiaNnz1oai+V7OUzN1Q/ESW0RCb8QtSSh4z7doc1y7BvbHTnSLU8KxXzX
	 WuzwMfI2KwX+NYYNHDmyWyz0EtTwQYF0qDkDaV4gHELUwDuuxD7T+JSdjiYAwQW76m
	 NDFzvQ9fORF0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E4CE2E29F37;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Non-urgent driver fix for ti-sysc for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622793.816.5151886318252526982.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <pull-1685700720-242492@atomide.com>
In-Reply-To: <pull-1685700720-242492@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  2 Jun 2023 13:13:05 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Non-urgent driver fix for ti-sysc for v6.5
    https://git.kernel.org/soc/soc/c/24138ec0a39a
  - [GIT,PULL,2/3] Clean-up for omap pinctrl-single nodes for v6.5
    https://git.kernel.org/soc/soc/c/739c4c317e20
  - [GIT,PULL,3/3] Devicetree changes for omaps for v6.5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


