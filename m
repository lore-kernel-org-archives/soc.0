Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06B1436378
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079014; cv=none; b=Nma/Q4fnUd2hGqCz8alsH9xc2gOBzSR8CRvIzSFfT0ZFCRM5Is2nWBPv799uWtWqqd4QnvxRWW+Okr3TU4waPgDsIIuRuED1+1v0XpDpMO0IG3zuwTmHQEjtuh/nTMnNjg9z8S7y+Q8virIiQBREnlVjz9DhZQCIYIthEplKbqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079014; c=relaxed/simple;
	bh=eC3JoNy19+FEcdbuZQaweBAiYHDdKOv7kw3YKdJOvrE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HZ7ASUW8NUcYVrfWJoKJVOEwvSxRGEZzByQYzFDn31LInZ1ACsRhzOpzgubgbB0wN221OK9C4R/vqZ8kl6h+BcTCemsxTkq1NeCqQRgUSxp8WXf23NB4PgIOyCPKUl2h/9W5a7zYQX3zNdcDVzckIhZQ73e2VBtS+tTqs+Zq9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAUL01ab; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAUL01ab"
Received: by smtp.kernel.org (Postfix)
	id 17764C2BCB0; Thu, 22 Jan 2026 10:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF00BC2BCAF;
	Thu, 22 Jan 2026 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769079014;
	bh=eC3JoNy19+FEcdbuZQaweBAiYHDdKOv7kw3YKdJOvrE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vAUL01ablfBHzBfjo6Yi4L7MfCWbt4LiWJJP9bNg5VSkr9hSgPQS1HtBVqJ81YHMF
	 WqreSOGGhGBlDrKJmw56LARSxANG/WDppdAaZxWf01iVRTlfppRInI90Q0URld9TkA
	 Q5Gvh1znkncmrby5LQJpwUDayArrQH8Cccgn8OuS/r6WmtoKdF+XZtQMb0lKBPMSI7
	 FyrdXaF6Xo25+gsQPu+yo+f9xYLP8znTAC7Bv4dV5CJQgndlGMLebEfKamtoCmC7bO
	 m62XHUfUKvsWZCDUGrLU13DNPGnrvHwCDUwjpBxci5VvFB6ghf7lK/NZC6gATOHPdh
	 /qKLQK4ZoXPKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C911A3808200;
	Thu, 22 Jan 2026 10:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] NXP LPC32xx device tree changes for v6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176907901034.1663980.7134516410311204938.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 10:50:10 +0000
References: <20260116131637.101296-1-vz@mleia.com>
In-Reply-To: <20260116131637.101296-1-vz@mleia.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzk@kernel.org>:

On Fri, 16 Jan 2026 15:16:37 +0200 you wrote:
> Hello SoC maintainers,
> 
> the following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] NXP LPC32xx device tree changes for v6.20
    https://git.kernel.org/soc/soc/c/3bce0076f94e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


