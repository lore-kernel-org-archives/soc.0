Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F99C47DA9
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5A58C116C8; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94DD2C116B4;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=odO5RzFiiiFgVNdVZRey12ZE99TAHyuPYvXMvNxas80=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Bh2vBqj5+NrEEaFE+kjIR1Az3n6ytI0Q6ZGX0LmLVeT2I+y2hWRDW7RH+g35j6lE2
	 YVq2ibHIrjDgXSJh00oj+HfykGojEUySKtuZhHs4IkhfGQPB7hIPm6ibKPAwMwmtf3
	 bHVuDqFJ20lNm1IyE2eZDWglvtoCtSgqQ+GuYUPsVDsTpLTBurIcA0/1q/1w6joRjK
	 WQu6QWtINJprpNOLVfQtDHvOLNU2ACMjYXPtCbV7cTyDFLcjGHcD30f+MwhTddACgo
	 0eYQk3ijqh6P/XxQaHTkKJHmX1ZJbvVg22BvKX8tKq/EtgOpL5spHC0pgeTYspsN4R
	 GoMlrCBGr6qiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 803E4DD4EFA;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE FF-A asynchronous notifications for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646752.10550.3354912698644721742.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231211105249.GA587253@rayden>
In-Reply-To: <20231211105249.GA587253@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Dec 2023 11:52:49 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these patches that enables asynchronous notifications in
> OP-TEE FF-A driver. This pull request is on top of the
> "system_thread_for_v6.8" pull request to avoid a merge conflict.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE FF-A asynchronous notifications for 6.8
    https://git.kernel.org/soc/soc/c/95c1e57a384b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


