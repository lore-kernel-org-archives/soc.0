Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38D0C6FA8B
	for <soc@archiver.kernel.org>; Thu,  8 Sep 2022 15:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B0AEC43470; Thu,  8 Sep 2022 15:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 742B4C433B5;
	Thu,  8 Sep 2022 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662652216;
	bh=UitUj0piEaVGaAGHFv/We0UKlPgyIZHgHumh2uckpj8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=f+LXdD5xyehiEimAcZxOJEf3ctSHmPrMfgaRgnnYe0onK3ecaDrkrAi76OS72t49Z
	 5zopMpanVufO0NuR3iCzaOAkh26G4zx0K7CifrxqijcC+tSQT6yICXqSs3sdU732ps
	 zW3yBeIB0/pzsOH27yduGlmeJ/yHHI75WnoRhtJkYW9lOvrplaior3CNA1t/Ss8mXs
	 +Botx8zwRhgCF5ak5Yw1ozp2ZsDJGP1HKqz4DONOvt8icbTwZCeY4GaW4pvdAuti2D
	 ChSDlqzS56LPxO6Mp6zHKHVpMeYdhpYtTmq6II+XVC8PG0nFeMCFsbOs2mR3+pq40S
	 vVUY55TZlnuDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61FFCC73FE9;
	Thu,  8 Sep 2022 15:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166265221639.8789.17959088696572450397.git-patchwork-notify@kernel.org>
Date: Thu, 08 Sep 2022 15:50:16 +0000
References: <20220829174435.207911-1-sudeep.holla@arm.com>
In-Reply-To: <20220829174435.207911-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Aug 2022 18:44:35 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.0
    https://git.kernel.org/soc/soc/c/d4f1920d07e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


