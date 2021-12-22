Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AFFC433FE
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 22:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FE5BC36AE8; Wed, 22 Dec 2021 22:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2807AC36AE5;
	Wed, 22 Dec 2021 22:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640210409;
	bh=cRyUj328ojL8xJR2lxXmC3+G/qlx1LrIn9C3ZxTeEas=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sFN+SU+WW+LsHwcwNwxMXuNBh8TXbe7tubk+NSWoXgavLZp+6G/4hpY95x0qg2D9X
	 AMVCbRUyzL/Ty+hKtt+RnlEG1J6gTRRe7yavApNYV0e9osJtyuPG8fyAE0Q5IJYZnC
	 sKz47VfBZKi0nfarENhO1232wjrYDOjkXHJObuzhtZ+0W6jE1PgoLFrB0wPg9HdsP8
	 eSN9x0Go+82I/393kO8BJMO5vU3ANOqA50yeqzen1vyKhf7AWhzGDGYVrO0K9rCBIU
	 Li71kSxKYeA0o8oIk2NWGH21JB6H+0EgPliwwjVP2PmQatPNN9LvQ/vhNryh7y8Ciw
	 wnMyNexB6ZcSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0E588FE5622;
	Wed, 22 Dec 2021 22:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164021040904.6701.11939230483125968234.git-patchwork-notify@kernel.org>
Date: Wed, 22 Dec 2021 22:00:09 +0000
References: <CACPK8Xc6q=N6iFLnHt8RHhxvBhqu73WN9jBvitbwU3L6SJv85Q@mail.gmail.com>
In-Reply-To: <CACPK8Xc6q=N6iFLnHt8RHhxvBhqu73WN9jBvitbwU3L6SJv85Q@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 22 Dec 2021 01:55:38 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are the aspeed soc changes for v5.17.
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: soc changes for 5.17
    https://git.kernel.org/soc/soc/c/19bc5e6380f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


