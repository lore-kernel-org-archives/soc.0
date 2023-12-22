Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6276C47072
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 771AEC4166B; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F1E9C433BA;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=qFysgIOQRMp6UY8+xlQwqfX4p0GvzD5Zy5yt6IdEwlM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UgaC2hnAzMhBOCajzYsrN7W2T/sX4wqaRm3moyF3Dn1mG74UBmalaMPUVUimqDu/X
	 jzJgH0uHDsvvQVtHqWCveMvBLQ2VENx6X3mtKc3AXCBnK+qr2+2rll+Ph2+DBKmaWk
	 cFw9hAhKyMJV/R3KXcFUBMYWq2MdOLY0OGStFKDeIWkEUAB99ctlKvAKa9Cb3MZ4bO
	 7/DlAnVRYWJcwHlK6srMl3W2BLtg/LGRtoFCHkEwTvuO7r1IihzzBgQpcQRANipwsh
	 2F1xcr/hzD4Z6SGoYTkG0Tdw9xXexAHzNOZTSKdlR+cOmZGFwcP9ReMF6QfDOXJUxx
	 7ezejY5XyVvCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33D81DD4EF4;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL RESEND v2] arm64: soc: ZynqMP SoC changes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646720.10550.3474677213334373710.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <CAHTX3dJ=6y=vEgmH7Qqe=6TJZT=D-egKDmLLER4fS0=OHJRGZA@mail.gmail.com>
In-Reply-To: <CAHTX3dJ=6y=vEgmH7Qqe=6TJZT=D-egKDmLLER4fS0=OHJRGZA@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Dec 2023 11:10:48 +0100 you wrote:
> Hi,
> 
> please pull these patches to your tree. I am sending it again as v2 because
> I see origin email in lore here
> https://lore.kernel.org/soc/CAHTX3dJp_dztRCOn+-_OCeb-L6He7Pi2t-K0QeTDACaMs-xfTA@mail.gmail.com/T/#u
> but I can't see it in patchwork.
> I have "patched" Uwe's surname to remove no ascii char and see if that
> goes through. That should be the only
> difference between previous RESEND pull request.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,RESEND,v2] arm64: soc: ZynqMP SoC changes for v6.8
    https://git.kernel.org/soc/soc/c/c55a4983e93f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


