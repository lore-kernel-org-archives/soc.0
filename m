Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A46CCA485
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 399C3C341D8; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2145EC3411E;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=20JkYFSh9ttzNZTrLRtOGtDnGtdC4y2EEHg56u4eq/c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CvE5uvcuNVPcFC+XN0fBz1JxWeHX49qB0x7G4TmgxSq0eo3HPthNxnwk0SsqRM46I
	 EX5LKosDpsIgfTZb4KdWyLZPQdkzXRDU5qs56QovenQ6AXsaZUTn7PdrZLoQUEqxyR
	 XKHDBUrW0xk5aNKjBxU/YBc+TUN7VSekmlhdjL6m73j9Zykw3RhiRBd9eItrLr7K/l
	 lXhF7HdWhFTi8/UaEp17QLViSdXjTddpFouk9wnANYm3+X3nwYAIjLb+sVDGtj98Fq
	 Jpm0+cJAXrvJpywM1zFsAXRHriT7K8UcySDfGOOxRoakIwJEgHy6qhttKo+qpDl8ar
	 ObWdYGSJzwFjQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 077FCE49FA2;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: spear: adjust whitespace around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809702.26141.2113523961042286336.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:37 +0000
References: <20220526203815.831383-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526203815.831383-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Thu, 26 May 2022 22:38:15 +0200 you wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - ARM: dts: spear: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/194f47c31ab6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


