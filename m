Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478ADC3065D
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 118F6C4AF0F; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9837C32786;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719609650;
	bh=Sle18la5LpkkKUxP3vGq5xB8N6T31AebYh36voEYN5s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LTQ25F5+UxN1LT6Pdf0uTvgMsvNT9/1hLgYyAEXu0HUWnNJNhAsIb4fbkA5t6CtJK
	 zwdHDztkn4NeDItBk0R3Q6HxhfA7EcDwmTXoF1c0GHRGB9BodqElgWEr4UONwdjC9k
	 2W7MxZN4R9+Tp4Z0sWEcjLNTqM1KEsOm4sD1WCOzLLSH9dy2AerTg58Ys342Mjh7DU
	 JfxuktVvDjFG9NsHM+oicO6PJCSn1RQQCohVOnLmlpsN/1IjjravBeK6QmQcDv/sru
	 grT28K5NEHw1RaQScw3YMV2bqvjTaR4hD0F1yP73HdCo8wJS9kN2AjeBokoYWxg+/Z
	 uIKuU0G6HKLlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6B43C4332E;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: vexpress: Updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171960964987.14447.512223018763618499.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jun 2024 21:20:49 +0000
References: <20240620093924.375244-4-sudeep.holla@arm.com>
In-Reply-To: <20240620093924.375244-4-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 20 Jun 2024 10:39:20 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: vexpress: Updates for v6.11
    https://git.kernel.org/soc/soc/c/0dabf24cf4af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


