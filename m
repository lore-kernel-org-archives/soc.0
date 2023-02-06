Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509E4C61DA4
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2041DC433EF; Mon,  6 Feb 2023 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06F3EC4339C;
	Mon,  6 Feb 2023 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675682418;
	bh=b0tCeBw2QEZZ/42hFF7mymfES2KNrp3etTqOIE5oTG4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OpdnnH9ruI8M0AqOaTUXnAt624/Hc+WqKoqenNP7YfkJvhFv0+cMYZX0yFXhHG4vg
	 eFc73FK+KBmkAtpcTKtwY7LP/SKIL2x7bFnh0xzAoBq5ocDIGjKS7CUIF6lmwcEhvt
	 dZhiKr56SDOb40BYEGFg7+j1BiZZKCSzRdI9QLMNZzyYOqqlSE7n2atLPjnINpesZ3
	 5nWvlKvcDgKXnIyiWFIqQ+Q9Y+QZhIrA87sYOVGhjnPVUJjZBbQEbC77K4N/71Hpiz
	 nF5UQ2SI+ppTWYqKOa4IkSK6xsPCrthbAomyPCPj0m9uuKzRlqA9jJCT7UUMUhatRt
	 EHqOM4Kx0sNlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6CBDE55EFC;
	Mon,  6 Feb 2023 11:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC RTKit/PMGR updates for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167568241787.3898.13169803300147363128.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 11:20:17 +0000
References: <4790bdc4-b6e2-228b-771f-023363f65fb3@marcan.st>
In-Reply-To: <4790bdc4-b6e2-228b-771f-023363f65fb3@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 4 Feb 2023 19:08:07 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these driver changes for 6.3.
> 
> This batch comes with mostly RTKit changes adding APIs and features
> needed for upcoming drivers, plus a PMGR change that also unblocks some
> upcoming changes.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC RTKit/PMGR updates for 6.3
    https://git.kernel.org/soc/soc/c/7d47f6ffa572

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


