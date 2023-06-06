Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5DAC83003
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1C77C433A8; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9404C433A0;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686084024;
	bh=Sdh2YKuPAPl4HHjbakjVZ9KNgAIAZ0TckzR6ACxmFWg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=podKk6K0ZBuZoOiiTXtQQNXLT+wpmZhfljFiMXR4mDC47IkMJhIIIEAtIIn4klymy
	 /PB2wqnRQ2xcdmIgAD9RD9ZguuRht6XEYz8zCQzJr/xlXsuBsOBnCqd/e8vUsSRU8E
	 5eIin1TUGk5K56Ycg1XI+BgsxGuvXitYlZe/+SCak43tp0ghGIszwXr7ti3Zv9G1oJ
	 3a1zQWyfcAw0lRMhJjSfadpeXJ2zIEYE62hX08N76uMnT2K83zw033KWyrF60s+sMj
	 SIKIC3E34IRJbcNy08XRJqa8zjS1CH2TUjKLPrdJhoRWrVITZPHK0v2D57dRJ38Ov/
	 qXP3idzestj2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 824C2E8722F;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS changes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168608402452.20407.10588241589788713549.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jun 2023 20:40:24 +0000
References: <CACRpkdZ2YLzB-n+1M9u0UqVfct_LAR5cLvYyJhxHsXNR_TFzpQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ2YLzB-n+1M9u0UqVfct_LAR5cLvYyJhxHsXNR_TFzpQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 May 2023 13:49:32 +0200 you wrote:
> Hi SoC folks,
> 
> these are some Ux500 DTS updates for the v6.5 kernel cycle.
> 
> Details in the signed tag!
> 
> Please pull it in.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS changes for v6.5
    https://git.kernel.org/soc/soc/c/35ee6a4deb82

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


