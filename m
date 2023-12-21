Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE86CC47DB0
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77C4AC116B4; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61BE6C4167E;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=W2AvnvJTMMNA3wXBOB9TivWrz9tDP9CRuRPY9l/7sYo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Me1LvxjAqFNT5ZrH2btdBdICqUL3lCYdovfr4mBywHnna5sJnTrvjqs6bHSBkWi6x
	 2VSNIsougMp3UBoGWfgUuFAP8hzfAdChZiV69Mf8iqGhNTyzylsBBDjVlmgCdEu+h3
	 58plX3ogk+QBLx8wgNqZAGLJpXDOw4igjPSKDZvyupgKXoi7CIdCcqgzZC2PMtoeZc
	 WgrKhzSJTZbuQAfTT1TA9qlToMltkURKJZCX/pUpB8agJGo5uWcv4xlyRAWw/ODa+c
	 OOIl64yDHxfYud6n+LcjpV48q82160ehCGxbY9Z8ToOk7TGa5rHU8sjGg7RxtHx1oj
	 +03xWqIKNEsHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4E78AD8C98B;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046631.3302.8969189156145980848.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231221-skimmed-boxy-b78aed8afdc4@spud>
In-Reply-To: <20231221-skimmed-boxy-b78aed8afdc4@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Dec 2023 13:24:30 +0000 you wrote:
> Hey Arnd,
> 
> Please pull dt changes for RISC-V. I've got the T-Head SoCs here as
> Jisheng has been busy IRL this cycle and not had the time to set up
> branches etc yet.
> 
> Happy Christmas and all that jazz,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.8
    https://git.kernel.org/soc/soc/c/dd937663963e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


