Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FA3C47255
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47E4AC433BF; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3063DC433A9;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=FhYdvcmZt6iPrs4jtfxpzQZmNzRYiZuq3A7Y7ZHpDHs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=K33yDUhqJuRv1f4bRVt16oMaSqQhYrfP7Tj4n8assMBk82j9k8epwh7KQfKRJdgsG
	 +n/A3qoXszMOjMLONTP5UOX1cq8biiQGqUC+Owm8W7jsTZeMfjBAlVy722+UcA/JLv
	 cNo4DaDNfjXMLqPeKW8BJnBro/0fqLkz+bpjGT+MjGMzqWiEQvZZG+7fzzRuo8yX8g
	 VCMxFyBtlal6UIt1eU0Xi55xMJvI2gJdr/J67Zc+AzXcW3+wTxdh2oxPYJ8VK6H2Vw
	 EKR16doWn06tZRe413g2ASpa/82h+FsgG/YKVBUA5wyqVfEt8C3SSyK8RNjcweQj8U
	 2TNlYyvVJIf6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D685DD4EE5;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046611.3302.5626951721503935626.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <ZXtWFk-Bne835txP@archlinux>
In-Reply-To: <ZXtWFk-Bne835txP@archlinux>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Dec 2023 20:23:02 +0100 you wrote:
> Hi!
> 
> Please pull following DT changes for 6.8.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.8
    https://git.kernel.org/soc/soc/c/e0a220a3adb3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


