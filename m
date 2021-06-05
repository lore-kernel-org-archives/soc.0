Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30578C4743E
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0D15761421; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E9A136136D;
	Sat,  5 Jun 2021 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622934025;
	bh=4Ofk2daoaPpO+oNyqFq4hpM0m0KvZwwQ9PzxUjByKTk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QuZKmSdaUupx++FI7+YqxwwlMAE3Tc/nTb6HxRGf2j8GuBEEWtT6lAaRKt0dkufg0
	 NDSMp6DRqUmMMGov0FqIFGRqlHp7jJmkrIuri4AZu2M54AgMGcdyguinGpbyOL42DK
	 p9jawGx4hK/PJ+eMoHoEz9gRG6VzNrlcc4Re0C3VISj1pYMBGDcJevEXtJoK3Zi6xD
	 /25tvzPoe5AyPeJfDH3DZ4GQYh0A686+M4gsMyTRSmOKRUM5IF9sL2e8JRyQWgcOyI
	 gIKEWgjhxp3TwurWK9FhsjmmavpWfzlVxTYLCJ7nRG88yYsg/0wQMvK72Kvf8SoS2D
	 A6iF2uqzyY25w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DC754609AD;
	Sat,  5 Jun 2021 23:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293402589.32315.4429882987859890133.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 23:00:25 +0000
References: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
In-Reply-To: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 20 May 2021 23:04:12 +0200 you wrote:
> The following changes since commit 0c855563182001c829065faa17f8e29e9ceffe13:
> 
>   Merge tag 'arm-apple-m1-5.13' of
> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc (2021-04-26
> 12:30:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.13
    https://git.kernel.org/soc/soc/c/ba816d3c265c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


