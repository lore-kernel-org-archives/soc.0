Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22B7C433FE
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7ADEC385A5; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85AB8C385A1;
	Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650555026;
	bh=FXAhTs9/M75dCnQVxhBDK/LIEpf2YUm53WKIuii8Hew=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NFkVvX8einWsRPdI0O1N5HSdV+aBPuX5oD3QtulsSjEMN3033FuXK5rspHDoWx84I
	 z4H19TVbWtajImwxrxx3AGAl7C3J2E4LQOkBfwvgBM8I2rywRZDy9xXCKtWjUPz8Gx
	 7fnS+mc+Aj/RG7Wob9NaNRRXClPpnQGNiRV5pFWDsT1H8KeTTpPc5/NxfZp1I4tYHM
	 +e5xSU5bRRhsMFsaDubCmP4eWhgeN7XKRIQ6LJsKgBXbsWFq0fEfcVsayQfd4K9S+W
	 x8CeT4BqeU0XUELTPxQTehTSF7xvBhOoljv0LUtq7QccDAkS3BK1IeZc62sGvotLW3
	 tsg++25pDAiuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6CF1EE8DD85;
	Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165055502644.23603.4293726041405986765.git-patchwork-notify@kernel.org>
Date: Thu, 21 Apr 2022 15:30:26 +0000
References: <pull-1650543308-836725@atomide.com>
In-Reply-To: <pull-1650543308-836725@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Apr 2022 15:15:27 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 71ff461c3f41f6465434b9e980c01782763e7ad8:
> 
>   iommu/omap: Fix regression in probe for NULL pointer dereference (2022-04-08 11:16:29 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps
    https://git.kernel.org/soc/soc/c/846e24dcae5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


