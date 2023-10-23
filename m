Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08242C25B51
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC880C433CC; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2800C433C8;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=X/6LN0I7GZRI5o30LaCDmUBt6/WpgBOOjaH/A4TX+uM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IRlNai0NT/Zd0v/guTDKNKtPAaNS+4HA8SinigbGEYFo+XKf51KxhlW8xdAFlyXJ7
	 fQLGX7ZezT0iVWOrDaMcrMclFJsrKf4ZaF3TaC+q+endtqer2TAlCp3iMvxN/IZ6lz
	 qE6iwD7XvwI7dVNYKUq36QNKKseiPTWwfBwOmoJ/6pz53GQocuyTKO72h6/W7iBiBU
	 aY5bc2eomByNE/U9otrcF4U1AzMgaj8qTNXH8VJvAWIhkjlVkGKh5mZcBkLXtNAAsv
	 UnADKb3jCM8j1QCCoqgaZSvTXfiyv4DMTQOSQLvoqaJlJ3Ouy6IG00JZvIQmnOgNiM
	 iv+fTR1Zcw+vA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79A9AE4CC1D;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: samsung: second pull for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943049.14534.17987471955272006779.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
References: <20231023165412.529762-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231023165412.529762-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 23 Oct 2023 18:54:12 +0200 you wrote:
> Hi,
> 
> Just one more patch on top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: samsung: second pull for v6.7
    https://git.kernel.org/soc/soc/c/f0bb192440e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


