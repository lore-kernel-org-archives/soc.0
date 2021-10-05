Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60141C433EF
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 46B7F61507; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3080E613D5;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=+VQ8T6JTZzKHcjnoWgal6MgQfMeJqC66GvnKC7AlwFs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NszCdYfEA9iNzi85t6zr/sjAffnPwdlWt/YNu0d49P/uS1xcVAlkveRLpFwDZxSwT
	 x9xr/Hl/Q/wL9vHZlb7KRZcqpBO2qvtEGjWQWJ+PjpWAwJROrW/tanx3O9188et7fC
	 qvL3w8DPR9ytBml3M+UzdUKKI6KHWs2RBozxiBJQTF9P/Xgp9q4HoQX2OhvHZvSoda
	 PY/1+TNdGipjk3T5vRIgQqCUhKjbq4I2Pw0/gjjaiuvt3epGlTSak7CGlCovbQ/OW3
	 yCol6+01vmia1sqpQxEA+0ZASxDmiu/N4h9+xj/gmLCzZLvnto8lHYVWAtjxfy8ETY
	 I/fico7wK0qpw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2799C609D8;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add Vignesh to TI K3 platform maintainership
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180915.2242.529818835563418850.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20210915121308.26795-1-nm@ti.com>
In-Reply-To: <20210915121308.26795-1-nm@ti.com>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 15 Sep 2021 07:13:08 -0500 you wrote:
> Add Vignesh to TI K3 platform maintainership. We will rotate roles for
> each kernel version to help spread the work load a little better.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - MAINTAINERS: Add Vignesh to TI K3 platform maintainership
    https://git.kernel.org/soc/soc/c/dd6a2ed801db

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


