Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7157DC47079
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65660C116AB; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E5E3C433BB;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=t6ikm2Uuhizvc3uhcWUyjJuJa0zL/c3Jtwf73Kk04Ek=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XcGlY18Ns+XQy30sUV53ep5nl4icOioH8iBcb/FDoCRuLxWL1RkDDEP/ATpUDVT61
	 DJpOnzq2s7fxzZp5qhZzIo6m9vpbmLHwJ/SD7d/fVP7HNyL4t01gpSav57wnpBnsiT
	 RE+9Ws8n6VmcN8uNUpLIuAOD+GEZYaLuwKltVPHxz2BWM6ombCbWbplUqr0UpdGg4V
	 NccUeCN/rq8oT8wUeNschj9ETZzur+MyeYbvIK7XGFXGZyhNLrIb+7AdawYUndN6V1
	 hwJftSf1NZx3Jn5O8BG7Boq20Kmzk85m9gHh6ADXRhfdttuCkVcw9GLf5zlL92k/pR
	 ocIUyDw/+eZvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B316DD4EF3;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: Updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046623.3302.6948115478336386017.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231213115826.3577764-1-sudeep.holla@arm.com>
In-Reply-To: <20231213115826.3577764-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Dec 2023 11:58:25 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: Updates for v6.8
    https://git.kernel.org/soc/soc/c/7b0ddbf748ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


