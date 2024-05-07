Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB008C3DA40
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9CB7DC4DDE5; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85461C3277B;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=ldZcHZMMKQTey7iNLP5YJ/H5dnzOCJv0jv3AFybd4lQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CFjh9s9OW5gUaCPHnOMMjV6zXpyQ/QYAyLOyPr0aRVkHiJMyEfRqUMYvMGR2l+rxn
	 nju3CaHUf5J0lwKlCxxuHQyx/3gwoMhRx9xy4pnuPbEBTqz/Q7yvbShYUKUTpHaLPD
	 lNzu5u+k7rEgLI6nLUkiHWtBaaR1ks0YLu5EXFYME93fW2TP6i6NpRZ7Ge11iAwTgz
	 A72L/g/5Vsrm1NfirifC2U6iGJE1l3OjTdGMuYnl1iiheh9yV39C3LlaZbiRO4IdS9
	 o6fSjv1SXth3BseVTtQYLqzKlXvvsEU2sF3igaJjE8K2S3xfKUn3LRQfbzmRpdas3G
	 iBNn4QqKRJLUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6DF96C3276C;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic defconfig update for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483944.24942.14319033160025468454.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <13bf8bc4-1cb7-4b94-8c98-9d1cdae5e1f8@linaro.org>
In-Reply-To: <13bf8bc4-1cb7-4b94-8c98-9d1cdae5e1f8@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 3 May 2024 10:34:20 +0200 you wrote:
> Hi,
> 
> Here's a simple Amlogic Defconfig changeset for v6.10 enabling the
> Khadas TS050 panel driver as module.
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic defconfig update for v6.10
    https://git.kernel.org/soc/soc/c/b633c162e08f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


