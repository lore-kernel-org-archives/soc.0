Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E37C43219
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31207C385B8; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13612C385B1;
	Tue,  3 May 2022 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651589422;
	bh=zaFi2hHYHUqGI1zZP691kdEPmhSqRV2o4M+A4VHp81Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=foPWTXWVhGGL8/jynR5prGA77ZbC+sgpWV6DIawEmKZiMs9J9XR0RMD4Q7ea0iW9x
	 Q12VsB9meg1tYnX8IJPFtCCc+yIZUwXgJvMHCiYJ3GziwNLRIG9apGtpaLAe3hZyl5
	 qGg72UaU3KVKO4wBw8jVtZ/NO/MPHKreIEfEu/4yJOjn53meEDH8+UD3ij33OlHmgX
	 riqdX0e38GTbYfzy8AtexV6MrH1wJaXWbAfhUqIFsMpzfgsrjMupQ0LyCGP5UmVLCw
	 4sIAjOjkVNeG/6TcU3E0sPjRFcGvAPMmy7iNy/iPVqhRJk40pamYXrQE8kL7qfs35m
	 sMpHMYRaKoFeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E51A4F03847;
	Tue,  3 May 2022 14:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas ARM defconfig updates for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158942193.22061.11497666207878064654.git-patchwork-notify@kernel.org>
Date: Tue, 03 May 2022 14:50:21 +0000
References: <cover.1650638502.git.geert+renesas@glider.be>
In-Reply-To: <cover.1650638502.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 22 Apr 2022 16:54:49 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.19.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.19
    https://git.kernel.org/soc/soc/c/65462ba7e1ad
  - [GIT,PULL,2/4] Renesas ARM DT updates for v5.19
    https://git.kernel.org/soc/soc/c/70a89009f723
  - [GIT,PULL,3/4] Renesas driver updates for v5.19
    https://git.kernel.org/soc/soc/c/447455690fb7
  - [GIT,PULL,4/4] Renesas DT binding updates for v5.19
    https://git.kernel.org/soc/soc/c/fafb0343aa6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


