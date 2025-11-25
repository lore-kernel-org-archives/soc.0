Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E331B239562
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078667; cv=none; b=Wgt0f80buwLpbQ4mrv4CTboiVGduveDW7Fe05TEein0fFyW1hdHD5fu1Mn/MJuD3AYQGvNbYZgEH1z7Cn4JEjh5TNG+7/Zb/ZrtK6jTmV4Zgj4+FT4WUKlczwpYIfIEF4m89B1ncAebvde8WHE2R6+Pc0Doqlw5kBse/QIGweLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078667; c=relaxed/simple;
	bh=gAhqBD+4b45l66TMR71x2oh2+p2Sb9A5Y1W7Igwrp54=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W1Mxl3L8jPykTD8K7+nUeRC9MP9j1Qddvs4FK5O3X+0hl49UpPVe/EiZxs3+6WWQKTMtoqXc9OyhLnVSFbz67YPIqGdI32HXAFOK+Ow3RcgIxuJ3QWtfp6BTEwG8zPDul0S6NU5fI6YEMAlKUf7ZaNyOYqOQB0jFoyaB3fAcc/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTsE4bjG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTsE4bjG"
Received: by smtp.kernel.org (Postfix)
	id 0EA53C19422; Tue, 25 Nov 2025 13:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA89C116B1;
	Tue, 25 Nov 2025 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078666;
	bh=gAhqBD+4b45l66TMR71x2oh2+p2Sb9A5Y1W7Igwrp54=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nTsE4bjGKF/7MwYTnTCWNppCJwR/YvIySoLMIdinNlSv/h5nmhnoHOOdH3Mwnvinb
	 RiHXCWzzVWTixtBZpNy1TPyx6AxeEXSs5XCMCB+f58Z4nKILkstuuxIGElhhqUBY7V
	 TgZx3br937mVwse4isQRXEe+/O4tWHgySqX6U8BTcY230sBCDf8ChtQkJzUNUSnPPz
	 ZG6UJbsxhwCTPUsVQFg6zpWJ6HHJKgcPiQgRtvKziBQGiOJ1FlBsJBBRVgWQBDmvvk
	 zr3EpsC/p423Vvzq08oQVF1pZ8dRh0tQ0QdBGcWMibrljOAs91ZOdyqMyOAQX5IQCw
	 BqpNrHRjg1PeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD453A8D153;
	Tue, 25 Nov 2025 13:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: ti: Driver updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407862824.736376.2834301564699761783.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:28 +0000
References: <20251117141206.pqjzjzegxajziyof@resort>
In-Reply-To: <20251117141206.pqjzjzegxajziyof@resort>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 08:12:06 -0600 you wrote:
> Hi,
> 
> Please pull
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: ti: Driver updates for v6.18
    https://git.kernel.org/soc/soc/c/0363169ac78a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


