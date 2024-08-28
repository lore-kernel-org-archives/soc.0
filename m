Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A3AC7113D
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D76BC4CEC2; Wed, 28 Aug 2024 20:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07905C4CEC0;
	Wed, 28 Aug 2024 20:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877721;
	bh=ARFXwTt8tdAtS7EVsPHNlIymbw30SwrdHkw7OTuugfI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LwWvix7gvopHfgmcqtHzPA37NO2wBg4nz0c2Y6JomKa/BQDF06Qkpc03DULYFr/uV
	 aVwjmJqAJ8fAI1Idk4NbtAIN5cCZRsRjxo1ghKgO7XhMikVusDrEGOu6ihSDV2m1it
	 phXmjJqE7/kegaAITJtopQd44pbaQ/K9GDZYC63ytunv6BZ4gm4operFUg1nEM7A6q
	 34xToq36NlMU2QJU4yQTvt46MUyVYuRB/omVr5tREgzSFu/deGYDA9KqiIHWJRh40r
	 1ay1WOKyQrKKcMbR4ROb/F9Xiu/gXq+OozN04SAQlFPy9RDyB5TPTLtz8lFr2o5epb
	 dOisiQEdcbpYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7184D3809A80;
	Wed, 28 Aug 2024 20:42:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc driver fixes for v6.11-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487772116.1420116.999683796181200536.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:42:01 +0000
References: <20240828-fidelity-almighty-18d5434aaef0@spud>
In-Reply-To: <20240828-fidelity-almighty-18d5434aaef0@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Aug 2024 16:26:40 +0100 you wrote:
> Hey Arnd,
> 
> Please pull a single fix for 6.11, as things have been rather quiet on
> this front over the summer.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc driver fixes for v6.11-rc6
    https://git.kernel.org/soc/soc/c/3536c01d6577

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


