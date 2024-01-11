Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF15C47422
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 16:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D844C433F1; Thu, 11 Jan 2024 16:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBF0BC43394;
	Thu, 11 Jan 2024 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704988828;
	bh=ZfhpI2cb9EpiHz+hNyYj0NTmZsUVniyz5MqF1Hl3Up8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Zk9VU5EWOC4SGUXqm8udtW7AYWZc/LIONCJKWGd4b5LTU2CPRDC0txJGq5oPoSwpT
	 xkXyJwbq+D4LyXNzP8bWynH0tITG2Pl9vQJYgupgSo9mMcLhUjA0U0rkgct6POy9ll
	 y02NK949eQiIi0rydikScBmESSsjSjwNE3OX0yHAe1MUpajn7c5L77x+lpA5vuVLFW
	 3D90TjBeH4vkYK1M+cL41tUzcABj2p2S+0IuWYfWF1SxrBjsyPZMOv27stIy6WZ3Nq
	 ndCx73Hh27TZnqeA0bDLZeJIV9x9gvPnDuRye5yMxkFzwYBZj75nOEsk6pvAsFLoPf
	 3MzY340LeVC7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE0B5D8C96C;
	Thu, 11 Jan 2024 16:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] ARM: refresh config files
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170498882783.27164.1338629675408736305.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 16:00:27 +0000
References: <20240111092550.1313277-1-arnd@kernel.org>
In-Reply-To: <20240111092550.1313277-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Jan 2024 10:25:44 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I added these to my soc/defconfig branch to help minimize the
> diff for 'make savedefconfig'. there are still a lot of lines that
> get dropped by this, but I did not manage to get through all of them.
> 
> Arnd Bergmann (6):
>   arm64: defconfig reorder config lines
>   ARM: defconfig: reorder config lines
>   ARM: defconfig: remove sysfs-deprecated entries
>   ARM: defconfig: remove CONFIG_NET_ETHERNET references
>   ARM: defconfig: remove CONFIG_SLUB references
>   ARM: defconfig: remove dead platform options
> 
> [...]

Here is the summary with links:
  - [1/6] arm64: defconfig reorder config lines
    https://git.kernel.org/soc/soc/c/67df5b47a946
  - [2/6] ARM: defconfig: reorder config lines
    https://git.kernel.org/soc/soc/c/23a7fa9c08e8
  - [3/6] ARM: defconfig: remove sysfs-deprecated entries
    https://git.kernel.org/soc/soc/c/984893f80e0f
  - [4/6] ARM: defconfig: remove CONFIG_NET_ETHERNET references
    https://git.kernel.org/soc/soc/c/183a967ad19c
  - [5/6] ARM: defconfig: remove CONFIG_SLUB references
    https://git.kernel.org/soc/soc/c/114854438def
  - [6/6] ARM: defconfig: remove dead platform options
    https://git.kernel.org/soc/soc/c/c2dba4d19f65

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


