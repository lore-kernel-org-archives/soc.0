Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1E5C0015E
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5A23C433CD; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88813C433C9;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=mThu6UFNwyuqsOFE0SJITyCuXvWRgBmLBZstWwrXhVk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=k8vHgoVqc8fjlfyNKIlbSOtjyGH1ae6CeJGz6pklq3WSQKTSVzvNa3jxoYKaNFJqH
	 X6uLa+U/gDWrshgoEmNanTbYm5sQrcs2CNacFnFhQzTQ4YlLU3bNrkkKiwxHYNBcu7
	 ZESmbVBcCmbqc1V7AAHkv/sn1OtAU2FwvIWGw155zb6UCxMloKqjDjdegcKKMXcVa7
	 vUp/sytmWLwJjqCVlLjhlmZ2J51s53PzuIslDjKFk6aMiC9JLuzQIwtvqI0S90c5fy
	 3K49U8ia6GDM5Okwh+f8oBZy3v2l6CxeAHL0neZeuVjAm/qpuSXJSVk0a1B7D7cnDe
	 XOOJtDwl7GuVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B118E4D027;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] soc/tegra: Changes for v6.5-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943643.9834.6773706597949326118.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Jun 2023 21:36:15 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] soc/tegra: Changes for v6.5-rc1
    https://git.kernel.org/soc/soc/c/bc889e870e62
  - [GIT,PULL,2/6] firmware: tegra: Changes for v6.5-rc1
    https://git.kernel.org/soc/soc/c/b161ec3d3820
  - [GIT,PULL,3/6] dt-bindings: Changes for v6.5-rc1
    (no matching commit)
  - [GIT,PULL,4/6] memory: tegra: Changes for v6.5-rc1
    https://git.kernel.org/soc/soc/c/095ee35a336d
  - [GIT,PULL,5/6] PCI: tegra: Changes for v6.5-rc1
    https://git.kernel.org/soc/soc/c/09f4406a02ba
  - [GIT,PULL,6/6] arm64: tegra: Device tree changes for v6.5-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


