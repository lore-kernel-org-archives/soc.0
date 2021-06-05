Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372FCC4743F
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 130976136D; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EEBEA6140F;
	Sat,  5 Jun 2021 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622934026;
	bh=NstMeOKY1zThBuE3U7okHSAkKObUZ05rYDfkuSUamik=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=n4t4JIg+7FOrCDF3PW/KfEbWR1fP6l+Lx7Y/rm7pC//dn2K+LJwWM0MBFZ+63W/ai
	 b/cs0jUbiQpQaMHX+fHnMejhadl9nqDt/xZx3Um2REO2an7P0bvYtNKKp0UYvhrUpl
	 hJeCztRPwGd1j6ZvgY/Lzmry++KWajHsRoDrI3aUUbU0CipAEC2tmNWSEnMteGfVXj
	 UMmtajeRrLfEu+ynbnb1aNX/dQKhgBC5jdjk7MkdmcoxZCs8ypV+yF9IK4OapxO9J9
	 o/2NkdxU5nYmx+DeegLknGaMLXDoaSLS24xklIHPVrOOgz+CsLvhG2XZHZEiU/oyBC
	 pbA3lQIO7MRlA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E51A460A53;
	Sat,  5 Jun 2021 23:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] PM and build warning fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293402593.32315.3708026233290825460.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 23:00:25 +0000
References: <pull-1622614772-543196@atomide.com>
In-Reply-To: <pull-1622614772-543196@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed,  2 Jun 2021 09:20:17 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] PM and build warning fixes for omaps
    https://git.kernel.org/soc/soc/c/2f3e4eb17973

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


