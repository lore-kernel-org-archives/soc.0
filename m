Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D39DC54E64
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59CAFC41674; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 434EDC4166D;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=FaQf6NrJp3PSUnO62Tur8iuRdr+FNU1lHJ1Yra1Bw7o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nVg36jBSFDYho26N4GooXblAU+97o0T/UBsn8xRI4utK0/QFsstvl0sCajkHQUxSv
	 nVRi+Dudm5hjbhf9XqBQa2YHKWF93t0vksbriJKLhdhJU0LwuKly8ugAy/myWvsK3f
	 tO52uOuubY9C+//YV1yrvr/NtB8OUDkcV68czxcNvx4LpRo6+4/LopQtC0IdQbARA4
	 y/th/jCLn0cBvVGvnzwuBePWitGzU8kRxw1kSYks/9Nr0/z9aVTvARqorGz21ySw6x
	 mQiA1wyHypNH3kvw/JC1UJd08HHT966tGdy3SZC6oxAcFdVtlKyhcLUp+sC94vW7qm
	 D/RPTTmlyu63w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 31C7BD88F8C;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927520.27833.11492137391000228221.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <b9c60991-65b3-4c80-bf43-b3bb95bea9e4@linaro.org>
In-Reply-To: <b9c60991-65b3-4c80-bf43-b3bb95bea9e4@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Feb 2024 09:40:32 +0100 you wrote:
> Hi,
> 
> Here's a set of fixups for Amlogic ARM DT  for v6.9,
> 
> Neil
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM updates for v6.9
    https://git.kernel.org/soc/soc/c/d80ec24ed8ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


