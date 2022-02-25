Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E1AC35278
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6828BC34107; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52BA5C34106;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=muyDv9B4bkybZ/z1npxk2PknLXuj4gBDdjBUbtEQ2XI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=k8Re7F9ywlhCbf9vINGClJ/MJSEWJfDjqrGmWsd4EJLdT9RwvZHZKHQL7AHTX2XfC
	 pxS2CY4X3puM11zwJw9dBiH9hBMSLMERDc5OglHFfz14fs+xnQX7BETP3XujM54ujf
	 9nZlk1eLzvoo7UQJxWQZF7qRIweQ1g2iSiiOm70Ob3HyDT2hVVYk/iX7SHqWjyRuAr
	 6t3PZFGdCXOdzlGQiGUJYi8dV2Kcf5bMgOXiDse8g2viTm+g4YJh6xa8/yT8T4dqhG
	 kVio3o6CWx9bWA01acD+VdqoNpJ5Io3brt2ANcHqMjKYySVausb2zhovO1U4Ps35Ly
	 +kN0/JRppQHcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37E04E6D453;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966322.15608.15125772329273801410.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <20220225110735.18080-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220225110735.18080-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 12:07:35 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the dt changes for 5.18. They include both at91 changes and lan966
> first DT patches which I'm happy to take as part of our pull request.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.18
    https://git.kernel.org/soc/soc/c/c845b558599d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


