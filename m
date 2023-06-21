Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD99C3DA40
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B25F9C43397; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96E5BC433CA;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=A7E5S6qC9D/90fHlUfZZEinv1xlOCU0JbyZjLVq/f5s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fUGrq8d6jQkBgbB5kHmsSpLnifGd+i6PCWiZtusj2iMryU5GlAOfMlvRuWDZSGHNd
	 3PyF0elUcMPSMsOkVCS7LFQANq/wx53qD8NYhp5Tb99c+w/KR9ij7YG/HZ6snSw1v7
	 i6+xjti9RrmCdPS368sagRZZ3UXnxwNRP6y8mOnm4rKVuUvdjgkOFM8i/66UXrbVq0
	 ELOSTtbn6+RUBF42SjAvVBO5eUEVUzop4snTmPVTY+Y9KWzkycwS88U46nv4fTzFqg
	 m3BZ4sCLw+PednYZPp7knoUuVJEEOuzJrD0/qtucwlgk+AxBaXBPjANykL41iFil9y
	 1//KlrK5z7XJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74C61C395FF;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 DT updates for 6.5 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943647.9834.16696457231839759229.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <20230621093853.1575312-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230621093853.1575312-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Jun 2023 12:38:53 +0300 you wrote:
> Hi, Arnd,
> 
> Please pull in case it is not too late.
> 
> Thank you,
> Claudiu
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 DT updates for 6.5 #2
    https://git.kernel.org/soc/soc/c/ee44484c12ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


