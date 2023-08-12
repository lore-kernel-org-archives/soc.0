Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6549C07E8A
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9587C07619; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93959C00443;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=qfzoB1l/z+KagtnEUMupQHyiJExpOAbABvmkPfKY1m8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ixofjvA/aMYxlxVHzRJWsscb/8kp9PKg6aHQFgPBlBoaPgBxjK8QumI8DSW1HTFU4
	 YTX7NbLTS2krKEvONsENnF1ETP6OSas9mbtZ6lie/pxFrRC/igMvJUBvDNGkEWJekN
	 YcsirrvERgjjSdn7ci2/vDKJOeQYxhbyurIU1lgM38GA2dG5LCWOpOFAIsock0xZLW
	 YnNtIhGWkI+X27sxAabpeO1eTe9x9uJMnQiNHqCdY5Va+BLwkk9EDzturUzRQvb5zS
	 0j7q5pM1LqMLp4fq658+zT3PQpXuZfSGhzdeXhLxOs8G4obz+77vvFPWJ2CFq3n6MV
	 nZaqJlMU8CdHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81D37E3308D;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168952.30475.15318401260540589884.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230806180546.GA127039@jernej-laptop>
In-Reply-To: <20230806180546.GA127039@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 6 Aug 2023 20:05:46 +0200 you wrote:
> Hi!
> 
> Please pull following DT changes for 6.6.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.6
    https://git.kernel.org/soc/soc/c/594579e42c2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


