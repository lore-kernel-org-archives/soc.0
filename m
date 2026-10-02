Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596E42248AF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977823; cv=none; b=rt5afzqANGrvhFMkrim5KxRocdqYBZGTdWlRe/w1BIPSf+lVv6yn5L4o+lwhzKY6+b0ccry3VKrSFkUBqWRTeTdOXKxUG9+sA9lWmKVwoUqojjdjCFrLy7sJnte9GGgpkIbHrm9BJ2PM9pK3cc/MGXp7p5UGV3it9a7+4L7v6g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977823; c=relaxed/simple;
	bh=WqIafviFkTn9MbN0bPnxAGJik2n1+sawAVm6IL1BW54=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=G5zhcDuTOftB2fKb0kERSiuWYeid61V0kH8kj/kyHdFSMQyVXGy6FgYyjw4cmXEk7YLI10gMsUSW7yr51IrexxxPbMLhdIFiSsIUkejaCy9Di9lO6wgqVEXJWYnSsKn79tqZJZvoC3f2kN94VlKX4m41oBr+sA9N6VUd745o0k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjHzvNan; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjHzvNan"
Received: by smtp.kernel.org (Postfix)
	id 27BE61F0089B; Fri,  2 Oct 2026 21:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1115C1F00898;
	Fri,  2 Oct 2026 21:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977822;
	bh=ntnfumY/nqRzD9G78QHwW8JdFNTqQtWwptnStrML3nw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PjHzvNano5CUzDBuk/g+Yd5T+g/GNcVQXwK0y8c/v5anGKQSAf4via2s4W72vyVh9
	 b5wiEsLLxKQhpiE/B0HgyDuJU8yF9owkr9kkqNEEoKbgWTNpaPdR2juu515kSpfitd
	 8/TDPiXEruApSzDAvHKX3aWboWSUYumTKFBfmoE0yTRbAB+mrsSbwhDTTRjZWxs62P
	 VqxmgJJ/KkgG1rvWn8N84UZob9Wyvzj3UwLNBP2CWCxUK7kZ1QobORk5WpgDcC5P4U
	 6BZd120g+yg1p5SKSfCge3SowoKCjUnU7C0wGeNsszPPlX50fbaKV4CpywifqTaopK
	 tRUm+oa7Ixhaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 04E4E3811A72;
	Fri,  2 Oct 2026 21:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm clock fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097782090.3602058.14781255655691471363.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:20 +0000
References: <20260922131156.358224-1-andersson@kernel.org>
In-Reply-To: <20260922131156.358224-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Sep 2026 08:11:55 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm clock fixes for v7.3
    https://git.kernel.org/soc/soc/c/1d0f326d2d5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


