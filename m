Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92097E94120
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45DAFC433C8; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24AD9C433CA;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626685;
	bh=6HEpSBQn9zV/33K3feDvoZv3qcbqV/KAaqbKxlGI+Yo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EXc9mjHjWB2QgQAkGOrTl+BJCuBiQv7lQqzqZYRCcupG1C3gm26WBdETR8xERAEpg
	 XOnwz+mU18UdOUpytTCVEM/vola4wlpTzNQKktQyGpXRSU+l1iq+DJTTjuzUeyBRzT
	 BRG8d2rxh2Gi9lbarXFf8vhEre2s9RkVrhC+JXn6mD7kLSVw6r+P0fyD14obP7smFS
	 D6pLllpp6XZ/M7suMji62NdamZyKuwEqTNmSyHWAhFqYl+RFmhWPTInzJUS9S0D/va
	 9ZYTKDgn3gltsjfBPpwcCWy0Oz11LBuuh7jRLg/bsHg758SOlMOUfqJEjXjbQzJ/2r
	 /gPa4KPut+8IQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C535E11F5C;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas fixes for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169662668504.6539.13423303184238947814.git-patchwork-notify@kernel.org>
Date: Fri, 06 Oct 2023 21:11:25 +0000
References: <cover.1696578170.git.geert+renesas@glider.be>
In-Reply-To: <cover.1696578170.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Oct 2023 09:46:04 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas fixes for v6.6
    https://git.kernel.org/soc/soc/c/886d1f1f8f5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


