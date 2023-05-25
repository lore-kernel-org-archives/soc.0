Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477FAC7EE31
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 244F3C433A4; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0975DC433A0;
	Thu, 25 May 2023 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685029639;
	bh=cXNlYVHPt13Lf1XMtpYeesAnquUtq84FXatA0H5Rvf4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=T+tT3QXa2uMHxqzKY07JS5szADcn288t9M8ffFPXMYoEipq8KCLe8ZIacFqi+9mU8
	 oznX2PIMtBQ+U8iDtZ/HufAVzC840FI6Yj2Yl8j5lalrKNrfgFjkBMepyoXl3zX3Dp
	 jH9logDnt6CReQDDLrq77VSeflaGCf1cJPZzst4ijcp6GaFOts03c9JCBAXb6oxK0f
	 BN2QhgaOi6vm3fr0GxMe7aFul8/RuXUfSgvGozhLI1wM0fsQGXGLXFgBotu+5mH/T2
	 +lzBsIDovyhChj3gEHVQwQkvKH7BERHUWuYxPbqrE7yZt4wymU0Mmc3KmMGorkAtcK
	 DFaFs0sCRmrDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E4C3AE4F139;
	Thu, 25 May 2023 15:47:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fix for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168502963893.27102.7217907187345417200.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:47:18 +0000
References: <20230509143529.1188812-1-sudeep.holla@arm.com>
In-Reply-To: <20230509143529.1188812-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 May 2023 15:35:29 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fix for v6.4
    https://git.kernel.org/soc/soc/c/0bfa36f9bc66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


