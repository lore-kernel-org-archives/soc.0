Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FB2FA373D
	for <soc@archiver.kernel.org>; Tue,  1 Nov 2022 11:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB30DC433D7; Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD5D7C433B5;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302217;
	bh=XsZg/0tyjJgwZ/LtGxzFiR5A2rHvEQufnboISjL/93I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jUPAwnxYrzIp29wpNyum4uck0p6jNRWnRNcTMxWq+HcbUzws6ilIw+xmoWSiawFin
	 bd5hoOTRUcefO0iEanVSAdHxv+pF3g+CNKaMDX5YgukZk/dQ1aPyO1jpQAUtq13nZX
	 IThul2kh2iJZWYmi31eW6IW+AaHsoi//Y4uOXA/ZbKzJ5XjR4qm8BiU6kUtEZrKDK/
	 vqraLTOyt4lMkVKhBbo8nwreOpB2ajPOOJDBrYqATaDpfVUIOGxWBZj/q9HoQd00wF
	 5rM12o8Xaffm0VLSZcLbXB5BZP56mudronLEjaHU1vzlmwdkZ8Ro/KXJP3ic9n4xfp
	 +SdN3uQjPmfnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A4055E270D3;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom maintainers fixes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166730221766.4100.12076681175903605348.git-patchwork-notify@kernel.org>
Date: Tue, 01 Nov 2022 11:30:17 +0000
References: <20221019185514.750684-1-f.fainelli@gmail.com>
In-Reply-To: <20221019185514.750684-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 19 Oct 2022 11:55:14 -0700 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.1/maintainers-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom maintainers fixes for 6.1
    https://git.kernel.org/soc/soc/c/2a5dc663e34e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


