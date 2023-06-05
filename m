Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB937C7EE2C
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9ADEC433A8; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92672C4339E;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980240;
	bh=y0Dd20yEg0nFOpWCiECORLZGLJsRJ6K38SCc/Blz0gQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tqD7IJlVYAT6npIJl9t5NIOzxD0wwaRPqi+aVOWrPHjTUZAeWipJpm1J6c8qfwWUp
	 xhjYzx9rZY1Db3PLry16PmrHilaN+e5UirhFrxaaAn915nCArAz5hqK4u2D0dY4anO
	 EzaWALZJJLeTiv4Yb7yhMM0E09e8sNLHE8NazQJgZxXacHa4DppfmSmwQhtzzBJ9iM
	 AxMCsEAeg5tDftQx6ebxWDS8JHsusfR+oJb1l8Ai+tK9ZnWG5wvWcuuY1h27AXurem
	 Sn8pa6JjeMpMvlTwdCrKhARcCL+h/n9h+lPBA+mKOLEDBenA+bO5EujHJtJA3hw0CV
	 J8UD+nfrmlwKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 747D7E4F0A8;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND GIT PULL] Qualcomm ARM64 DeviceTree fixes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598024047.10098.18011670832834016891.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:40 +0000
References: <20230601142659.2246348-1-andersson@kernel.org>
In-Reply-To: <20230601142659.2246348-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  1 Jun 2023 07:26:59 -0700 you wrote:
> Resend, because I missed that git request-pull complained that the tag had not
> propagated to the server and thereby gave a partial refspec.
> 
> Regards,
> Bjorn
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
> [...]

Here is the summary with links:
  - [RESEND,GIT,PULL] Qualcomm ARM64 DeviceTree fixes for 6.4
    https://git.kernel.org/soc/soc/c/44b5814fbab4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


