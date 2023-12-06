Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D055BC10DC1
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A67AFC433C7; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82341C433C8;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879541;
	bh=kxnIHlItHZU4ux0C/2TIt8UnP3JmiKFGEDXBsPrsXXY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OllWonJG5foAQEfjU0XrRuBUebuh/KPEKzVl1R8EByATvJiCYEGE3kIrHxTZtA7zM
	 4cC1Ww6D/wJ90dac0gTsG+g4JkhaY0gdGYaQ2m+SyaY61iMNeXYIKFKf+AGSnO0dp/
	 Xqd2e4KW8Ts1FyuJ4e/VE4O/KojsZSyXdTs3irTdx7p0KC0JtqADZTumPa0osgiSG0
	 1dVj6plriyh0L8JU3hic3eB/oXMmcBRMH71t1U/jo0G+YEjkpExXhBpW0IW+T7g96G
	 aabl+/RGRMnMTt4znHWMt8Rasos8sm1jMlOryfgtYMOWkVoBxv3XOIeW+8eSDy13qA
	 /Oeg8eEj7vYVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D9EDC395DC;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170187954137.26038.18391830416413761661.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:19:01 +0000
References: <20231204134724.30465-1-sudeep.holla@arm.com>
In-Reply-To: <20231204134724.30465-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  4 Dec 2023 13:47:22 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.7
    https://git.kernel.org/soc/soc/c/2d8781ba59c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


