Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C410F347BC7
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767808251; cv=none; b=ImAOFyxke3xefigqnanV5zx+rLotRXCFIjh3kJVyBLibayuraUJCA8RSNE1E8JMMVVhfemPWqXHtDZ0yfRaDp9ExaahM2dIfYCdR1GiqESyyJBVi0nXsOcKOxYnNkzzPDF999n7SwJuXsdbcLQl6JHTpf2srkX7Bx91gDr2tiis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767808251; c=relaxed/simple;
	bh=/YQKx7v9/Zli7/+c2IRFFHmquly2fBCxeGccPulpxiQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XXbtV/QelL7VsagY53iMwIRj4Vj9ys6euo250ApNgOgePt57OJc/eRnBtPzNDKgMyxCQ/ZHV45E9QGFS9UaY6MTmpg6HJM4yUDh9CdrgRJsuf/fHyGmu45jXrrZ/XWNe6qe72+hVcWlTI44YEPtvTK88+FK8PKfQGW5QCnlEswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVkfvlin; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVkfvlin"
Received: by smtp.kernel.org (Postfix)
	id 45807C19425; Wed,  7 Jan 2026 17:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30234C4CEF7;
	Wed,  7 Jan 2026 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767808251;
	bh=/YQKx7v9/Zli7/+c2IRFFHmquly2fBCxeGccPulpxiQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bVkfvlinVbVwVkJhAIUH4EVHZG6hpTv4Z9BDqYwbcQiDY9G30Sf4TAWt8uAc9F7oN
	 2VNhfnLk7Tz/aeODc1BrPmVJokVILGz6XE7J3mJRUgf5JIPi9q8RFZkD6ATdf8wKcL
	 Osz8LGFOdBHTwq2ykF3wYp0yfkSEjus8T7Es29mHV6ThhbrhmXroCR+SDhPjfUQqTi
	 1610LqL4L2Rug3zHUEXt0c7NI11+kS54xs7MwzMqZdRehOLDyFLwCPcgLSwDth+s4Z
	 8PpmD3kwtBVqVkpKNFcBiosYrR/lBB2V83yHBZZc7H9kQL0GIUnkCQLSWmmCzdZqFF
	 SxVHWpM9othMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78A803A40FD1;
	Wed,  7 Jan 2026 17:47:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: first batch of devicetree changes for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176780804802.2867211.2655456088997555141.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 17:47:28 +0000
References: 
 <4ab756729c4e26f7e544156c8613e839a9a9bebe.camel@codeconstruct.com.au>
In-Reply-To: 
 <4ab756729c4e26f7e544156c8613e839a9a9bebe.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 05 Jan 2026 15:11:03 +1030 you wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-6.20-devicetree-0
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: first batch of devicetree changes for 6.20
    https://git.kernel.org/soc/soc/c/bc6fe9f0a643

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


