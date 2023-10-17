Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC7C41513
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1B0AC43397; Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9106C433C9;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580027;
	bh=IrnVU9+QPDXfUgJbmOoyhEPAvL/oYXB1FhbGSwATM0o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fEUmoEWgQ41g9F4qiENKqxRdTCGgu+tgspENgnrDdUHr3uRUHA8DZofBH2NOOzNwp
	 d10jGc6VYhiGgnQolO6uUXIpFshQpFnOKasse8QtM4q5dLnwhpeo5ZX2HB0A/L0dNR
	 +gx+GJp0rnQEUcxpP5xrbK/kVMd1Bp7rPfzQCjMEHBQ6N2hAd9M0rA+o+yTcZpiTM3
	 IL9aLMBET6tAyochpE4vJZH5XJIe+S2kIJ4vJYi9B9F+4jYLutO8Gzt5aYTRqampZF
	 bB9lI0sjRH3i26mBEWVJk/DJCLPz5TcqvXs9oL4irLBp4f8T2nmmy5FI1tFViU1i3J
	 AqUwGiKFgUswQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4675C691E1;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] i.MX dt-bindings changes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002773.24805.16210370547587100730.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
References: <20231015132300.2268016-1-shawnguo@kernel.org>
In-Reply-To: <20231015132300.2268016-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 21:22:57 +0800 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] i.MX dt-bindings changes for 6.7
    (no matching commit)
  - [GIT,PULL,2/4] i.MX ARM device tree changes for 6.7
    (no matching commit)
  - [GIT,PULL,3/4] i.MX arm64 device tree chanages for 6.7
    (no matching commit)
  - [GIT,PULL,4/4] i.MX defconfig changes for 6.7
    https://git.kernel.org/soc/soc/c/9b9a5546b336

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


