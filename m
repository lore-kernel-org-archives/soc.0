Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07E8C25B6B
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7EE7C433CD; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90C3EC433CB;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698268828;
	bh=qoZqB9539K6ui5ZdPWTEe3fUK3WPZDsAITvZ0/P/3+8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pkbk6CgRtAxOkycFtwF2Fkl8Tml7MRnjSEHOWBz5q7ZZKdOznJdKAwaHs8WooQHZl
	 H6rX0X0QeuqQBAwNesHrDBC6Ci/hDk21StK9PGhufcHgGdiGOKb55uBoUoeNmDhUF+
	 G+2OLiN+Bkft4X31ufuaO7IF5ICtF2SEar1PParLeCbXKB/oo9c4qBfSn8lWbTr94N
	 1NVAAGk+lrud3Aj2K6ZKSSOr0nfrwpDFMtiQp40j3lnDk47na2jwY8EzQOxCwz8XKl
	 iXl1lxK2Ps5DNSeQRX71F6OX0Nea8WrPoBaemNyvObySjbmKDXT/jdlqn7KCgcaE+l
	 TIGdFk3n5SJKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71034E11F59;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: ti: Driver updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169826882845.12441.18058270683297347460.git-patchwork-notify@kernel.org>
Date: Wed, 25 Oct 2023 21:20:28 +0000
References: <20231018165226.33x5cjn5jmgnm3di@magnolia>
In-Reply-To: <20231018165226.33x5cjn5jmgnm3di@magnolia>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 18 Oct 2023 11:52:26 -0500 you wrote:
> Hi,
> 
> Please pull:
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: ti: Driver updates for v6.7
    https://git.kernel.org/soc/soc/c/80957adc47fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


