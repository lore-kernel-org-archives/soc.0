Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B7DC10F1B
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE0C5C433F2; Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 984BCC433F1;
	Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465642;
	bh=w/AhZ8IHle5GET6QMTmC0cAhdiL18uZEj8fNII9zkO8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QzS6PkdkhT8LYPEvfS4flwhXQEGNjV8wCYb2xr2gse7AX/l9/UT7qJfQIRSuOyu5P
	 suxq1L109t8EJ5fzfog90mDQFpfjGyD74zCLiNdOBXxu875Xfz7s1i0Qgj78lxhEHe
	 KWGNIY912a86I+gKDFhcHYc46JO/dY2f4M1std/ErYip4rrH1BZYuwuNKGUkSYwcF/
	 9zPe/M+rbA4JlSmE/AtXssWHO1E9D8sBSriYv44B7ZSAFCHUg8UqUVx/shy3z/Jkjc
	 HIdpEU4UzcJjfpsOI/L4vICjcFVQ7RTsdViRHUJ0mAPslVpfR6cMSh39REaV7ELiQm
	 SShhikVobVzuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86EE4E21EEE;
	Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: mediatek: fixes for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146564254.24111.17830756198151339411.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:42 +0000
References: <29c8b913-53cf-096f-fe44-832ceaeac116@suse.com>
In-Reply-To: <29c8b913-53cf-096f-fe44-832ceaeac116@suse.com>
To: Matthias Brugger <mbrugger@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Dec 2022 12:09:03 +0100 you wrote:
> Hi Arnd and Olof,
> 
> Please have a look at the following fix for v6.1
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: mediatek: fixes for v6.1
    https://git.kernel.org/soc/soc/c/6f85602d5fde

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


