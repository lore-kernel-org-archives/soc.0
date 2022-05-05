Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391B5C433F5
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1E75C385B2; Thu,  5 May 2022 19:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4F41C385B0;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779107;
	bh=RZ1wc6cX2tUvkrKTzKrpWqGHha5EjqU/zVNTC5Bax6A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dwq1+JlQJ3dDjPZPlQBiC9WuisbhYEUzaAVlh4RYR4BDbABDgy8YAO8nq7aZtrd0s
	 XtODjPWEaf/SC/HLLM2fjeKLJygFpxXEsGTRLRljI06t0IbN/npLxiUQF5YxVIp10M
	 iQehTgMRB+M35A3IhRB9ENz0em9Jr+hb4YPWYbOUYLewkWvM6oP0lmFJAQSmSW8iO0
	 ysY5T6hDFoTtF8HMn/03BAadwpBfXMj8S2DjkqEmbvoUY8uIv/d/5thECDKgqQFX8l
	 A+0Ih/AZ9WhgrmIdymn6opwsnZiXiQ+6l9o+4QM1eT99k73/2k6HujNzozuixuzRWs
	 RA/Om0YiMOJCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6C1EF0384A;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910774.9627.11199212655424345433.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:47 +0000
References: <20220504112906.3491985-1-sudeep.holla@arm.com>
In-Reply-To: <20220504112906.3491985-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 May 2022 12:29:06 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v5.19
    https://git.kernel.org/soc/soc/c/a4f7f93180a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


