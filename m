Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09FBC001B0
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98027C43391; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B6C8C433CA;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=HPELkgkqF38vB7zswIqFrB78FJcfUh8gu+ZFZk4eE8A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oaFt/JeCv7oviHlhKI8DOrN1CTBbdEIfqQWsiFBYPGL5JC0oAB/QUV4uGjdSRi+3j
	 TVNJHFtkrqMSR4CNGJuqrkeGeq/joVkVUm085t3dduqIC6+MxFdXXxXLVHM+ObY1My
	 w1nlgHDQNIGHwQwKMUH9GYwbBtb6eC5THWddGqyA95u4xlYD0l4mwnzm9zt7/cMm81
	 bDp0iADVC1nFzPhu8qokbRubjQ1NYvGcybQQbKpgllyfKLCs/6CW+w3M6ZI+8lX/xq
	 hHk7Blwy7iloFfqbUapoGkj0zRHJG4o8uPUrn8ob+sXB0Gt3vGDjpAC+Ka1icZnbTN
	 pJs5YUtWU42LQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 66F69E1CF31;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: vexpress: Updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562741.32343.18288449760840866202.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <20230804123214.3258032-1-sudeep.holla@arm.com>
In-Reply-To: <20230804123214.3258032-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Aug 2023 13:32:14 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: vexpress: Updates for v6.6
    https://git.kernel.org/soc/soc/c/0fd70327d670

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


