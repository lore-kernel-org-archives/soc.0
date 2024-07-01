Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76D2C41513
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C4F4C4AF0E; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66876C4AF0A;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719867637;
	bh=txDU9IXAr16OcJpIAY7CX+iJ96SQSAdox1j8ugpPWIE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XgM4yPPbvf2dbaaC5SV3IWer6xcYvycbLk3wnXdRnmYonO78v36wpfG3rEc4VIoMu
	 RgGNRoVoUJvQoAnU1QyVYAbTAK78m5Iv8ZbNEwJoEp9T9OGSXtsbKIrLntt5V4E9Bg
	 hHTZlgom9wqH1FIHI+mOC0ri1M6PhODpeWnALVqvN/U2TGTkKoR0Wcn9B16t4n/YxS
	 Nss6vOVhynRejyB7+QUpOw9FdISMKCvJNrfHNVkmeRtfyBkAt7LrBUCc+jfFwReflw
	 0qtIxQcPkJOxHRCH42mNbtJH/ll+8C3w9Mu7gMtAS6KjCJ6amjp28c1lMACMsUbuQZ
	 uazVrMHFkQRcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4EA56C43468;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic drivers updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171986763731.7657.2556519656289311431.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jul 2024 21:00:37 +0000
References: <35093904-c4a8-432d-b010-a994fc1ee536@linaro.org>
In-Reply-To: <35093904-c4a8-432d-b010-a994fc1ee536@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 1 Jul 2024 10:38:03 +0200 you wrote:
> Hi,
> 
> Here's a couple of new SoC IDs and MODULE_DESCRIPTION() fixuo for meson_sm.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic drivers updates for v6.11
    https://git.kernel.org/soc/soc/c/276d7eab387a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


