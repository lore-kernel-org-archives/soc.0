Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63443CCA487
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54CA5C341D2; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FBF5C341D6;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=U5VlzAkqwSrEcEH+9WtGCxVILfxfzQZ7G5/F0uJf7ps=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hsL/O+WS+aViZg1DP24RC+VpOgQ1buCD+YKuJPE00zH94OQ0XoI/Om3ibpM6E0vKb
	 ACO2+qxGHJofnuWeLTZAvlMrzEt/hYv5OHNWs2gncLLFgeXDYXvz2wRXsBgnG2mC+E
	 4jhqmqy0ywjjLC+YuLo+uDp82QS+etjOa/fP/8VeMeoygTOU2YUJus/t1W4+tHpA9d
	 Uc6rk5XnSr9TsIhrnrWB774hytb4VWSVEq/GHrdWd3ZhUcKX5IJCGnVF0ShhBby6uK
	 QjcN8eWbZXqF86KNJsan2eIC2VTDm6Sna1BpIUga9JYyqtCAUVfhAIK38mFvRE5f8B
	 Zw3NfgqPsACXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17F84E49BB8;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: renesas: adjust whitespace around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809709.26141.12659922770749351473.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:37 +0000
References: <20220526204231.832090-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204231.832090-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Geert Uytterhoeven <geert+renesas@glider.be>:

On Thu, 26 May 2022 22:42:31 +0200 you wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - arm64: dts: renesas: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/76f9a5615202

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


