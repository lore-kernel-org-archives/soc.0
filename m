Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA21C43219
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82BDFC36AEC; Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 699C6C36AEA;
	Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639664410;
	bh=mROaabtsvGnhkdiHb1LI59yaLIRA62HGAJvgwPHeeG0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rnVGkq4erRUAjDnfQD4LM5JYCYMn4Hdm1/7Tqw9H0ztZ4E7nqKvELWn6zNNM0IWO9
	 DzL38MaiY4UGvX/f7JGdhCMG80sNjo3L9pVcXeWYuphdpn/B2Ch2xqrYayTxFhXLch
	 V8XS7eLr79z8I/ipRSDfa4S8/qOzyP6OZ/GuDq0/Kvgz0/ZYoQhHk8v0cWlUSht5sD
	 rpU89Wt8jaccwAepwYY4G4uoi9Vi0gMpuxE0vmWehAieehKthj3nZmiicm5pBnRoVf
	 Y+6haV0pLhkCTJFKqcXTLHhFD00kSpJ/gsHgKk3z1HYuRZStjq6qVBPHsR9RKqdtAS
	 DAw5ffhzRz5yg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 48DBD60A7D;
	Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree changes for omaps for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163966441029.28413.9182853597690931436.git-patchwork-notify@kernel.org>
Date: Thu, 16 Dec 2021 14:20:10 +0000
References: <pull-1639659798-679261@atomide.com>
In-Reply-To: <pull-1639659798-679261@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Dec 2021 15:04:41 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree changes for omaps for v5.17
    https://git.kernel.org/soc/soc/c/365ee8033142

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


