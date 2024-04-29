Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F105C3DA42
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D358C4AF67; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47FCBC4AF65;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=D69vITIIWiJqBDsOflsrFMBjZTMpIKhVXfzOdcoty5c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Aonh9rKRwk7K3jeKegJH2vwyItwlrCTC6+4cmBSRu7R6qmkZ7BPqZ1lMz7NmGgj1K
	 6GwLCncxN5HwTAtnUciOu8abQpKq2PvOW+Jlub8mJgwq/84ypJ++f9Ry0pca2vptqS
	 AEZXcwph7Urd/9cHuiQyTJ6v9ZRSAcjync4DF+s8wIsphS+Gd88XbtWfHelZeKDojX
	 r2DmWwhnkstyW7RLtSxpQTZehfY72gyC6f/PoWhRcgyGWiaoliaRusJcJCUMDHowBC
	 L5zoS7ETVQOsS8TjY67ZYLhIFse58CxoSVUzWLcjUjlzparrgWJYlSL7QBqYjQ8Qfc
	 IhdQx8u/QT8cQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3C592E2D48A;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree changes for omaps for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888824.20509.11013684223423014992.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <pull-1714020191-304166@atomide.com>
In-Reply-To: <pull-1714020191-304166@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 07:43:36 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree changes for omaps for v6.10
    https://git.kernel.org/soc/soc/c/e3edc3c8d8b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


