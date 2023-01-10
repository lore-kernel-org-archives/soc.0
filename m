Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C500BC678D8
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BACAC4339C; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 563F0C433F2;
	Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390532;
	bh=6uuFn0NwCafZalIFheYF7LIvUNamfpKn3RGBhJbYkAg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CYFFcRAp8OaeTSsatmZ455lJ0K9O6fvyaRUGRPjIFLFzaXFuNyqcQ2M4ALYjWRbbD
	 TwHrNcXkh7iOJrxZ/9Rqn2LmfCsLVWnGBd7BIyTHIaQPQeVKJAm8DKZFL3KQI25XRe
	 Ol7R9eJicqStyAxceRrivO5xlKOUf7mV+yWcCVA09Nr846nireMv8pu0BtL74WPGIW
	 sAh+fmyzhFmvtY2JwcZLFmfW0zD5YmgC9WYswOnlILabbiBcYYiyWxwj5NyNb63cWM
	 2vaKGTg6EySrjArQJll2+QadcarLECcTC63v4AqfeUpiU7zsq+/6AkQFa+pmN/3Rud
	 1Q28IJpu5v1gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44B07E524F1;
	Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom drivers fixes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167339053227.5083.7714293666420123169.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jan 2023 22:42:12 +0000
References: <20230110215025.1008437-1-f.fainelli@gmail.com>
In-Reply-To: <20230110215025.1008437-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Jan 2023 13:50:25 -0800 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.2/drivers-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom drivers fixes for 6.2
    https://git.kernel.org/soc/soc/c/45c734817847

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


