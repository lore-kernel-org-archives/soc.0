Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EACFC433F5
	for <soc@archiver.kernel.org>; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A011C340F6; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3659CC340F3;
	Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647727211;
	bh=81JDwQ3MPhQBXUVxoGYHv7HkM1aayAEPmKJ3klsWg04=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LeqI7WpmpYM3rOkIC2Pc1SsTr84tkNWOV74icCo58mHxNjjjzYaof0x08waOiVVFw
	 ezCVC8GNzrKvoOn/GM20ewxzMCopZefM05YBV5R9FKPxKXe+emfAgmFyo6YOFgDS9i
	 LLX1A1BnlcpuzBtUiy0r3PDZj3XMmzwJ0bFn6+O4fb6+OvxB4VWEaGuQ5z7Stxj5Bh
	 tTJ625Ho+8XtxMSykkIjw5mF44zAQFHOLsQNlp0v1G9i+TK4jx1TZLdb3Z0YyS1Bnw
	 qicr+mRH8tQVp0BYJcsXu4Pgr7jZ6XqWOXnsLqQzw0Ql58fNQMDN/8lw+i7q0VtNk4
	 fTEsjnkrSsrGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17959F0383F;
	Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: n5x: drop invalid property and fix edac node name
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164772721109.21632.6944599694851201175.git-patchwork-notify@kernel.org>
Date: Sat, 19 Mar 2022 22:00:11 +0000
References: <20220318121044.108750-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220318121044.108750-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Mar 2022 13:10:44 +0100 you wrote:
> The intel,sysmgr-syscon in EDAC/memory controller node is not a
> recognized and documented property, so drop it to fix error:
> 
>   sdr_edac@f87f8000: 'intel,sysmgr-syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Align also the node name with Devicetree specification (generic, not
> specific, and EDAC is purely Linux term).
> 
> [...]

Here is the summary with links:
  - arm64: dts: n5x: drop invalid property and fix edac node name
    https://git.kernel.org/soc/soc/c/bcea9aaa4373

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


