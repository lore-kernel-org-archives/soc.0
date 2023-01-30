Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8E6C636D3
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 16:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB108C4339B; Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D58DBC4339C;
	Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675097417;
	bh=lDEUx2OTNES6vXgP6m5v4W0rRpzU4xJBdDVfnLCE+kA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=j4IvzKIdQM0ygVGeUp3n9BUSsIAgWpIRV4x/TLa9M6Q5S84Jb8T/Gy7r7xjS6gRJn
	 zYLwTsampAIJYSuC5Wx9G3OemVMXyjVL1qEL1LjOOuV+SR4rfTvcKv5ghJkvfYH9Yh
	 BBRU/Xn7GauqwQ+MtQ76PO9w3wbgUitamOlGICY4g09j8Unt/VgFcQAv9wIPtmK0sx
	 BWjjkHHdULxDsWzLpdOPrhe3yRbE/1+fKu5mpWOp+9q8ZyvfaI7nr7+UvnpMYtwHWl
	 L1D5AURtJJcW9QhR3vLyhe87Vq1q+sgnIdaFj/zvUaiH3cYvpEmwq4QNLXofFjzbxk
	 uqfH8A1ybX5EQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADBD8E21ED7;
	Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: amd: drop inactive Brijesh Singh
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167509741770.16068.9818790707360460953.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 16:50:17 +0000
References: <20230127105935.99174-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127105935.99174-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 Jan 2023 11:59:35 +0100 you wrote:
> Emails to Brijesh Singh bounce ("550 5.1.10
> RESOLVER.ADR.RecipientNotFound; Recipient not found by SMTP address
> lookup").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - MAINTAINERS: amd: drop inactive Brijesh Singh
    https://git.kernel.org/soc/soc/c/d2591298b9ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


