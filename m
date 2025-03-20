Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FA322155C
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 17:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490609; cv=none; b=RfW779nreai3zjKTXYguNpK9uBhtnosqWsXV3rdEv/JKXrspNp7Pj4gU0Fh0q7pCFglGeWcafVi4DlJmrsd7T9gf1t0bVkNeKwBQ+zmabWeOMItcUnQNpjKxg9si3saivwuPJ596CxsXAYdFNXn9pFgR/iLw9fhgXjY55SgjPxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490609; c=relaxed/simple;
	bh=mdnFpd3JT/MdY7M5BdRR+At7g2x0+G/M1gcfe1IxEUs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VWw4B5m3kgWD3RoZs1bTeDVONFD4oDwQQbpAOZrjH9SSNTl6cqjYlr7/kWiOOiQQBYzHlb0OVd6oixmppQJWUoNgYEL4osxFV18kVTf1mFXUN6EAyAIv+3GG0J+qihplffvy+RiOC46Ymf4bHhvj7AvmDGx9L6wOPCTV0g1UC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOm+fzkT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOm+fzkT"
Received: by smtp.kernel.org (Postfix)
	id 6CAD5C4CEE7; Thu, 20 Mar 2025 17:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5708BC4CEDD;
	Thu, 20 Mar 2025 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742490609;
	bh=mdnFpd3JT/MdY7M5BdRR+At7g2x0+G/M1gcfe1IxEUs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VOm+fzkTPTzRJ8GS+YnYAHsk3tjsm50X9WE1n7NaLWb/7RrobrNBL+YGFi9NG8/pk
	 HrDSJL+fpptM3XzWkGvqm0Wd+C1AUPX5QtYb931QqWU3hzc/FW0OxJB8ppJyJmm47I
	 ZOGDpeVmp60fZy3cIe5jeyHRb44gbQxQ2cuSpK3zvBEwLbcMxI8jCDDyZKdHw9Ixbv
	 E5oZ8u0DJVQZS3lIjkPRABfsKSqwUmqy2jDERCKATNUtfOGuoAxvRINGgbQNBI+gr7
	 q4LmuFVgT3JHk87DVK5RDMCFV7RiUSBsjuWNmKXprwWeAwarVFQfACHmenR9oo0NiU
	 gShEA7JjRLgLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DF63806654;
	Thu, 20 Mar 2025 17:10:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] amlogic ARM64 DT updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174249064500.1843567.2220171915519940414.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 17:10:45 +0000
References: <f6fb1b2b-955d-4271-b772-0a75fdba1e48@linaro.org>
In-Reply-To: <f6fb1b2b-955d-4271-b772-0a75fdba1e48@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 20 Mar 2025 09:42:46 +0100 you wrote:
> Hi,
> 
> Here's a changeset for Amlogic ARM64 DT, switching to the new PWM bindings
> which has been in -next for the last 3 months and the driver was designed to
> fully support the old and new bindings, and finally adding gpio_intc
> node for Amlogic A4 & A5 SoCs.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] amlogic ARM64 DT updates for v6.15
    https://git.kernel.org/soc/soc/c/519b8dfd8a5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


