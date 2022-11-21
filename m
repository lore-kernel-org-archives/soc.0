Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F9CC47090
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0361BC43158; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E141FC43156;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=jBHBich0rFR2w4nJafyU5LHb3lELTwwEka9WrGXyH44=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=de6hewnH+mpATfZizqJpijo/FcGZ9T3KnIhErbZ34o4FOMuXY52Knk2oCaG8EZABX
	 tVxm9UqzBcUwnY4yPX6GUBhFCFEOej8MJozfegD1+WN/f4vGvG4Rn5FdYOrApSMkEj
	 TfDae1G7fR5GSZl/BbJvAWdIMP+7XKKQi/2o9qtX27zR8lcmnPiGDNDAsSQiQo6Jt+
	 EVzxhZcO+xudtUveUOCYvA90Pbl+rYnztVcWI3/yxEvKc6qgjIKSz+6/WutffQiozk
	 pwRMmoWSjuigBQrzWP8oluAPMEHHxM0C23XeyKLk6ljpWD9oX1ZigqHlG0sTgIBY4Y
	 C7axG0STRyexg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA584E270C9;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] IXP4xx updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234382.4359.8208005458716762323.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <CACRpkdYNwyZ1FDM07MkUfYyYGtXFQfy1xP9Utc5+K2+gn_ZW9g@mail.gmail.com>
In-Reply-To: <CACRpkdYNwyZ1FDM07MkUfYyYGtXFQfy1xP9Utc5+K2+gn_ZW9g@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 00:00:06 +0100 you wrote:
> Hi SoC folks,
> 
> here are some small updates to IXP4xx for v6.2.
> Details in the signed tag!
> 
> Please pull it in.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] IXP4xx updates for v6.2
    https://git.kernel.org/soc/soc/c/b8d0b1bef204

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


