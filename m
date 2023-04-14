Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E460DC77B7D
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A917DC43444; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90B6FC4339B;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=fxQK3iIViupTj6F7TzWPyZP/Rv0PnKdJKSAjSuJlaAQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Gwdy4bqlE+ngh5pO2c1jEMp9rwjkCcaIKBMdEDaEAIsG6++ydBYafiKFgFqsrUwAD
	 IALu/vkbbvez79WiBWuXYsWL/b8/uH/cvpV22bc2VB4jDL6zRhXaY+PxiAw9AIxD9Y
	 do96Qonj7R77PYozOm3d1HryHyFabXj1DJbisWiGPxw8hMew5wNGh5vYewGvjfzTph
	 DHMqqfKPOr5F3dCtTDcKLvUKXgRoU4djCUdRdyMl6wnLxJgBgQ0ll2ORp10TPpl0t+
	 1A1jtgEajrjRu3WLg7MPJ3B+3zKuEqABvzBgqtYmfwhMoD9fKDIWogk1i7FUYR6tpb
	 oLWc8we5Xq+wQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7861CE52441;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.4 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926348.30442.1998376806085495096.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <63987ed6-2813-15ff-e058-73312a730d61@foss.st.com>
In-Reply-To: <63987ed6-2813-15ff-e058-73312a730d61@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 7 Apr 2023 11:27:00 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT for v6.4 cycle. Main
> changes concern peripheral support on STM32MP13 and yaml fixes.
> 
> Note that I added documentation and machine STM32 patches inside. Let me
> know if you prefer a separate PR.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.4 #1
    https://git.kernel.org/soc/soc/c/83f91bb49cbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


