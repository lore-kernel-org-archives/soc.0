Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6E9CD5BCB
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE638C4CEC7; Thu,  5 Sep 2024 15:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D86C4CEC3;
	Thu,  5 Sep 2024 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550836;
	bh=x9wAoDFGbcn2o0plwBq+CWlu6e7zHoO7RKiWa3zsv1M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Q007RNJsMjnhQ6ZsqJ43bJvyuiCcN5YHw9MpY9qBNe6JH+GgHDESppN+kiHxlTFbp
	 96JnCtfYspABlWj6DMifF819K1Y5jR9j8dVjQ2QK+K8c4YJM5f9+EDqYaF5C7/sAt+
	 NTd/UBJMvFZQS6NrwnPahBi5tzm/oKHbP1a99mkCXHqH5Lr91pAVwcvtK7JEdmw8bg
	 81lswS43r312/noefpxdjxjtws6Ss7e0UshVm+PekotrySmW1C8gV5nWYjS2EljjXA
	 GdLG3obqJsGgDpkKTiESJuulmxFIYI0IjePd7ETQpPK6C9SOuymZQBI0jdfgumSpBA
	 DDcm6KzNnf5xQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1303806651;
	Thu,  5 Sep 2024 15:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555083748.1737985.7748775527730122327.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:37 +0000
References: <20240904193042.15118-1-andersson@kernel.org>
In-Reply-To: <20240904193042.15118-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 Sep 2024 14:30:41 -0500 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.12
    https://git.kernel.org/soc/soc/c/6d67480404db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


