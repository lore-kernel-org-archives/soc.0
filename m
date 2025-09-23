Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6C302CDB
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 20:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758660011; cv=none; b=aH9flIQKB6S0LjBlSFGKBACTwa+HEXqjiBb8+9ViuxhZIYBnNW556Skcpd3X/vHXd+YPMuOpmLKl0mrmqofYgq54wXlPEQPs21iVBu7RwFHUqlNQ/1keYzfqN6aF0y+YJUU3OFBr6dem2b73oPCHQzDYOHwFCjTdiGYutOum0tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758660011; c=relaxed/simple;
	bh=9wpyUK87+NRId2mDpX0RlWYFYNpKAigx7o4q4dBkCjU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MSKJoQQyjaIbD6TVM3M8lhnjAOgHRoUwPEIqaDKdC98T2aK6X1wkkoIah5Jj9i1Kkmr9y1P2gRRY+7Gfmn96TFHbv0S8ZZchuTg2qE0SgZs5euoMMs5XnjApE9E8dcc7oigizWrNpuBSbG3Upv+cemexBzJqkAR/B/QOrPwuA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyFuEU2u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyFuEU2u"
Received: by smtp.kernel.org (Postfix)
	id 47068C113D0; Tue, 23 Sep 2025 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314B1C4CEF5;
	Tue, 23 Sep 2025 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758660011;
	bh=9wpyUK87+NRId2mDpX0RlWYFYNpKAigx7o4q4dBkCjU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oyFuEU2uRAU9JhVcSXHDMGGUel5xIzPo8rQCJUngwCBhutu/wtd+eWzceCSZ4MxdA
	 txgVrl786PA+RHcwjfrN6c1OYlM/tKsBy2IYcGZ7043Nv+/g2MSelbapsYtGtmk3/S
	 HWQWabys4zjJGxhdfQmdkNCgWTTB/L27A8vTuemjab4k+bHLt3+2rt+jMV8bhBktJ8
	 MZ4W2PA5w9yr6OZ5r7nJMztXTO4dZpJfblw7ppu8Uofn4iqjnWIbWXGzuHvR2nREm7
	 UusPFzTXcv+QWyxWD4QeTP65FFaqqyg3QnsTsILgaMqtnfTVqpSQQgY0ted0byZcam
	 gN9MslUQma1UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712C639D0C20;
	Tue, 23 Sep 2025 20:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC fixes for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866000823.1916197.2897946560758676959.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 20:40:08 +0000
References: <20250918192241.29374-1-sven@kernel.org>
In-Reply-To: <20250918192241.29374-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 18 Sep 2025 21:22:41 +0200 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-fixes-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC fixes for v6.17
    https://git.kernel.org/soc/soc/c/ea38dfdd38e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


