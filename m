Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3C3C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5839823AC4; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=UXwMysa3bQDHZra5qo42KU6577gwNy95NMNyyS7WDd0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nVbGup/N5eIMuPIQd8naYmUn0/Pv2OynsZeAvZfHXpNVPzSTbaEbjo64xUWF17uti
	 hYfKJh9S7EoIRK7t+24ltCqHvG39GiunuTZiijIBsgarrh6SFy4wOvN76SntefShXr
	 OHGhGu/adxg8XhprM6kNhpufEnnhMPRsy4DWdN7hHwejWOLkC4XPxkmSlH9enph+2A
	 IgmjazeZDHJQhP0Jq/6/5KZaFn+aTYuRRerMZXCkCjVEhf36zi/GOWNQmpSauS3mg4
	 mCdAwKyvcWhC+s5PPjjFtXzC5WM7VdgOY/LqAdIhEc+LrIJYa5yvt6F5J031JsDXD5
	 nSg3sYfALVeMg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] drivers: soc: TI SOC changes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142920.19687.181485141588122287.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <1606851405-26338-1-git-send-email-santosh.shilimkar@oracle.com>
In-Reply-To: <1606851405-26338-1-git-send-email-santosh.shilimkar@oracle.com>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue,  1 Dec 2020 11:36:45 -0800 you wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] drivers: soc: TI SOC changes for 5.11
    https://git.kernel.org/soc/soc/c/8dc0aac1ccd5
  - [GIT,PULL,2/2] ARM: dts: Keystone DTS update for v5.11
    https://git.kernel.org/soc/soc/c/30912c3ce6b1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


