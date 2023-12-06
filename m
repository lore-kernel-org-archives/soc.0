Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB59C10F09
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF0A3C433AD; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8CCCC4339A;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879541;
	bh=V0mB8/D0Qe73RGjQAyxCUeprQ5oHgKZSJHdLtHnsa+E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ndPlb5UegK89Jx28m/YTmOH9K5dlW+Es1oFAGmKDcUvROHUsi27G55KkRljHyKwdC
	 +0TzYjxje/jBqus22i+pLrDTHsPLpefrQSc8IN+OUDm74DXgkFNYaEKlXhW5JcTM3U
	 Lgyzn9vXk5ehK54WKJKKbn9BVa3PMx8wxSOhoqfv+0AVeEtOgott/sw5jyKgc+q650
	 1RytcFrVf6pfTAugzSZf+W2vU5wW4Q1I4E3x4vEL8zsKdsaC9Ff9rypsvYQOT4wZF6
	 6htgMuY68RYt/NmJDt5e6/oc2iOhz7j/85VI30g6BiADLmtgc3J2SRprE+ZP3cswop
	 8gSoBXyGX5YuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E744C0C40E;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170187954157.26038.2743634663195283242.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:19:01 +0000
References: <20231114153113.GA1310615@rayden>
In-Reply-To: <20231114153113.GA1310615@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Nov 2023 16:31:13 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this OP-TEE driver fix allowing supplicant dependent devices to
> be detached by user-space before the supplicant service is shut down.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for 6.7
    https://git.kernel.org/soc/soc/c/9c7f01d5f438

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


