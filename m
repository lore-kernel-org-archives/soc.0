Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE89C4707A
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D95FC3410A; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4191DC34104;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=Q+LewTUXtkZZ1SWhFi9zfbVBpLHAIzgq/dgvtDs+810=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MBGFz5fU4WQX0ghq2uXQhli2TD7xowdK4rIOhQY+/0DtRllTnTNBa5dpE0SPUJtwO
	 jEh9Nt3fTrJTLhHAacbeE3awoTC/omUODWic+UbKJw+NboZTdyc8Mp0TcU2ozBcQab
	 QT4bm8OXfh90ea4MHbuZBW1i40vQN8HJtqstADFLmdmRFnFtOG6We9oIelMHryYJxy
	 NlYyzOLoblrcbdoQF/DF7XhG4Y6vCJN6Ri91XWYDMypxkGzVmiklR4DYtL7N6D73MW
	 +V6bNRuIj70KA6Isty9pwV7zxKTUbpXHnr9NNvRAQKihwlnQkM0K4C37a2rlDix2yE
	 wrEoWp382Ik4A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E898F03839;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v5.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966318.15608.509994138728833956.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <893924a9-bcc4-9fa9-4f8e-7f56e77f6854@foss.st.com>
In-Reply-To: <893924a9-bcc4-9fa9-4f8e-7f56e77f6854@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 16:07:00 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v5.18. A tiny
> round2 will be sent next week.
> Note that this PR introduces a new DT validation warning:
> 
> arch/arm/boot/dts/stm32mp135f-dk.dt.yaml:0:0:
> /soc/interrupt-controller@5000d000: failed to match any schema with
> compatible: ['st,stm32mp13-exti', ...
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v5.18 #1
    https://git.kernel.org/soc/soc/c/877d1d8112ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


