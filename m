Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31075C64EC4
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C0A2C43443; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0397FC433AF;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434645;
	bh=0lscUAnRx2AM8K3k2OXCzcgTEg6WzbZt0/KbzLrghX4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ketNezN06Ak+qw+J8WT8BDtfr48HAzCQhfK/dAIZw0ee15eaAS+rv8XoV4f1Zym/Q
	 7hFPUYLOypE8zAcpFEpq6jE+FjpogJOUDcXRcIcS5PUM1uwetxSvUQ5youkZT7eLia
	 +n99j5/C77oRqum+DL+rxS5STy62OUyFi1qnPw16CWYbk9wUoZhR01221x/+4rCSBl
	 nT8808EMt2ALzLi8HOROj3KdkZ+P9JA/6+D+B0vqRwABwrHwe3PwVqYgqw4aYj9GM7
	 Wj9ZspuGoPRhjFTSmtW1qUCDFXVns8D+cWcOd940ugmI/nefVyFhwwCuvcuiTTPcsg
	 YknycRI1F92JQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0FC1E45192;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.3 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464477.16250.3101597394574087180.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <5651506.31r3eYUQgx@phil>
In-Reply-To: <5651506.31r3eYUQgx@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 02 Feb 2023 00:04:52 +0100 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.3-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.3 #1
    https://git.kernel.org/soc/soc/c/eacef7cc523a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


