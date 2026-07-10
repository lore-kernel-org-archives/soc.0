Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C043B9D9B
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688434; cv=none; b=W7M3mr+EVIZLvdHJOeN+TDJlmnmAi/vQ6tuejfI4Lhblv+xjQYIkV3VCen3AlvC78I2MZK8jSH5zLOEqJDcoHdLf5F4RV+6lGHW2PCDaHZrlKoBgbgDu0jBtAzV61/oC5OpjfLAmqs9VbnPE0/jVc7pn48nO71yl1V9ra6qsckM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688434; c=relaxed/simple;
	bh=qUaWk7aWWHSiiYNqPafr0oZnisTXMxelhizuXZgC+Jo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l2pWg1xbxazrJUdwMY38i/TsvxpMRGNS8cGVStz1TU+ljLhtOs9TVZhCatPP6a2o5E8X+tZ0EVYwIKUZY3XUc3LGktrafEx08GXEgxSZUrXtEYYrN6oFD0KnEeKl4LfL+JzLezb018QAYBmtOo/ZIuepnr0k6wCk/klT/sdbcp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDWeKKlX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDWeKKlX"
Received: by smtp.kernel.org (Postfix)
	id D09A81F00A3A; Fri, 10 Jul 2026 13:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EF11F000E9;
	Fri, 10 Jul 2026 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688432;
	bh=jmYvfO76U44UIPN5yLHeZ/TjDGj2YAAcb0T67sn+lO0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gDWeKKlXzp7uKB8zxQ55R5mQfDUUzI16WuT+2y90jBflUHthYjfj4ikj3gElgM0mQ
	 NzHdivQHbrqUCpDGZA9JlQmVnEjz8IV3zGMTN14KczUmfBWB9PbAMpcA7iD/JqN5Dx
	 Mr2KsW8yuRSK3aNH2dKs122slwf7UArVrzwA6Al5fAKmXA3mSBL0zY4d7iYxXlz7yy
	 dyPP3dQEMRfLtWcEZsiNh43SqymeQ3pWerp8IagYvrKhg1QrJuR5KcjBlWvPgCev9D
	 qcpVElnkpmCpToCIATNGwuPGjHYjRDGJLVLSm52+bN6B/2+PmQ/Z77ASi/yWfnk9hW
	 wp7f64QTdtT8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09EA3924F93;
	Fri, 10 Jul 2026 13:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Update SpacemiT SoC git tree repository
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178368841044.229479.2793680401489406569.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 13:00:10 +0000
References: <20260707-07-spacemit-git-repo-url-v1-1-137697316a4c@kernel.org>
In-Reply-To: <20260707-07-spacemit-git-repo-url-v1-1-137697316a4c@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 07 Jul 2026 12:14:14 +0000 you wrote:
> Due to security concern, switch SpacemiT kernel SoC tree's repository
> from github.com to kernel.org
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Hi SoC maintainers,
>   Could you just pick this patch? otherwise I could queue it in
> SpacemiT's SoC kernel tree, and send it along for v7.3 cycle, let
> me know what's the best way to deal with this, Thanks
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Update SpacemiT SoC git tree repository
    https://git.kernel.org/soc/soc/c/10229a0702b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


