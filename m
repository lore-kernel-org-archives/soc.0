Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8C0C46467
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4186DC43151; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B3B2C4314A;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=BytmKbVTcXZ3pCDUmnqv7E3hwbt2eo40KYDdIu3Df6I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hfCmHilGbLDa6gs1VAQBICmWsaE9DNZ3JSGzAXFDFQxpK/kO5nP/eVdS2IjVgWJdE
	 ot3AxXwFfCO2mO0udrtelbMzpaS8VxSEg7md+VRodNaeJ8nvR82NQ15fs/A2ovKTDy
	 b4cFizyO9ZxBOyCAht4W1fZspxb31B+MMoj8MvNRdkWuTspqH9HXqod2Xag2hZ86uf
	 fj21Gb2syuH4SftpJSWDsq2jdwEn2RPl7PZVzbgrQUZ5OnLB9JM6BRMEB2ZLwRNiSR
	 uLwRgcAk5Vb4m0HMGGoMObgXZaKbTNHKVzhgfL8bQRj2qvjOZZW3a+hI2jxgUwvvr6
	 YpnkRRGEZzZ5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C3BAE29F54;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] defconfig: mediatek updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482404.7332.2941744743272043756.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:00:24 +0000
References: <610edfca-0a3a-fd41-5208-71978866be4f@gmail.com>
In-Reply-To: <610edfca-0a3a-fd41-5208-71978866be4f@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 19:48:57 +0100 you wrote:
> Hi Olof and Arnd,
> 
> Please have a look on the only patch for defconfig. We basically enable drivers
> needed to support MT8183 based Chromebooks.
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] defconfig: mediatek updates for v6.2
    https://git.kernel.org/soc/soc/c/58e1a96d2845

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


