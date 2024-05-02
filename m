Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AF7C04FFE
	for <soc@archiver.kernel.org>; Thu,  2 May 2024 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19075C4AF1D; Thu,  2 May 2024 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 033F5C4AF18;
	Thu,  2 May 2024 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714659038;
	bh=POp3YTy3R6MuX1zrV2I71VY50w/HHSkuRkyujSj/aEg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Zorfw107LRWckBtevEJ0FV77z/VofqWoGOkX18BM3rNNev86fzDBSYcSgb6Daf3Ua
	 Umusp9keqGuJRsKrestNdCldszn4cCUIsJe5wpxIBOs0nKlSOndiuI6Ooq74qpCUqb
	 13fU9od0SyEDFI9uxmOGphCDP0hCos1x5lDGqfPgSIRu9YPX65HQCUTxFUqtTJL4ip
	 ZsB+KCKE1Mt3Df+8f+/wD90qRimA8OhCzEncJF14W29dIrjC5tPXQnJcgCikQMuVst
	 reyr2iUOmxuuFh1V073u9J3eMWWr5MVNuQn7xrwDxMjbNa/vfpVXZo9LXJmEMuMOMZ
	 Ikg+aNZtJDlDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE884C43612;
	Thu,  2 May 2024 14:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171465903790.21409.14392428908934301468.git-patchwork-notify@kernel.org>
Date: Thu, 02 May 2024 14:10:37 +0000
References: <MA0P287MB2822CA2DE757787D6EA3B1F8FE192@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822CA2DE757787D6EA3B1F8FE192@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 1 May 2024 09:31:27 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt changes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.10
    https://git.kernel.org/soc/soc/c/0ea32f50b36f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


