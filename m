Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE73C87FE4
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A350C4331F; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0307FC433A1;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316228;
	bh=2s3fR4tpsfP4EaDTkJoW4aapz2LgB1Z7UZAVeYIj07I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=k2MtBogUdfo1SGX/Hmz+eGG7t2HjpeMfr0iwOZuOWYXTxC2Tl44T3g79ogeF43qwG
	 h5upLZUJnk0XFueER5XBZsprOgsTuF0mOvSj5qWiEhLEDI+X8uqAKCq+pdA8NpQBJn
	 A9PgE4uJY34NY93uuiJgUOe57HP7RO7DTmk5c5tt0F9BP0dUwYThnJEeqbw8d/rO6w
	 Ia7NEEDhpEL1pcFWhh9h4+dvbBH8dnu4QvnqI3Wq+bRNJcnP1SyZ1YLyQe076hLcrv
	 qGlaEgq8G1AdLyAE2AVqkChkHGLNmge2KTT0GQTm2k9liNbGA2YYakerwyoflXwC+j
	 a6rqf8HlMEu7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DBF25E29F36;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMDTEE fix for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622789.816.1399329447481675161.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <20230606075843.GA2792442@rayden>
In-Reply-To: <20230606075843.GA2792442@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 6 Jun 2023 09:58:43 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this AMDTEE driver fix to add a return origin field to the
> struct tee_cmd_load_ta used when loading a Trusted Application into the
> AMDTEE. This change is backward compatible.
> 
> Note that this isn't a usual Arm driver update. This targets AMD instead,
> but is part of the TEE subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMDTEE fix for v6.5
    https://git.kernel.org/soc/soc/c/abd649fdf91a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


