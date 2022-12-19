Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B30AC46467
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5BC4C4339B; Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3CBBC433EF;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465633;
	bh=ACJjS+Hl6ZIF010OBmXexSWy32DAUOkpjKkdzQo8fJ8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u+A65VqDgBXgeCnU+JPwsktllUr9PCE+BcxXqBTMBYbfoNyuPUUHlq5BirwyRWhWE
	 UIAgNTM0aHDUisMcY6cH7ft0V0MM9CojTxaJaGibR7kGx35IuOV53tPIzAWVqOUYho
	 VvOB1Wu+XTD9b6c5VNYBVDQhTVZjbX55n8B0fikfwuTi7Pqa2oSFZZaencu1U71vw5
	 HLgqlllwY/52Pp2bXQtqyZUhhGR1syaPSAJE1UAP5iZMVXqitMecZE3OYOPZVZLme8
	 ta8SeclCKbWNVPaLEr6fmDwOrIv+dSZez3VBT0LeT896lUsyTsLnk6MryYfif+bmXw
	 RFBQNPDF7HrMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C663E21EEE;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: mediatek: fixes for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146563357.24111.9839315829423594932.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:33 +0000
References: <29c8b913-53cf-096f-fe44-832ceaeac116@suse.com>
In-Reply-To: <29c8b913-53cf-096f-fe44-832ceaeac116@suse.com>
To: Matthias Brugger <mbrugger@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Dec 2022 12:09:03 +0100 you wrote:
> Hi Arnd and Olof,
> 
> Please have a look at the following fix for v6.1
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: mediatek: fixes for v6.1
    https://git.kernel.org/soc/soc/c/6f85602d5fde

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


