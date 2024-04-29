Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DBDC19F53
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 229DEC4AF53; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D3F6C4AF49;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=K1ZjenwUPodIE2R4xK48/1z1kfJSG7OUKCqxw/UlLKQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jmkC6C7QFOkPq0wOOPwNBWGSXr8IC0pijzBK/A9sBVWs3Q+1XD1vtFNu4oiCALFIx
	 9sEsDOa/aoqz4kBdUpdJbeh0ajiJsQM7/LyO7zIwky+TXR4vqSU05ST1KHNcqgQiYx
	 l8x9O+ju+Ydtsf7yplMjAJYBNHfPlufictyp3xELktwt/H4eGewSJrvFjtOmqiqTYY
	 pQ7i9+zNNHrC8Yio2Y4wNfvRY8ylvKfxwZc/LpCXTuQ+nRNHJBOXw+IRj6ddjY2Zik
	 bpVXVUCFaMDFU30lZc6o602DRzXDNy2nm3gWgUobQqBsb/BhA3JX2BKHnrLB/HCVjz
	 NIKuMVLR8SLug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F1E75C54BAA;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888798.20509.8171576517218680015.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:27 +0000
References: <20240427175951.1439887-1-andersson@kernel.org>
In-Reply-To: <20240427175951.1439887-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 27 Apr 2024 12:59:50 -0500 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.10
    https://git.kernel.org/soc/soc/c/1d3454fafbb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


