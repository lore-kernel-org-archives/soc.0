Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2604C47079
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F13CC116B2; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 726E5C43142;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=PeiTjs+WVm1/ixZGBZT64xWiqLO/8s9ZFbsRElWoOsg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FmKqPaDVxtVu6c3JotKYWNecdEZKKu+DtwtOuKbkVUqP/motnYjf24GTR7ab9Fmqy
	 2cv3ItA4nD7tOGoKmno18NTDSNBffiE2b7B3cZXVV6sVO/cxOMeHCNPzRMgh5gR5ct
	 a21KbUd7F5b9dJd4k4qVRbNFcJTSxZ7J6x/qmP2es+pcEgdO9i7Tbl3SPgrU3MG0Jz
	 vOVVTOF7fsBw6MclacH73zo79IHBXeEg3dhotCDYm7+/khTRi3gwP3PNQJawHXcmb2
	 021tSAlZodLI27Fbrof5p9K5MOsxd5LRFjYFbZTo5kJn6bbOr0rWMA+YGhlC6RnGmT
	 30dtiJMw9vtTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 458D2DD4EE0;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] samsung: drivers for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646728.10550.11442453526478136700.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231220084722.22149-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231220084722.22149-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Dec 2023 09:47:21 +0100 you wrote:
> Hi,
> 
> Driver changes needed for Google GS101 SoC, plus usual Samsung SoC driver
> updates.
> 
> This includes topic branch, see explanation in pull-request/tag.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] samsung: drivers for v6.8
    https://git.kernel.org/soc/soc/c/ec5b7be61715
  - [GIT,PULL,2/2] arm64: dts: samsung: DTS for v6.8, part two
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


