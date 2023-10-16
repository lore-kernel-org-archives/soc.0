Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7153CCDB48E
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41D16C4163C; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BF83C433BF;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=zm//kevYBZfRf91ZgjzTVb5r15HshVyHO7SBeXgE4gc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iYe72W4nWMvljFoDIR2o7KLtbOMX2hGLgA/nl37LmvMXjrRT+eA3Jwo4jp7vVgQOO
	 FNvzdRk2Vmo7f+r+DJe6th1eyzzlwldftITWbY51YHw4EAATHs0FdzmJLVH9hTEi9w
	 3XSBBOTPhTPzmtVkISl3+D67ssvg535a878mvGlDIMUNEp8lQwAdSkQbagjX70m0pH
	 0AIPmDxtQYK0Qhjs1apNapao/hnYNQ3CBk4QiRTsuHHjmUKDWZwVP5cGQBxlp1VNN3
	 RYC4i5B+sruHfDZec62tZiBD8B5HYe7mylrYbdLvzDmli93M8HfY8sp4svKUWKG0pU
	 f5na7IvnlGZ5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1670CC41671;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191808.22284.15504907179536547777.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:58 +0000
References: <00ef6ab3-59c1-484a-9d70-50f16e4cc584@linaro.org>
In-Reply-To: <00ef6ab3-59c1-484a-9d70-50f16e4cc584@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 10:37:37 +0200 you wrote:
> Hi,
> 
> Here's an Amlogic Drivers changeset for v6.7, with only a couple of
> low priority fixes concerning the meson_sm driver.
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic Drivers updates for v6.7
    https://git.kernel.org/soc/soc/c/15c46d85f021

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


