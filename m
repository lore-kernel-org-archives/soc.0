Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767A2C677F1
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59CA1C43396; Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 444D0C433EF;
	Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390532;
	bh=8AxOL7zlfAigInX9BOqIm+oCXHcGQWZd98tvnMU1h8E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kOQzV8nq1V7tayY0U+EMbg8Wj6XggZAJnqHa20C+66b0MCmUCzM/ezoYk5KF6i/RN
	 IHDr30zegkQEU9bETDBD17zg/l4WUw4lbeI7kC9wlE3pz3U4FcNhHvJRCsZy+1kobO
	 ExvaNOXabkSl+o4XNHTNNUTnnK39iMVE27a5WUvmjlYoV/qhiGoFMf0IDGpqt2slJn
	 b9r2flmnACRb+laJv9evGecUnUUUOCs8qRHWzm2sjKT2jCOsTJzAnkzzVgffbp/FHx
	 g7J2z0nrBDCs8iPom3rzJLY4jJlZbdkt+odGq1dxCgI7ZulTn8P93L1VAOGMWyjbb9
	 UDJUKYVzHqe8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32C75E21EE8;
	Tue, 10 Jan 2023 22:42:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167339053220.5083.4119441888390027987.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jan 2023 22:42:12 +0000
References: <20230110213946.2183982-1-andersson@kernel.org>
In-Reply-To: <20230110213946.2183982-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Jan 2023 15:39:46 -0600 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-driver-fixes-for-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v6.2
    https://git.kernel.org/soc/soc/c/42c18d13623d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


