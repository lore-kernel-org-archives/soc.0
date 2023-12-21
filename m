Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EB7C4725D
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F903C4AF1E; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68C6BC116AD;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=4QQqYxDeFP1vcVFaC6mA8TaQdVgfwErfj5XfvqLfYNw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aq/2yzCs8y69/mrT1BPRPhpvPs7LtBneindemW3Dt5UUraMb40x4b2/L6ZXU6VysF
	 UVfo9od1xCCJVFkY52BZeW8lrDcKRQrOyljtVTlGrm6+VBvdYjmjOvsIz/jGHyOkdB
	 ddaM6Qw/rwjIdqp7nPoSmBuMY+Wms0DVclprSUXEiG5BZRe3zIwvqygZZ1pAUTsIcD
	 iMirBkUHw2EZP3kAZfad6Z6uWrDkEWVgaMGwgAMj5jQI7IPTqHAqehZhs0WC5z0T6D
	 FVmNfuKt7sEzzntsMOUu1js7fsVwaphppUxKXD6VHAWHF19SKHjo/B17QywFt4wrUx
	 zhnJX8zp0uv7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54B20DD4F1D;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Devicetree changes for omaps for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046634.3302.8517833120233071320.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <pull-1702037869-295608@atomide.com>
In-Reply-To: <pull-1702037869-295608@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  8 Dec 2023 14:18:17 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Devicetree changes for omaps for v6.8
    https://git.kernel.org/soc/soc/c/734e575fc683
  - [GIT,PULL,2/3] Defconfig changes for omaps for v6.8
    (no matching commit)
  - [GIT,PULL,3/3] Maintainer changes for v6.8
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


