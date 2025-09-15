Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D2A1FDE09
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944254; cv=none; b=AqqKY9t8xaUDRXrnNsxMXPQb8FnEC3EoWVg7n40O4qvBRybibpTFSc3xmFecF9+aW8gkuEjMzFFLxZll7nwQ4je5QlHPok+U8WLBOxZi7B11K+Eah2bJpXpI3U1WF+iVWwFCIAGnEQz3OtMlRoPo6NbQg8sKrCcK4y9XtVodsbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944254; c=relaxed/simple;
	bh=RFO7l+iTR0Z6fLR59Ajbf8ZmWhaLCt4Xay22zv2F4GM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cqxnze2wiABU0A2eHcpSQ2WbZz2mLWzXr9guA5RLSlIcEBqvIS6zsUOp7F10rhrbYO+r/6ukkUX/zwA13yCOzpA/5cq0Jx8ue3L5+Vqtb6RvlXy//C5I/fB1t6M9MJjCxQD3i+VpykGJbVAuJBWRxnOiuOAVfDjqBuZfz+97gGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEGEHoxz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEGEHoxz"
Received: by smtp.kernel.org (Postfix)
	id 09F18C4CEF7; Mon, 15 Sep 2025 13:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C3DC4CEF1;
	Mon, 15 Sep 2025 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944253;
	bh=RFO7l+iTR0Z6fLR59Ajbf8ZmWhaLCt4Xay22zv2F4GM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rEGEHoxzoLryIy1rXUlIAhQAk8YhtnC5ZleD3bLWgpEJCIZXPUuowt98yTbeLnERS
	 WxcGjIkyVM/MtD7hbe59r8rhB3RrHO2C2tAy+VuS51CglY5ZwHY1DREafQF3/tXtKi
	 xZS33GCW21Il5J5eFAfEz0oAbK6R9En7oVVCAmyn0ldgbj4/PXP8uawo1s2+E90BU8
	 LTK+k2wSdHwkT36IxJ28tlTJhQmHRULMB8XT7SpZApd+VbTLLmzMkAGkemf/TFozDG
	 ycKtiZxYJCq/JMk5TqvzZ6Q4cRr0U9ZDAMxYW7NMsOJ/hTp0FmZ5MQEI+MkEwVVm6A
	 2uwb35t4edTvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF0639D0C18;
	Mon, 15 Sep 2025 13:50:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.18-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794425528.4179625.8211132353355749630.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:55 +0000
References: <20250914063927.89981-1-thierry.reding@gmail.com>
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 14 Sep 2025 08:39:22 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] dt-bindings: Changes for v6.18-rc1
    https://git.kernel.org/soc/soc/c/431ab7953c23
  - [GIT,PULL,2/4] soc/tegra: Changes for v6.18-rc1
    (no matching commit)
  - [GIT,PULL,3/4] ARM: tegra: Device tree changes for v6.18-rc1
    https://git.kernel.org/soc/soc/c/b4952e54c3fd
  - [GIT,PULL,4/4] arm64: tegra: Device tree changes for v6.18-rc1
    https://git.kernel.org/soc/soc/c/d75f5aded453

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


