Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB2C7EE20
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1E22C43324; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCA06C43446;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=gwX1aWOmxh/IX5be8/c6hVMXB9H860+LTV+lSZVTPOk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=chZfXrYOGb818NBR2Va6D4BXMhJxW3L1MonIpvT2HA3+UvDAps9oGLFb9oxCH5Vr7
	 bqKsnodwCuyNHIcWcN53GvCiwdE4gbKm5rm8h6d8sNMX/1WeeFbcgg3yDxwRh3pZCY
	 1PXkzsBx0YRHnnjAg6o0umFjCm6KRXcS36+tdJSbYz/OfRDjQ+JQ0guINzPSA94Kzs
	 R8y9x/zv6inv9L631RjN80m7Yg6UkMCjcMne1ml5q8nx/4v638v0SwKYCEkLu1ScxQ
	 mb5VmuQtuox0ohZ1+JaLPWUtSt/GvxOJYSCUs28JUaZjKfNz26k1YCUJjIKbjFUvZ7
	 emnKyBIgXfOmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5157E52446;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926366.30442.651067535276989665.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <20230408125156.GA17050@jernej-laptop>
In-Reply-To: <20230408125156.GA17050@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 8 Apr 2023 14:51:56 +0200 you wrote:
> Hi!
> 
> Please pull following DT changes for 6.4.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.4
    https://git.kernel.org/soc/soc/c/8f09b5ec4177

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


