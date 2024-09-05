Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BB0CD5BCC
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4255DC4CEC9; Thu,  5 Sep 2024 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C675C4CEC5;
	Thu,  5 Sep 2024 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550834;
	bh=Ico/hzhcdazMLMG5wuji2yIOn8zwozJGBhiUAwrV48k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZDz7ZLmaNy6riCSP3fhPStApK4KsraL9RDRdNYBqmg4N1NCBadcZ7Cd8RNgqo4N+F
	 QPJcevH+qe77vlJVxUaWg177K4XAPau1cqDNxfEaZGtqn6FpLBMcbw/zhLPzkB5usN
	 zhg7HwuxS8BJq5G71AUrAZPAhDwCxQTAgsiS2WHv65xas/QOJwKE1mNdEE4kv265Hk
	 KwvpcG1kYYEwr/Izo4uHMOd1EYcuR9SB8eGrDssAATyFrEGYPqsc6+yGr/uXiOHpBm
	 4q1DtdQUuVUvtHG1QaxIKtXOPHohYwAkS745wzcKMmZi5LvcH8xmn/iOG/WXmUtX0r
	 H9YgRU86bnJFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FCD3806651;
	Thu,  5 Sep 2024 15:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic drivers updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555083473.1737985.10453242210768170702.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:34 +0000
References: <577ad7fe-19b1-468a-b994-573855493fd7@linaro.org>
In-Reply-To: <577ad7fe-19b1-468a-b994-573855493fd7@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 5 Sep 2024 14:47:45 +0200 you wrote:
> Hi,
> 
> Here's a couple of new SoC IDs and meson-gx-ao-secure compatibles.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic drivers updates for v6.12
    https://git.kernel.org/soc/soc/c/249d30b515c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


