Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713BCC7EE32
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4102FC433AA; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B7D0C433A7;
	Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677505818;
	bh=S8HjrbzxbJqoJ4VMbW4bbxj3DvHVS1rUP9aDmcxXoEc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bJKKKmfR7VmH8P2QuYLGSp16q4P+FuigqqfKjAIxiDaBt7jbdvzvg3MgXJCq3zckd
	 lRhe9d9EJ8iQA9ffpBD//DAEZ5OLvq95tZYf0bFocj5X8C2qYPMGz4GDNANnSHzW3x
	 enwa0XhpnILZVbMVUZSzHZNUEKHPX5oDJtiN+1Us8BnlROxvRg3dbQG1SKQenlkzq5
	 XVmzY4ET0Fvj4nFOHRm0a+zuzvGQrhx4S9Q137OBJpGJzlPNRXsiQe7A+2drDAXjcf
	 5HTzRxEaZv755hsMdZj0/IpOIMPr+H+6lcFnGRqWIikvj0XnVF8AbvprnzysAhXxuH
	 Csac5f5WssRpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 021F1E524D2;
	Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] fixes: ARM: dts: samsung: Fixes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167750581800.1456.12852102834428540528.git-patchwork-notify@kernel.org>
Date: Mon, 27 Feb 2023 13:50:18 +0000
References: <20230221095337.9453-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221095337.9453-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 21 Feb 2023 10:53:37 +0100 you wrote:
> Hi,
> 
> Fixes for ciritical issue broken around v6.1-rc1.  Actually the issue (DTS
> mistake) existed before, but in v6.1-rc1 it started to be visible and affect
> thermal zones.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] fixes: ARM: dts: samsung: Fixes for v6.3
    https://git.kernel.org/soc/soc/c/9f79762ef8d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


