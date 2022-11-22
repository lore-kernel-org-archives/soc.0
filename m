Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70575C43219
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4ED1FC4314B; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10E58C4347C;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155626;
	bh=K9msSCXLlNA+PqHgdczqbnNa9YkATAVjajcJWBsa1j8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FhAwmWziL5yZmStyrUZY1kcNefWXCVMvWKK6zhcXX4tUMmdSaAW85YLu7/EFSw2DG
	 M4apxD9Tvmqoo+iy+nRkZb5LYGpmtz+Esf0gPu6klslSC4hL2+90WJK92i++mgGhl9
	 YkJm8M7GBOREPJGch4mRb6RIqEBldPkwUVWc8malmpl1aX2HbsxdMAo4Enp4jxWXk2
	 lYHFalqfPF7MKNQZa7pXkc0Ym+elMifPnBhuH/NJdO/+2bXpTct446InrD6hGDHV7z
	 PTOoHEofO80XKEB7TMmfqi0tG9N6L8nqgyp67k8H4ToL/ouFnzSi0bzdnXXEe8argZ
	 8Knh46DCF9KJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C97D4E270C9;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562582.11152.9314638583392404867.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:25 +0000
References: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
In-Reply-To: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 16:24:59 +0100 you wrote:
> Hi,
> 
> Here's an Amlogic Drivers change for v6.3, fixes memcpy vs iomem type warnings in meson_sm driver.
> 
> Neil
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic Drivers updates for v6.2
    https://git.kernel.org/soc/soc/c/ad654a0a21bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


