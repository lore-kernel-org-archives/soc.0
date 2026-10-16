Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F29C2931EF
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163450; cv=none; b=lIeuIbc16c2CcSkATx/gCTnQevrbjED/GSFo0tqjuIqIL6U6/hi78W2J1GjOGZ87aC+t/EM81pabQ9g+kXCVd5Ukmc+u207jEt9P9kYDY5Lph+SOQ49MPxCSHvBAnJC8igqsUaEzWmPBs9AEyk+jvSJOFfzgRBeOGw4mTHusM6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163450; c=relaxed/simple;
	bh=Y1ucrpeAp8GeH6lXVa5CF4wopuBHlARCIyWRRn4QDcs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JV2PWbFuybOBMDXxPLmJmCw5Y2YbMWd4ZpMmmNxgBWnGVWoo19lOBFRfuYNUMXAL1SmPFn7YHv6VRMzilxvbfsivtNeUXg2Kob7rpU/7108ZxXMDV5yyR0QiIH1ijo25r1o6uTmcH7d0d1a0nOmaHs6vkzo21FDqHL2Al/4M6Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQcV39eW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQcV39eW"
Received: by smtp.kernel.org (Postfix)
	id 5B6951F000C5; Fri, 16 Oct 2026 15:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449261F000C4;
	Fri, 16 Oct 2026 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163449;
	bh=FcAewi+i+jDkm/kRhLrRlRm8Nk4m3IJfQGXqYE5z9mQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lQcV39eWlxvmbp1FtN8In/EhPGoceZ7LOCp0S2pPtVr8MQNuFaccgB9obeoni2h/t
	 XdxNK3RovY5s+aXcFwI3voCuxPANpqnT5bGUjtrLvvuGYYWP3WXTrUcreKNJBCNtqg
	 M8pH5jyn9kSF6WafsyUp7RMylUeMd1eoVa6pstao1enX+CS84NmxxCNaqvcGCXcXG/
	 +hFp485pCrN3kzyZmclbXAfqPp0ecoU9/mZ88IN/OsxJ+eFZkGl2Kw73LQg9jqML9Q
	 hiBqSzAb1FnceghE07mpzTalzAOa4k2z7DcWkJ4q+ikBMYSjwDTxleseAY9VKHoSEs
	 CGNk5eeuht5Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3C2380A966;
	Fri, 16 Oct 2026 15:10:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.4 #3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179216344794.806834.1438193521180112987.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 15:10:47 +0000
References: <2330337.ZfL8zNpBrT@phil>
In-Reply-To: <2330337.ZfL8zNpBrT@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon, 12 Oct 2026 12:20:30 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below some more Rockchip dt changes for arm64
> for the next merge window.
> 
> Please pull.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 7.4 #3
    https://git.kernel.org/soc/soc/c/82b40b6bfec8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


