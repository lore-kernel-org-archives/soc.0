Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F7AC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C27AC34609; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45298C34600;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639518011;
	bh=cdL9DNOELY4u11RiQjVlHBjBwvg5r57i5dze/Ua3Fsg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GNkQgy3pkc/KF0Q7lUM0bCWwz7JSLwnUnrjxwZPOIOaEqwaBDN6IvLnHi2FsWAtkg
	 Uqz+muQhiCalWUMBxZqnjkAyAzQ7eoI+fVrP8KLaKqe/lRu/XDMRJCO/5cx0gw0Kqp
	 5eqerL7ytT/0Siy+6Avd81OvJPdJd8nTkiRfwnnxtDJbEbpe3NwRDRkagNYoBPmNIw
	 nRtZHmqXX5UDrkw4Qj/jcltm9bJhhDG9nC1v4jUCdOwyhCt0QsRQtT6bsM/26ew/w2
	 qDsE68uy4sqUHyzDmDkdEwpgVWLcdX5Av6U6PNbjmByk7TuvrYs5sVOIa7HtLTaGPm
	 C68vRoJ6oNM0Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2759260A39;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] IXP4xx DTS changes for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163951801115.19193.15039713920343192366.git-patchwork-notify@kernel.org>
Date: Tue, 14 Dec 2021 21:40:11 +0000
References: <CACRpkdYiWK7TEbZrh4_0WT5obMk=ZSc7AQVUSPXL+-uZ_hsUEA@mail.gmail.com>
In-Reply-To: <CACRpkdYiWK7TEbZrh4_0WT5obMk=ZSc7AQVUSPXL+-uZ_hsUEA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Dec 2021 01:22:47 +0100 you wrote:
> Hi SoC folks,
> 
> here are some IXP4xx DTS file changes for v5.17.
> We have now a complete set of DTS files for the boards
> previously supported by board files.
> 
> The plan is to delete the board files in the next merge
> window for v5.18 (because of dependencies).
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] IXP4xx DTS changes for v5.17
    https://git.kernel.org/soc/soc/c/2aaeccfafbf9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


