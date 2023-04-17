Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D0EC77B7C
	for <soc@archiver.kernel.org>; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84763C433A1; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EF0AC433EF;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681746620;
	bh=Pkpign0L9MIChn5HzHcF+Zvxvg+CLvVZ7uxv2wA/geA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LI5XFb1fR9HmjIvZhs8ky7Z2t0B7Xci1sYNGdEaxqeNYF5fqjv1IPanvrkUfgo1x0
	 q10GaSU6NI5XScv8NcaH57jjCV2Z+eCAEJvUnMUlE7MGdiz7oWc5wQwTOjqTR01eCe
	 FJZ92KuplK0yhRsf6rTUCPbA1IjWumyVTcFpdnXZom8vA+C6DeIjFdVSDMpUeg6J/C
	 OrwF8BGJ4mCW4BW6PuVu3jEDjM/ZVDqaoXea6jVjOZbQWBw+MksIJRK0sacdvpez1G
	 ClVAK2I4TGbXunWWFTsE8CqDDLT0R9T/pURaUw5HjvoGylJfX3d0ypO04ZSnTUR3rO
	 /U1o+hn9qRieg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47A00E330A0;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 6.4 (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168174662028.17676.1307974065439592100.git-patchwork-notify@kernel.org>
Date: Mon, 17 Apr 2023 15:50:20 +0000
References: <d0862463-acb3-ce83-6493-281a833ec87e@marcan.st>
In-Reply-To: <d0862463-acb3-ce83-6493-281a833ec87e@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Apr 2023 18:26:35 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these DT changes for 6.4.
> 
> A bit late this cycle, this adds the PWM controllers and keyboard
> backlight nodes. That driver is also on the way to 6.4.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 6.4 (v2)
    https://git.kernel.org/soc/soc/c/9476d415f7c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


