Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D83CDB47E
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBAC1C433CD; Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3896C433C9;
	Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643633;
	bh=bVAtFCoLnH7P7PcqMwgE8U3rk62i/QQKtk+vj/Vd/sQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=d80Iu5ZzsDAynZsQFBBcvZy3TgyWQKX9vbYKg6vqMqQaqof9W8XvuKhcW9rkiFkIO
	 KtXhSgsS7KPCBthfqUpQmNYysmklsGJVfeSlHvUkXKsnmRjwJ6/dAgQvJrzM1c47jO
	 ZPQbzb0reB6PdD/LLgQPClZgpjDSoyJwH6e5qcKRbV7xgN9R4SJ3AeScTQYmUkkAKj
	 Vq6zZKbU4aZrm16jdnqqKBclRQ7T5Wl4dfZYrYUAK33gqDEmp94FWb5QdQoO8kQvR5
	 bqavN3O0rZiqKireBJSPT2YCdbmDMdrgNvkXLhSeCDswVILl2suQCcPWWB7vzLX2Fz
	 7RdpCAZbTcZIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE978C04DD9;
	Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169764363377.8197.13230080672129347667.git-patchwork-notify@kernel.org>
Date: Wed, 18 Oct 2023 15:40:33 +0000
References: <20231015204014.855672-1-andersson@kernel.org>
In-Reply-To: <20231015204014.855672-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 13:40:13 -0700 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.7
    https://git.kernel.org/soc/soc/c/57e06f8c1f94

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


