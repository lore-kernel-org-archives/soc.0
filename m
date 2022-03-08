Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49CBC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD69BC340EF; Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A632EC340F4;
	Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646756412;
	bh=StFkQjOPGhWOef2qrCuU4DFejHETPE4ZbPESuU3B6po=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ccjmk+TisfoWdwxq9pVemy1P2I9M8Cp8aImgyvqzrlrGYYLILJfwbJ1/njtN5Mg9J
	 AteI3d4zJQ2t/WMG/ISBCjGJOiSWfp+3ALXhcNY1z1AXs3jYQbSPVQEvYAS+un6aao
	 Dp30CTHRdFU9E/5erPGqUonr5B0/o69UnhEBIzBdf8yd75R3OeMFGtqbM7dAe8yzyZ
	 /fc0sAIsYW1gfd6ppdHMP1nzNlqyVtUzIxlyHp8ZfZaXnfdWFwr8dEsVpefghAIZ+s
	 4SkmokZgxPOsFrZZNv9BaNXxfyvJSSjMxWUJGHZYZEjDLc8+8JOM5aOUQ//heXDuCn
	 Ibvf6lY7GGXbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86D90E7BB08;
	Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: tegra: Device tree fixes for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675641254.4559.12702684309194939029.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:20:12 +0000
References: <20220308084339.2199400-1-thierry.reding@gmail.com>
In-Reply-To: <20220308084339.2199400-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  8 Mar 2022 09:43:39 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8d3b01e0d4bb54368d73d0984466d72c2eeeac74:
> 
>   ARM: tegra: Move panels to AUX bus (2022-02-23 13:26:00 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: tegra: Device tree fixes for v5.17
    https://git.kernel.org/soc/soc/c/60392db617b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


