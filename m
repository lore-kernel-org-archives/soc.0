Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5022C52D71
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C35A3C4AF0C; Tue,  6 Aug 2024 20:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8DFC32786;
	Tue,  6 Aug 2024 20:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974905;
	bh=JHwFzt2j6LtuwNQGyyKAIYlrQf7Ta9NhcAoTlos3PCQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lmnEIZGviYxb9FT/zr+qydMdCxeFYkQQIgjFW2X9XQfUFCNx9HbQlU+aN3Nsqq35j
	 PeJVQ2I/paEwrczbgoJo8GDBF7ctJKViaTkBeR3Xi2g/vgjqeqOARptHzYSX6tdFbO
	 iwQwrMBQWHrxiyCh2ogSIEVhl7u32iVHacacddECI2m/pgj8C6wYzpR/Vv6TCpPC7o
	 U+SiTDbIlbb6w0kz9mqjj3l5k9KHqdty3nAZv88lPt+/yAMewcHahW4B4qBT5H30Xq
	 ap5Y7Ez+PjyRTPvPFNdtpyo1KoBHrS6MqsF/Wl0LKdke2gsHVbkv0AJYgJbmXTtaYW
	 m2WXfcRyTHWVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2C83824F34;
	Tue,  6 Aug 2024 20:08:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.11, take 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297490450.1692635.15793970218399487366.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:08:24 +0000
References: <d7810433-71a2-45c2-9095-4abd23c12431@linaro.org>
In-Reply-To: <d7810433-71a2-45c2-9095-4abd23c12431@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Jul 2024 12:09:40 +0200 you wrote:
> Hi,
> 
> Here's a second set of Amlogic ARM64 DT changes for v6.11, with:
> - Amlogic A5 power domain
> - Amlogic S4 supplementary device nodes
> - Watchdog for Amlogic A4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.11, take 2
    https://git.kernel.org/soc/soc/c/35b94a99fc67

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


