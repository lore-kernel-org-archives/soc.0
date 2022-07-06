Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB18CCA486
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A06D9C341D7; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B000C341D2;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108818;
	bh=jYF7xOGkqOT16tP+0TDrs4iytyF/y6l2Wlgn1fxIMt0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BZpbL/2kRqUn1jWwN6rfh8uLvYaOlVom8oLbi/70KfZMmc0Se0gOFqNMOdhcF7Fg6
	 FEolqN0+CBvWTPNnKczZld6NI76GuKzmq08QDCx3zt2sfYFa9KZkSMlqBjGJ2YZTxe
	 5Dmbh7QGJJSf3PLYYPDo8tsBF7dnB5c59Vv4uzPpy0r5yEpODPybVSO9620+zDmuyb
	 TVaQJx5hzMX2ZIVv17lDX3iSdhwz79xRzlkRQEPKQEszlMZZl9a5XAzpq6n84RUOqi
	 /JnS9y3mO3QElq0YKB8cj9P8RJJmV0wV/Bn6QPK//CwfPus0Fouj6ERTRgA7TdF13g
	 gUJmDXkR0edPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76A2EE45BE1;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.20 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881847.23384.5533355376482560833.git-patchwork-notify@kernel.org>
Date: Wed, 06 Jul 2022 12:00:18 +0000
References: <40088956.J2Yia2DhmK@phil>
In-Reply-To: <40088956.J2Yia2DhmK@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 05 Jul 2022 13:10:45 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in a subsequent pull-request
> Rockchip changes for for 5.20 .
> 
> As always the 64bit DTS part is the big one.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.20 #1
    https://git.kernel.org/soc/soc/c/73a4ccf93867

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


