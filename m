Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D607C433EF
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D13AC340E7; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF172C340F1;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809662;
	bh=qMN+cWAB6yjp9dX3KDFcBtcXHDCI8L1cHX7RsMcpiqM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SReK32AITr2Cz7mxWbJJ801lLDf3L/oy+5I0iQhkLzC4mGzdhkGK52TmrJkSrK39O
	 0NbkbC2yz/bglxGEiMjc+/DbVtuNHXni4+2kWDw41TQGJzZcKDSQHqUnFQx+ZdW3AV
	 yq8iZACQF2+3C5kfRhUVR8uRTMlve3vacbHelLYidndNLfmik7V8twRVaPecUm1Etc
	 3MeuANEmFXtKrKJh1zTEO1iIimK0LXXXz7Ao1PCR/qiLPY9ekZ1+H4+h76/q5nPRLi
	 ijJnIavMEUg3yOSXMJr2Ue5NWqpfoYCnlu2kXxpm8Ge7WFAAWp2C70rmAMh9y2AWrI
	 0z9VtNaD7QMiA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBB50E6D4BB;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966276.15608.17467766541599537362.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:02 +0000
References: <20220225113220.51401-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220225113220.51401-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 12:32:20 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the defconfig changes for 5.18. Please pull.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: defconfig for 5.18
    https://git.kernel.org/soc/soc/c/a1c57d7e77ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


