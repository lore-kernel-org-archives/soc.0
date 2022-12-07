Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3753C63708
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73FD1C433D6; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52B72C43470;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670448029;
	bh=mx14nShK8e8eYbVo71t6P4vkSBlenXOeAMAzKoXu/CQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Vd4N6XHlxqOVJjXK0iEo9m241jrQs3AV8iOMiN5hMSTaQTxyD2aj6TA3SD8UhZfVh
	 LN6hNwnPr+H8FM7+I+0AxiP/WPmaeDD6fKlIepfjDyeVtQzS1m6hTLN8FhLN3q23OE
	 89DBjRh+Benql/HjWwHxjEuGJuhrn2R7C99pDVj1byl2Se+3eMSAVOb/VQ0abEJSCl
	 pki7gW0Pdbl6kdg721wlsxsjFJNyUFJ8ExRfjZDANh/y9MJhjI84bB5PcXSDpUPE0A
	 cvDOlWSj18WVe47LoIJSgA8kowfOJPjzaUUlNhmk/igLDmYZQcBo+hanUFV/vdDhkF
	 9Tr38DGGPmLFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 19700E29F38;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM64 defconfig updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167044802910.32577.14545368426321935770.git-patchwork-notify@kernel.org>
Date: Wed, 07 Dec 2022 21:20:29 +0000
References: <20221207154339.3234068-1-andersson@kernel.org>
In-Reply-To: <20221207154339.3234068-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  7 Dec 2022 09:43:39 -0600 you wrote:
> The following changes since commit c03fa428ac6e439afa1d437776365a632ce24262:
> 
>   arm64: defconfig: build-in Qualcomm SC7180 and SM8450 interconnects (2022-11-05 22:35:12 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.2-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM64 defconfig updates for 6.2
    https://git.kernel.org/soc/soc/c/93b8c91e4cdb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


