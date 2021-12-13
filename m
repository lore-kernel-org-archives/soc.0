Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C319C433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CBB2C34608; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 067F1C34609;
	Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405229;
	bh=8qUWq82j7kunD+HB84gtL7JGp0TkAtWl1GvOQsQCWAw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OCOl0yWep6zaKTTn1MeLV922MZyUe0cLfVQOXBlMwI3YbKxenWQn4p4A/6P146TwP
	 h+1P1Nd9YLv6eJ0wy+8l/n6lwSgleKszmoUqTUGY6ZzpwwKWBGyU7TAIRaEtQFhOYI
	 hzlMIwylynZziY998DDVC2DQh6VH9JrZRE2MCS1a5RDn21bTlVNK9eNnKktG+XpLrB
	 j5KnKdbUgkHv4dUvp9lr6MPYZowz3DsM9gjZQ9lMLQm3t5ibOmsjAo2i3XQkrz2Pc2
	 3wsLdUDiIPYoqZMhtjfS5EX7TkmzSX0TeV8V9vTwm4FCA0dxXoyTuDkrOJPjnhDuH2
	 8FU1y/1X8mPRQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E5D9560A3C;
	Mon, 13 Dec 2021 14:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522893.6863.4017704533100904726.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 14:20:28 +0000
References: <3072346.MIvVl8DfR5@phil>
In-Reply-To: <3072346.MIvVl8DfR5@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Dec 2021 11:04:52 +0100 you wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.16
    https://git.kernel.org/soc/soc/c/d823bf891a17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


