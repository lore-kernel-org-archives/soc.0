Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE3CCA473
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F8E2C341CF; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6490BC341CD;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108818;
	bh=XKGF5nfG8LlTPL0Nfpta7oG2l6RzDi9VniuOYhmM8gY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UW4r6HQEXupgNmavXLQAYx1AjKt4lDr3geG2cAvuFNuFHVCUHw/ssUHp9YG1cR00J
	 CNR/7jT4nT3QlQlWiBjqD0wGIGW8OXirnkud/8sB3OArCfhEoSvE4bq+9rXPuQ5222
	 o+HbNPIwuJAJ385tMRCsdwAafyTWprH6Mml7jbVUNlIjP5fVx45NodKqA5zrdpIa/p
	 X1tBhW1tFETbf43qhS38HoS4Fau/Hrc3miots2yusDDlOubMtkjfAbcDG7XTUdHxHe
	 CAy1FZ/jHvpQ4NULzmavOutyNbbiwYTI2MC7pfI3Q86xMWQ56j6XRPY7KjgZP5YTcC
	 1nA6nLqxM7EhA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50296E45BD9;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v5.20 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881832.23384.3176879733511921186.git-patchwork-notify@kernel.org>
Date: Wed, 06 Jul 2022 12:00:18 +0000
References: <a250f32b-f67c-2922-0748-e39dc791e95c@foss.st.com>
In-Reply-To: <a250f32b-f67c-2922-0748-e39dc791e95c@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 5 Jul 2022 12:17:07 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v5.20. It
> mainly adds a new DH board and enables SCMI / OPTEE for STM32MP13.
> This PR is based on the PR sent for fixes (tag: stm32-dt-for-v5.19-fixes-2).
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v5.20 #1
    https://git.kernel.org/soc/soc/c/888c173e3198

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


