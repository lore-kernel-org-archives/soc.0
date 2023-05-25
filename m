Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477B5C77B7E
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E666C433A7; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0164FC4339C;
	Thu, 25 May 2023 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685029639;
	bh=TU02mxipCYYrdNDsKp+NAsa/jaK3ljtJCOd72i9KB+g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pNt8XG3dtn4a7ktZsYqLBwnhRWYlyuQub2g3+U9tbYXy5wYJ/oBsDPEGnYHPBFOLq
	 gFywIUJh+cnSTUsgafy5DIYFpGkKcIKWavU+e+CmmBrtVWce3OmCIQPThOhCU8T4+P
	 4w8/Jh2qKk+x9vvjdzeSwPtZIEfroC8f+2kylqrOGBpHKR1pY1FiHEOnGvc6bA6q4C
	 kO9FlMynudFCGRSYZE+mrjWzNGGAh3LhGLxKA0AQQqURucqtXZy0f8G6gL5S9Zhm6+
	 GLFHjsKMk/t1kkBCFBShmUdv3lE+cdO5YE67G9bVZ3B3HJK6IeVLxT13P5OxiaM458
	 /jewiP3lQX+Aw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB39EC4166F;
	Thu, 25 May 2023 15:47:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm/arm64: dts: Fixes for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168502963889.27102.2356739855377891421.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:47:18 +0000
References: <20230509143508.1188786-1-sudeep.holla@arm.com>
In-Reply-To: <20230509143508.1188786-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 May 2023 15:35:08 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm/arm64: dts: Fixes for v6.4
    https://git.kernel.org/soc/soc/c/d14b555c3354

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


