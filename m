Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A14E271454
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217433; cv=none; b=Nw9zIofVVdW6eWUw+lqfhjXZQ655+FLfmGEX2e7yV7kqbZy28nKXvuRvyGdl4mYEhh8rHXEmV68CER0OCg6xmQ4HkjdgIx9en0KlFL7EpL4i/rbs/leGyDxzojGUwYY4NnxLgO2KGku7c6KHEZuuSGP/YKAPxSswtsTiMz7M5D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217433; c=relaxed/simple;
	bh=VW3+yyknTFD8akRZSUvdQ3OleYOV2OcZTuEC3Ph+MUo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KykjZ1v7VTImiGhBySdky5zjk3QOlKwYvdJnd79tc9l9UglBb1gQ0v8bPisMls+Hp3CHHW2FgSwFYW61Mg4qNTm1B8DCDnGLGd9BA6W6s7FGj9dvlJ/5+MBXrKEiZYxT4aNkfAQftfGWBZvbfO3xR0Ut7eH/Qw0difL2LjXtBVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFSe12wx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFSe12wx"
Received: by smtp.kernel.org (Postfix)
	id DAB3DC4CEF6; Tue, 22 Jul 2025 20:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54DDC4CEEB;
	Tue, 22 Jul 2025 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217431;
	bh=VW3+yyknTFD8akRZSUvdQ3OleYOV2OcZTuEC3Ph+MUo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nFSe12wxsOJn9CgeI63Qu1CmvxQqndNRWRU9ogyRTbC/eyNwyrb+8MFL3pXa5t7xN
	 Sa9EBW3HU9TjLOz6t2UxQTQHLXKwYXQurqcLXYdWeojmxqKC7FGwlM4f1VMob1rygd
	 feRik0QxBB0+145Nutn6WGorQLhO8z0Np05EzwHJApZ8hXtkQ8Ce2cWmqm/9JmZtt9
	 k7pGDzNOL7Aul3ubVFukO4q6kKvnuF77Q+lMd+TNFTqJFqy6OvtOddRccTz+KrB0eP
	 78YAFlxdA16Afxzb1U05UzqgBEaXCwZuMehXEjynArvhn7BDVBKvg0bXbxb9FVNG3E
	 jUyLkWp6fmYTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BD9383BF5D;
	Tue, 22 Jul 2025 20:50:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321745012.949540.6152117674321285141.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:50 +0000
References: <3d93b621-9544-4a68-85db-6f87a9e8fa5c@linaro.org>
In-Reply-To: <3d93b621-9544-4a68-85db-6f87a9e8fa5c@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Jul 2025 09:38:18 +0200 you wrote:
> Hi,
> 
> Here's small but late PR for the Amlogic ARM64 DT changes, adding the S912 based Ugoos AM3
> board, adding pinctrl support for new SoCs and finally enabling the NPU on the Alta
> and VIM3 Amlogic G12B based boards now the kernel driver and userspace mesa supports
> the NPU correctly.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.17
    https://git.kernel.org/soc/soc/c/7097d52d5584

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


