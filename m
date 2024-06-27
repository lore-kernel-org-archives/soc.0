Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3B3C3065C
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A27CC4AF15; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24812C4AF13;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500464;
	bh=5lnSSyVOxGN+H0a4W/NXxf8Sd9aB2E/0xKUMWuodIQo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=W5h9+aGtcYCFs5YPAZwmKfZMo7MjPw4VSfuYio9wi885m4FMhuMtITEjqlrfPAEZa
	 1OOdalXCWdqb6H6YX7q+Igp6QzDmWt6xRSqYzLwsCetpLFKwj9vYw77LrnfC7OeDlJ
	 5OeCwfXOM7LuuWNTy++d4EQegMh5Xk7Abbm6QIrZJMRs8JwrUSgOxU4ur1uYxJ3UX/
	 tDJmaDHqk7H0YbqMfAJ6ZvSMPD365aczJ7Dt78ce79GzCVDDJDQj7ToE0TvUMANiMN
	 0DR8M+0Q/OKH4pK7EZIraCUunJrVv2veW0k+ksYTZFW8H5Ga1Hb3i+M2GOTMpQitD/
	 2McUW9z+hiiHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1AC48C433E9;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046410.29698.3365120525552681480.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:01:04 +0000
References: <20240620093924.375244-3-sudeep.holla@arm.com>
In-Reply-To: <20240620093924.375244-3-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 20 Jun 2024 10:39:19 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.11
    https://git.kernel.org/soc/soc/c/7cab811dfe7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


