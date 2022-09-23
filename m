Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30807C6FA82
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1159EC43147; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB7E5C43141;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=HMvoM2Rlsz5TJ4KUP3rkvfnXX7/FuNHf0mPctb32KG4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ks++Jb4+RIOFfTDpweothpz6dtqMFXGP9jywbQZOsYbo6EVk7Pa3JKLoOdA90NtOe
	 kPEcGXkau1s3yHyqpqvPC2nc7XTOOZQrE5/aOFM6M7VfOjoPz/H5hx1z/An5Ftcavj
	 etfshKKgf8+loY++7fCZX7qrEPa1RioJwnwcUS9XSe0DQxldd2ojJNISfqXT0UBB5p
	 eVgaO+Tnu1rsiK7x4dUwjI/9icC99ktAVGoRVr5/c8sm5IFDQ3sqMrv18y26IgFStS
	 b8QdMwwl6rip3Lv0oJTfdyvWL/czlPiciYmKThuVU3AKMOYLRdmuC4xrsREQBLfTnw
	 BRdDKW4CQjQFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CBFD0E50D70;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] i.MX DT bindings update for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002683.3905.14181701361161735314.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
References: <20220918092806.2152700-1-shawnguo@kernel.org>
In-Reply-To: <20220918092806.2152700-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Sep 2022 17:28:03 +0800 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] i.MX DT bindings update for 6.1
    (no matching commit)
  - [GIT,PULL,2/4] i.MX drivers change for 6.1
    https://git.kernel.org/soc/soc/c/b97e1e2faa3c
  - [GIT,PULL,3/4] i.MX device tree change for 6.1
    (no matching commit)
  - [GIT,PULL,4/4] i.MX arm64 device tree update for 6.1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


