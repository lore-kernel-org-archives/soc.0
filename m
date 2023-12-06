Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D52C10F07
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF208C433AB; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9542C433CC;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879541;
	bh=bS/Hr6NR4Xs5qYcZ9BT67ekcZ3LVVYcIqWfDq1MZOJk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DfHgIV7PtaZA1zVnrqs+Knt4rfZDIOKwlzD4GlVAQ8rlt8E2YOWXgEM2wWqDiu8+U
	 5TpRjCBtBoq0nxxft0pJelP08oIZaYuDn18xzBE0iVMWJQIW3FsNPlmqYVVW/eDllQ
	 eaf/a1YlKQ7r5sFilw9IQJYNTfvkP9hNrbcA6wufgJP69YdgSyZKZrw/bO8AOz9ZJC
	 AC55+ELPcf5AxXs3p7gDcij1KTlI42UHuWo1aM7y9RzXqf5Wb3m1DwiNnlHqAkZS5p
	 rkYrFJ0yBMaohh0I9j3zjiMUVkV+u3qHQyCrT/lQ6n7Fq2Wop1DnLe9y0L19XNNxhL
	 C0u0Q+V+OZD6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84767C595C5;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 17/36] pinctrl: spear: use new pinctrl GPIO helpers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170187954153.26038.9163103575267932967.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:19:01 +0000
References: <20231003145114.21637-18-brgl@bgdev.pl>
In-Reply-To: <20231003145114.21637-18-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Bartosz Golaszewski <bartosz.golaszewski@linaro.org>:

On Tue,  3 Oct 2023 16:50:55 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace the pinctrl helpers taking the global GPIO number as argument
> with the improved variants that instead take a pointer to the GPIO chip
> and the controller-relative offset.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [17/36] pinctrl: spear: use new pinctrl GPIO helpers
    https://git.kernel.org/soc/soc/c/a3305049053a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


