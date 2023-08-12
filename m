Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F328C41513
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EE1FC433D9; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16BD9C433C8;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=GhsDj3fEosw3W6na2g+IFG4xo8cfo67JpkZDK00SAF4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NmNxWvUmRkvVsOeuL/ATMFpceQbPIkALJBsvFlhmzI0uuSjiSvLHV4U8QeS6rmbTX
	 TaI8YZj0/dcsIfI0i+WQZNNS581Qw/aFIm/WJxmI4d7xR3Mv174d5x7mP/Y+lYktzM
	 Bl3Ei7CDMVPS9Ucw0/uS/WsTz/OBcQNRnGdwuQ7Qy9BAcs5PeGZMpvEsfac9HazNcJ
	 aLyLW0yrL4Vw7/DRWqI4kJIcm0+EWRIzG3p9YOn3yGBWGNDr9XtUH8xuzXFP5iD2li
	 mtrAbnvKaj4ELNRAsG7736THZLwtsWPEbq+0DxGhGiZL2ukRFMeB6l14zHoFkQ2qDQ
	 Ot6Ttv4K0UEyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 00CFDE505D5;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: Update for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168899.30475.620030477277237000.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:48 +0000
References: <20230804123223.3258086-1-sudeep.holla@arm.com>
In-Reply-To: <20230804123223.3258086-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Aug 2023 13:32:23 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: Update for v6.6
    https://git.kernel.org/soc/soc/c/2fec32345e82

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


