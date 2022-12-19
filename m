Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BE9C46467
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE0F4C43392; Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9825EC433D2;
	Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465642;
	bh=+sC6t6SBTQNB+xUsbpx6fcXIgDrM/wF04JGCi3uyyk4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=J7wYlPFYqNBhfVrj+7m7Bjh0Oi8Zv29Qx+E86Rs+eaPfMebncaGHL5Me6V8hRh6cu
	 DCmLVF8U2SslduhTgZ6OOhic9d9zJb4waOr2IBLOSSpuJlxl5nHEg9LgRELBWWDKik
	 FAZamvEF2tUkAojK3JCQdTyy0NI5n+syBgZT99urtCtsPh7cHfZrU7HwNNbqtQG5Fj
	 yNwJP+xqscIHoszeGb3b/cr1DHCi3buAWPxt87F4NtkSuHWpz/yzwMqy7haUP4rnsl
	 9lcSUgSzzrh3pVnUuWcqj7OGUzRyMl0yicorh6TGy8rr6OSh8tMFaKi5V6encFT8rT
	 MHc4QNS3VV4Jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F550E21EF8;
	Mon, 19 Dec 2022 16:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: fixes for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146564251.24111.17390492346269644977.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:42 +0000
References: <af4c45ce-a150-438f-dab4-e47b120c32c4@suse.com>
In-Reply-To: <af4c45ce-a150-438f-dab4-e47b120c32c4@suse.com>
To: Matthias Brugger <mbrugger@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Dec 2022 12:07:19 +0100 you wrote:
> Hi Olof and Arnd,
> 
> Please pull the following fixes for v6.1.
> 
> Thanks,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: fixes for v6.1
    https://git.kernel.org/soc/soc/c/b9cb6be06b56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


