Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB6ACCA47F
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86F21C341CE; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C341C341CA;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657661420;
	bh=28+2RZ9L/MINj9JCKQFZb7vU8Qa0Vsg5SKZa1FtLppY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=g3304UUrScH0PTTovsf+VDASuMSN3c57wiRAPcitkPMAi0noKkG9XY9SNf0j75iim
	 COgUe3dhNjtokegX2rlFEkuwPhpKqtLLFWMkEd4Hw3YzV9rWEk24RpFIMvnbfRTpVq
	 P6sOxG2SfskZIQVtRFBPvDoyrDYX7LDII3sNJJUPj7LxAJ3W4KlDxsMyEyCGs/PjoZ
	 SMamP5dUdCod/VIPnRve9IhUXXjvPhfw5Rm0W4CSO/E5pUVhlE8IvGmjNfrUypJrWv
	 IRx/5mcMuuoq85Y1ux5vIYTA4Tvtl5vTXmS0FWzaARVqr7rJM9sJsUT3AYHRZeoUHk
	 aguUTqdY0RtTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44C9FE45227;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165766142027.32298.14827930850076842217.git-patchwork-notify@kernel.org>
Date: Tue, 12 Jul 2022 21:30:20 +0000
References: <20220709082951.15123-1-shawnguo@kernel.org>
In-Reply-To: <20220709082951.15123-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  9 Jul 2022 16:29:46 +0800 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.20
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] i.MX drivers change for 5.20
    https://git.kernel.org/soc/soc/c/03e316033c45
  - [GIT,PULL,2/6] i.MX SoC update for 5.20
    (no matching commit)
  - [GIT,PULL,3/6] i.MX DT bindings update for 5.20
    (no matching commit)
  - [GIT,PULL,4/6] i.MX device tree change for 5.20
    (no matching commit)
  - [GIT,PULL,5/6] i.MX arm64 device tree update for 5.20
    (no matching commit)
  - [GIT,PULL,6/6] i.MX defconfig update for 5.20
    https://git.kernel.org/soc/soc/c/01b66d2b33cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


