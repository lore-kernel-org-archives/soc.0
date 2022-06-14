Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574E0CCA47B
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BA9FC385A2; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25C9AC341C5;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655239034;
	bh=4a5AfNjirvhfkjtV/xRl55F5AvhZakiqIeiBW9zbHJg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=E6G1vfVyL93n9UWq9xpQXlWH0tePwaW/mUfyF0zWmK5SzQcc2c0yqu241GnVuzV2Z
	 O8/NzXjvQeBYt/15DnkMNOuKAIVoyVDLzUBCux37DjDMk7mnV17G1WjLeyOMoZLgbv
	 g4ACM95OYL1pru/794bfKIjvngZ5P1Nb/Zid5MbKLDBVI1FGSm7fKEE75hklRMb5j9
	 M78GmVUGs2Z6lFjmyi93bKVNhdUf6NGrkjuKo2BQVGTCykCRMjisEiHbkszxjn28cm
	 E8W7D2EqLvkBzu1THGOzIwlVCTwXuutzfCiJJPFYEIAW/5euaNZ2oLXSjYF4v2VUpK
	 fhzf8GLxKMh3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0484CE73856;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: multiplatform changes, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523903401.29335.5084053030034831467.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:37:14 +0000
References: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 2 Jun 2022 23:34:17 +0200 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-multiplatform-5.19-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] ARM: multiplatform changes, part 2
    https://git.kernel.org/soc/soc/c/96479c09803b
  - [GIT,PULL,2/2] ARM: SoC changes, part 2
    https://git.kernel.org/soc/soc/c/09a018176ba2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


