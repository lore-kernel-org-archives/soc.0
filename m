Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63149329F3F
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946609; cv=none; b=omxGWhbNWsA2dc5TVd7vzMKe5CsT3c9MdjGqWOJr54yE0ak5B4PGOY2+DxS5HaDSshxfaAaQM6OVAYw0UVuvfEmZBOMx9w9VfpGgve7t+/8IRF6qaGRuuqv/HkALx4/pnL/u+1CIg130zk128udmBH+n0dUtnHrpaSgDB4A00qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946609; c=relaxed/simple;
	bh=lyO1BpCf45fGoKzP1Od4QMWEmGBqX1VCoqbMpQoZhck=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TOwfhVT+v/gQFmkyIh5WJQAiUUZp3Cmah5TtM71zK1B8sf2DTA6dVf9Lc/VOMt5ebdA227Ws9lfueR7cvW2+Tuedo/4ZQNQcu9ZhAKYq0sY90aj+I5r8LvbJAAU/mA89FvTj+HOM/5myPucGPfNVjp0lDBJYARJ6ucpN+Q2kGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhqYKAad; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhqYKAad"
Received: by smtp.kernel.org (Postfix)
	id 4FC66C4CEF5; Mon, 15 Sep 2025 14:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3644FC4CEF9;
	Mon, 15 Sep 2025 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946609;
	bh=lyO1BpCf45fGoKzP1Od4QMWEmGBqX1VCoqbMpQoZhck=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dhqYKAadf1h+VWxRpY78gLpEuG7GE9Rse8WDdiYUzBja+7a/vOIR5pn2CZLrQ4VBO
	 F4QF4WUv9zW1vGaXkL0Tvh5Hbrw9VpABauljfrFwizMDyWbfAn+Yzb+xpZx0uTzJAa
	 yQ4kqudiLu2wI1831Zmj6XhMuLT9R3zUUTKZTyEF+qpsJvDsMkT6TwDsRtWJ3GQGmN
	 PXWS7n9qh/43W/DXRujfDIu7jWNKE7Svthj9zD0iP4JcnIikrmOIJA/w1LeX+lsBih
	 ApfFxVpA/I1tWZu/RlpMaMr9ivMxgd/SlOm6inmAiRRaI+3tNfxKKElvj4/K2+Cpj7
	 TsQZOZ9+nf0vQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF0E39D0C18;
	Mon, 15 Sep 2025 14:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794661075.4799.2788394532804705373.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:10 +0000
References: <20250915101341.2987516-1-sudeep.holla@arm.com>
In-Reply-To: <20250915101341.2987516-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Sep 2025 11:13:41 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.18
    https://git.kernel.org/soc/soc/c/bc43efa13708

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


