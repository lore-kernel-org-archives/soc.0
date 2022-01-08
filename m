Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF65FC4321E
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 782A9C36AFC; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61ADEC36AE3;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679214;
	bh=JL72fnKpBSuxCahyUlImftD0jN44pyqIZqgZsHctDbs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oT1zjuNmrp66rJUvjLXc51i9flIDqCykpG1+L0+aHwGZZ+48NpIxaUtwe6zQ4bi5J
	 FcsQWySgt2MRHSfjUir/PSTPS13AMRiHLox5WTRn4faf7W4HRZ1hg3ArYbNUSN/+Bd
	 4zCKfADo2tgnj4pTnCZRLcqoccyf0VjyAdXkgcRZJ4NXPTc+ocs5WGR2jL9jhrc0vB
	 9X0HFXpiX6D4MxU1bVxweKeovGOqg4om/3OtoXuFp8ULWPiaXuWWko/FzNz2XHvUZM
	 zUWOrAgo+rIpVmMs1dn3CJLefJ0T+4MOYlzwF0okEDI+bwY79ltM91gSDnHEXL95Fj
	 RSVZdW4qxKLpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B4E7F7940E;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/fsl drivers changes for next(v5.17)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921430.24856.5117528642270798509.git-patchwork-notify@kernel.org>
Date: Sat, 08 Jan 2022 22:00:14 +0000
References: <20220107033736.26762-1-leoyang.li@nxp.com>
In-Reply-To: <20220107033736.26762-1-leoyang.li@nxp.com>
To: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Thu,  6 Jan 2022 21:37:36 -0600 you wrote:
> Hi soc maintainers,
> 
> Please merge the following new changes for soc/fsl drivers.
> 
> Regards,
> Leo
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/fsl drivers changes for next(v5.17)
    https://git.kernel.org/soc/soc/c/6b6db66fb373

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


