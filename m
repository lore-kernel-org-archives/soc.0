Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804A5C001E0
	for <soc@archiver.kernel.org>; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D2B0C433D9; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FB3BC433C9;
	Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690576824;
	bh=IDr1ISwFHZh6h0wJR+kPQAEsd4aoftfOBYySnUH+B3g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nnI/upriQOoS8RII6FE4ddVxvyPfOiDhbdZ2yvfaH2YabMMZTVf8w7zlEzzuRXjyN
	 IzkLRqiPomZbjFebGqnAJsh/WSrpaOXiDFkl51QKbwLfOXCaCJQjbPgvp4Oynbjcbp
	 KH4mrOdt2IuIJ1qmJw7wYhDLzjxt5fwHHKhxx6P+LmmXo5Rz9BPoc1RR7iB82vGsBE
	 0Ykw8z9sXo+xBhPbfWn3k7DZDG4g3w+DiSpBMlwLfzsOr6Ux/+AGPYT5k5YOUciiDR
	 66kuWJKrNOnhF5+lBI136aSY+i0R1dpz43QjBj8X0T64tzJIHAj63bJhqJoI+NUMub
	 Hp4zBYOESfFwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0FA16C64459;
	Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas fixes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169057682406.20429.10295776446524009936.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jul 2023 20:40:24 +0000
References: <cover.1690463347.git.geert+renesas@glider.be>
In-Reply-To: <cover.1690463347.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Jul 2023 15:13:09 +0200 you wrote:
> Hi soc folks,
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas fixes for v6.5
    https://git.kernel.org/soc/soc/c/77489a4eb76c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


