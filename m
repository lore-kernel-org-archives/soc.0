Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DE63264E9
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080241; cv=none; b=TUr5u3DCjmCZDeBP6va0BUHKGv0r9FV383RmmlPPlmJLFledLzaTQfkIu+KO1MitvkIh8aG7hQ4TAjzQAaykWXl4ZuvnhWHx56PoOph8qAOORdt4xZzP0uRMLQuL6SKnbJH4o3Q71ZdIFm3LkY5LaHPOwLeDbkfwlTxRYr0h2i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080241; c=relaxed/simple;
	bh=HK95NWqO2t05Me0guX0C3EP3ia/Hfn1zuhbWGYIuuN8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=upoLnOvn/whSiPTuDV/UXVGHm9PXLNYjAFjVsAq5uXmLRARhCpIv8UphbjnT1HwmY3EEZom0WIVg9i6gjqhxswKfc+9g9ymG0QQc50v9ol50efWe9qg8EMgDnh5I3BFqAQ+Pf1Yo4AxNgmo9rjUzDcCso9+9q53l/X3ipMA5kYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI/KAtZe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI/KAtZe"
Received: by smtp.kernel.org (Postfix)
	id CE9AAC116C6; Wed,  1 Apr 2026 21:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B3FC4CEF7;
	Wed,  1 Apr 2026 21:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080241;
	bh=HK95NWqO2t05Me0guX0C3EP3ia/Hfn1zuhbWGYIuuN8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NI/KAtZeiHyVkqVD8isldQQjAlgLY4kLzuis1Jxv9VLd24LtKsaZc4NMTKxqVlwko
	 ZgnqWvimaFnMl2lcqnsodg9TBJt7cNvHNV8D2TTOI36lU/KUwVBXQREqWoVTLemlO6
	 JDCBSjCUcQ8kNln+wCYBS4TIZe6nlv5EfUD+reMDkdhrCPevu8NPwac16+8blg1sip
	 /LcXBXxMep2lJIpFf8JZajZrQk4wHQaum3B7ebXEE9IiBzNwDkRh3dd6RVzUjja3fP
	 i46bU9R7Oqf4bpFi/eP76U0tJ2O81C6AbmV5vlI5967F8mXMz78/5m4x4wocYZRREY
	 euHdDfBd0IDjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E1F3808203;
	Wed,  1 Apr 2026 21:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508022432.3876275.2009861814131237974.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:24 +0000
References: <20260331211602.959960-1-andersson@kernel.org>
In-Reply-To: <20260331211602.959960-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Mar 2026 16:16:02 -0500 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v7.1
    https://git.kernel.org/soc/soc/c/710c166c0fc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


