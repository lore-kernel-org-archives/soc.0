Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3794AC7EE2D
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C635C433A1; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA673C4339B;
	Thu, 25 May 2023 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685029639;
	bh=99ZUpctvcmqIGpSRL2CD/QrL5GXNbGdQG8skxFaUhh0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=P69sQUVznWIsP2b/eY7Q64yWVItOypiEcc4GhwilCA9ZPkTeDkw1HEb8WW6Egfbvn
	 azGvOcs1DyKdycurjwrdn4hUUhIA1Q57HZWhbMZ28XB1UG3bAX7Z33dn8aPwNAxXn4
	 wwj+WXFNMe7/kwqrX5cL/ri4U559KzjMeVt+5sAdMb1ZFyxfaOXhfcnZ4zsbhLUZdg
	 eYlHm1pqAFQSSmvm2hKEddhsViCDPTioXwm+JpMXOkY6zzKX1O3siyDP7u2bEHwf2I
	 1y6qybPPDxlIiFX8SAIykPgKpb47PfFbMQhjiH9gH2yoqNr/KS3AoLKlbbVvWyKVEn
	 z5Pt89d1jBspw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2313E4F133;
	Thu, 25 May 2023 15:47:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix uninitialized variable in OP-TEE driver for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168502963885.27102.1312262124124929132.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:47:18 +0000
References: <20230421075443.GA3136581@rayden>
In-Reply-To: <20230421075443.GA3136581@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Apr 2023 09:54:43 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch fixing an unintialized variable in the
> OP-TEE driver. The error has been reported recently by the kernel test
> robot.
> 
> I realize that this is late for v6.3, please queue this for v6.4 instead
> if v6.3 isn't possible.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix uninitialized variable in OP-TEE driver for v6.3
    https://git.kernel.org/soc/soc/c/9bafc2bb469c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


