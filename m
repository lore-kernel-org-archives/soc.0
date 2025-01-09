Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522A3205507
	for <soc@lists.linux.dev>; Thu,  9 Jan 2025 22:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460720; cv=none; b=p9knO0cZ/gIyuC5psgLNSRt77ay4XnKG+oe8qnpNVFJ8TuuMvaijE9wqZH4YLhBSJPwrKoh+BRXqDEoPF60XMVEzqWirXdor5Ba1pr7jxmQQ5h7O6X3AjSd7V5bU1X9QWtDiAEierDg14BuMyM9dBkmlzdSDd5Dg1k4Xe9eSaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460720; c=relaxed/simple;
	bh=2bRbk6dZs3jUDnrmW9LkyrOjmBHZR2kOTzSX6OmXwYU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XBjWV3W0jeAUc4ADsW6DPDAAKoPyCrT65fQXv1gwm7xUzYc2WqwQCSYstghGcOl/+ewZs1g8QFtmm2QtJYeVnSi3YNbtKOPfqDVvZWnVZjRGj+4GoY3wOflZpD15VdEA5ebiY789f6kdaoxru0hG3IYkFi8mMG77U+8dE3mgPzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWfqOCyp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWfqOCyp"
Received: by smtp.kernel.org (Postfix)
	id 1235FC4CEE1; Thu,  9 Jan 2025 22:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00CFC4CED2;
	Thu,  9 Jan 2025 22:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736460720;
	bh=2bRbk6dZs3jUDnrmW9LkyrOjmBHZR2kOTzSX6OmXwYU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oWfqOCypcO0o6EP+Cl/IwIsuL3JQTb9qtEeTMyqdGsALHT32QSTD1kbS5VRilZL0h
	 qfdc1G0IuKb3dkAlQIwvWzJxtEYe04Sq31As34YGiIT9muwrgMyrupAmsf8L7PeiQT
	 hVOMsnPj1HzzmwYYf4I3eBdfctPQK1iQdgjJzw4jgxtPxbu9PnypRMY26u6hDCfZ/Z
	 NSIQT76WgaO+7AqfS8yDhWHy33/PuGbl4Z8jCQHaR/GmHI1rqefvFMLUQ94T5Fg4rI
	 VpTxPPO0xt71PhMooRh4FqbVWn/ziDRm+GVflV3KMBLikA08bap+RJ4TQKIgTmdJzQ
	 zIkeFGAY0d5sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEBC380A97F;
	Thu,  9 Jan 2025 22:12:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Remove Olof from SoC maintainers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173646074173.1523525.1396535438676924531.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 22:12:21 +0000
References: <20250102143003.169611-1-olof@lixom.net>
In-Reply-To: <20250102143003.169611-1-olof@lixom.net>
To: Olof Johansson <olof@lixom.net>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu,  2 Jan 2025 06:30:03 -0800 you wrote:
> I haven't been an active participant for a couple of years now, and
> after discussions at Linux Plumbers in 2024, Arnd is getting fresh help
> from a few more participants.
> 
> It's time to remove myself, and spare myself from patches and pull
> requests in my inbox.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Remove Olof from SoC maintainers
    https://git.kernel.org/soc/soc/c/0bc21e701a6f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


