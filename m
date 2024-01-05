Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D837C47079
	for <soc@archiver.kernel.org>; Fri,  5 Jan 2024 10:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBA37C433CC; Fri,  5 Jan 2024 10:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B55FEC433C9;
	Fri,  5 Jan 2024 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704451225;
	bh=pihtxoDZ+9wKL8JGDoE7Ca5NkhhUA7fp4kr3sGgYfWU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lfQakjhJtCKlRDV/d+v+n18HzhfDZAvUipbzFiUP66Z/eS24kJCB1PdRwCHIBmorT
	 VrQPtPJvTB36SywIZIfrKrvLcZTdBln3CPcVpNPQll0eCU9k5nzc48goOvO7HA+NLn
	 YzLHFtmD3weUTG1NIPWj1cYWnXCDv2AIn8EQYyd1xgbpZtI2qTgd9xXqRI9tJNedy/
	 /MQ5NSPo0TzUsalkUJRu/6pwTilpC5kvswUHttHwkv+Y+8Dk8MQaOvKKtHdf9El+qn
	 6h8n3t+W+OEJR1KOXVU7BHpik3cqXUwzOrR/4tzVqvGyaO2hHXlbFyuCg2ivAO/zHS
	 qkeWwMKIRJuwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95427DCB6F8;
	Fri,  5 Jan 2024 10:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170445122560.21771.17893424883997339820.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 10:40:25 +0000
References: <20240104001354.152410-1-dinguyen@kernel.org>
In-Reply-To: <20240104001354.152410-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  3 Jan 2024 18:13:54 -0600 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: updates for v6.8
    https://git.kernel.org/soc/soc/c/3f2f25b5aebf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


