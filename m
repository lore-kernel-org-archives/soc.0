Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B22CE7B0C
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AA56C43397; Thu, 28 Sep 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1EAAC433CA;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888044;
	bh=14htCO5sPGw3H9kGhi9NJMeAM1A/io7/fcVqBXlhkoM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rzkPXWuEGGQfjXZwHFz19KQu+MF1BfWUk2UD7wnn6HusdGRjDkh41PNnfyyVVIoEL
	 vRIq4zEnuarBwrhxx8rTH8bIobLMbFSHEtgeusDVs0itVaWdWbbC0szk2y0pQmDOkE
	 oBau3YkpD1+R8cGpA/Y9huIRgsH3xqpNUWzGpI+CX4sHLGQ20QCAWrdXW05I+X7Y42
	 V3yGfMwzc2kMTMQvptzDTPSK8iY1cv/8Cli8WHmsEWZAHlYNyvTlC9lpXMqVHkRJuV
	 eyJM/wDZR+AkMkZpxVkdbsYZH8G2WLk0m6xFe0vCrfOhuv1IGni9LXMeRUyMe8W1av
	 ZRRZzMJMmUHBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6F41E2A05E;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fix for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588804480.3136.4631088376195154657.git-patchwork-notify@kernel.org>
Date: Thu, 28 Sep 2023 08:00:44 +0000
References: <20230927121604.158645-1-sudeep.holla@arm.com>
In-Reply-To: <20230927121604.158645-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Sep 2023 13:16:04 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fix for v6.6
    https://git.kernel.org/soc/soc/c/5106e65f23ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


