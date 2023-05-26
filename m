Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6B4C7EE33
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2CB19C433B3; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14B6CC433A4;
	Fri, 26 May 2023 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685101828;
	bh=qc7Lxz2s2fUFUrdjgDoeTU/+49A04FlprDg4CPXR9C0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NW3XIBLoNWgj1M+oKjNJF5//Z/cRlTf+H+weUzj5+6XBL+8QXMygaY4q4Z3xraGhD
	 DOSYVzemRrAzeLPTVoLAtMvT5L6HqI3WNKj0iNal+Jv+dvOt5YymmMjbAUFQ9D2vx5
	 n470Fj9VZcNe+4lqRLlQ5ECqv89k5allmJF5Clieo4HIC2Zk900bblJH2N2gRGyjfE
	 QbGDKfeVy/4fLCELn51VvpbTXQCeUCIgJFwMIXdEQCe62OEJ9QnojrQfKmjcXzZtAC
	 y7RMs0TauKeEO+pEcmF4q1uyOwtRhZ01sEUv1upe/01ZZzfreX+HjnIP9sHnB24vPB
	 QdpKjxFP1ZRkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0380CE22B06;
	Fri, 26 May 2023 11:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168510182800.28560.13391294049505767823.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 11:50:28 +0000
References: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  8 May 2023 06:04:33 +0200 you wrote:
> Commit 0d297df03890 ("ARM: s3c: simplify platform code") removes the line
> in Makefile.s3c64xx to configure the inclusion of setup-ide-s3c64xx.c,
> with CONFIG_S3C64XX_SETUP_IDE. So, since then, config S3C64XX_SETUP_IDE has
> no effect and any further purpose.
> 
> Remove the obsolete config S3C64XX_SETUP_IDE.
> 
> [...]

Here is the summary with links:
  - ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
    https://git.kernel.org/soc/soc/c/5038e62d4b4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


