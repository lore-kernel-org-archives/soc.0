Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928FEC63705
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5874EC43155; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42661C4314E;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=aIjn1YNJjaUgMByCD/wji7iVeSqO69px1gfU7DqhI9I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=unLX5VxNdfKjKLMChUJxk8xaFN6GSNeHj/jhcfD5TYKzx/MMbUFcR2Fm4GVIcZbep
	 +/Qv7OGSS46uQ7O6m2M0RGa4woPYsjVu7uNUjuUIfNwW0MqImSGwmy+la+SO0YyXYZ
	 OgCB8yXsBdf1NstCfB+A3+N5LMQGNKn5u03tF1w1+bRfxc8soKQ2CtgaCeP62yt5Wa
	 b3gn1ZXtQUeld0faHbseE7hKyaHR6dZL0RtIsQkD3nPFVJLCyQC4V/VfDuskiuamWS
	 5crEfjc8a4vqBq3NIg9kENdKuW6PyrnVYexuHnW9Z2Rq5q3Au8BBs1e4KcOTU0na+P
	 Q3mp88ZjYzkCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24DB6E52546;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] AT91 defconfig updates for 6.2 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826214.9936.6771617169396111640.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <20221125142736.385654-1-claudiu.beznea@microchip.com>
In-Reply-To: <20221125142736.385654-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Nov 2022 16:27:36 +0200 you wrote:
> Hi, Arnd,
> 
> This contains also a patch for multi_v7_defconfig.
> 
> Thank you,
> Claudiu Beznea
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] AT91 defconfig updates for 6.2 #2
    https://git.kernel.org/soc/soc/c/3880e0df2e14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


