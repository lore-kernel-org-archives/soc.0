Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F71DC47089
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47655C4314F; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 253DBC43147;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=lKVThPuusa30ZSUvS2r6+f65VX+qz/GgSb2FhKGq/9E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=c3hd/MefeZAVe2xVEPxrOW/UhAXvws2gRPMqym3e6Cv6MDPRH3qyt2Ct/uB06gqao
	 vel7hAoFul6keeYXrQRN1m4HtVc1NHxKkfsNuvPOFihPk0SxRQfZYEWx7gXJOhyndf
	 v3OKNC3g/IaY6xw/JlmjHMnbfVIyjA60e9OZJhLEatOtsRTkU4+H99eH8g45ZEM2J5
	 bMz6IGmoavrqGN4UQ4lKfuBzn264gf7E3aG7hBfl4mVvLCp/LSdDQr8676Gi7BX2Ea
	 1A6McLAgLVRPTmEZqF8uu7Wzdev28a4MrzlmfaQbfEZcBFhkBiB+qxyCzKSFd4uqVr
	 aS5eArwLxaejg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8CAFE52548;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: Updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826194.9936.5390640306643885456.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:01 +0000
References: <20221129115111.2464233-1-sudeep.holla@arm.com>
In-Reply-To: <20221129115111.2464233-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Nov 2022 11:51:11 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: Updates for v6.2
    https://git.kernel.org/soc/soc/c/33423a8bd2d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


