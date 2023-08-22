Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DBBEE49B4
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64644C43140; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D4EBC433BB;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=j+ETsBtA/qXLpJICMu6qSucAVLjajMSbgiWasi/8ooM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=M3KkN3vtNc9264722SdV+W2WsFvvd7GBo0ARgxLc/kIj0ffmhylcO+Fm44cjsCisV
	 6afBnrbusWVQxp7uTHbdYidQuaLA7iL2C5EIMTcm3v2/RPyBadhkaopPsNrRTZ+meE
	 7wkVq/foco2/SJP5iw7doSzNXs51HN/Lfa49DX9YKktbhP6pXl37g5v95NS/nFDs9N
	 ZMXIiZ8KFX7ijLWwV1rKR1nSq5CRW9lN2IoIZ9tdXcTyJ1ho3ZbBcOLKecnWqgz5/P
	 JFilQAh6jDM9+V5IC0JSJeO1Um+vhPJLPEWND7Y1uPb5iW7AFlWu0w/8yBruQsvEA+
	 w9I0GeE59w7SA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3AD61E21EEB;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.6-pt2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147623.32531.10403709456966586573.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <20230819-unwieldy-railing-9bba2b176aa7@spud>
In-Reply-To: <20230819-unwieldy-railing-9bba2b176aa7@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 19 Aug 2023 10:00:34 +0100 you wrote:
> Hey Arnd,
> 
> If it's not too late, could you please take this part 2? There's not too
> much in here, mainly another minimal th1520-based devicetree for the
> BeagleV Ahead.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.6-pt2
    https://git.kernel.org/soc/soc/c/ecd2dc2f3435

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


