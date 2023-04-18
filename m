Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1F3C77B7D
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFF2FC433AC; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95864C433A4;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681831220;
	bh=F3gm/7PilOLhwmsX1cTAXZULL+GGq0qm7BSN48+rUVs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mp1IxW1o8mPdYHOK+sX29hGOncrqYHVEJAmY2+lDln2zuq+dfwj2lmKXfp43yyoWJ
	 UfG7loUa2WoWSzSFkHApHrT9jdOSVnQb9sTMpHtMz9iuY/NaariE6H7+CEeXlWN/8d
	 9vyn58UU6BP/JAde3O/4Ad/aF/96jOorCr0iUqHuCdJ0tWRExHErtjUo2HFFfjk5/s
	 W88eWUvHVRCs7i6X4fjncMFa/j/pscztlza9mYcC+8NSaALOcyU0oKyniUqJV8IOLw
	 47+cj24xVLiUEWy2+NnkjJHgpJqoM2MrJwzOiYMNf9U7MeQsehls3RLixxYhvjrBkG
	 oBaw61X6c0NaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6478CE270E6;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.4 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168183122040.6966.18348118294525921651.git-patchwork-notify@kernel.org>
Date: Tue, 18 Apr 2023 15:20:20 +0000
References: <87bkjlzfcw.fsf@BL-laptop>
In-Reply-To: <87bkjlzfcw.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Apr 2023 11:53:03 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.4.
> 
> Gregory
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.4 (#1)
    https://git.kernel.org/soc/soc/c/b8a4346d2502

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


