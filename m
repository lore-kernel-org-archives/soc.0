Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB0C54E5C
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D11DBC41679; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB4CAC43609;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=i5o0ekJb9XF6YgkRagFDe16DtO3SJxdMreMt9ksMsRA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Asp5gLXekBkfoG0suHJbK4aQgHQ5LleZlN7JZhGES3B6vsI+0ikKcNgrXjp/1UjQD
	 79t2r1pp6lGHHCZwWt6xGxVqEkaQknug/GNLPgs8pxMY52ZAXkvFeEF0zy/hyNkNzA
	 rWlr5U32rpjA//uxM1QwiJtS3SRvgg7MDqiRtIUCQC6JAV7x9ODGjvSQ3JD7zSDYzm
	 8TIAkKQvmD7Eswnd5kvS4VtinjvxEmXE5557UFkIfEkqO4aIV8YQWIIMJ4EtPmQUnD
	 vf2CXo4LMuiFMnVXiNgFyPyAo4Ovlizog3Am9NNqLVV3f9OFz5Mz0xHhOeXoaQnV5p
	 X8KhdBc6sFYeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B75DC595D2;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.9 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612962.13542.11906869987620382905.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <37970455.XM6RcZxFsP@diego>
In-Reply-To: <37970455.XM6RcZxFsP@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 23:58:21 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.9 #1
    https://git.kernel.org/soc/soc/c/55d81cd6a971

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


