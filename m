Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16DBC77B73
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B7E7C4339B; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DBCAC433EF;
	Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681505423;
	bh=ZRqPAYv8fsR7D60G6PeqH01AKqxKwLKTjLrInSvXMiE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ggCFp9xLYS1Ixpw2qVxAJJT3QwHrPfTeKlkPG4DwKV8ZxU4x5AP2BZansyilDNH4l
	 lXqsonxZ1iPYMuR+54ys3uee/Dxc0pf1Z6gIWx21gR5pyIu8jTa4Z91KlS2icYRWBX
	 UsNSauLEX1itNEw8gVxiEuIJ8aMg5eFsYW5og0oG/HMqb7PYQUcgyGVgWrlnwFoS91
	 4KskBS27f4RPKMIkP9J4RNDtri5kMCVYtLao+5z1el3YM7JCTWlz6cPsAZCL5DQGZ8
	 zaDqd56Y1y15kplF1eF6Rn1YlWQqVL49Zv0/6qve46u7RU1gdzbkIj7TZ+wRhwiBSH
	 ftDwBlyNkmkGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3E9E4E21EDE;
	Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek ARM32 DTS updates for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168150542325.1155.2447724466724606978.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 20:50:23 +0000
References: <c3b17357-e08d-da7e-def0-a7f9e0b95cb7@gmail.com>
In-Reply-To: <c3b17357-e08d-da7e-def0-a7f9e0b95cb7@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Apr 2023 18:51:12 +0200 you wrote:
> Hi Arnd and Olof,
> 
> Please have a look on the few changes to the 32 bit DT files.
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek ARM32 DTS updates for 6.4
    https://git.kernel.org/soc/soc/c/7e8298565d83

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


