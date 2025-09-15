Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308C033A02D
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757948416; cv=none; b=QvjMw4Dh2eSA6iPjJ3hFiDQiCVX387JB5Djye5Env6jzJnCngp8WiKEP/GdKXDoI/FbFVD5/MA6miZ0N1tAjMZjfqwxyfxXS5rf/aIkXJZqUV82TXmWzfiIU1us0l8R1i1e6dRk0oDYjZ+7YgeN0F9JAOHhIjIudeTdxeGG6ikw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757948416; c=relaxed/simple;
	bh=aQIpLszTtPkFucW9YoPQo2bZYyv04RjU/r/ONUZL0dk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KtG6O08/cP6Cxr2Jz88WSVEV0AB7fvUoHFmfDFQa+xD5V8gki8jjbZi/+bo6Rf4i5yWmwCNXI4DExfZWqP6YMM0SiLb6iKX4j1gDAI4IYKbGY9SxF6UdebOHk78Xs8MO3/gnVOUmvFlm2xE/dTfECWhnI4unWe/jcOriE9gwNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYwUPufR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYwUPufR"
Received: by smtp.kernel.org (Postfix)
	id 1D3DFC4CEF7; Mon, 15 Sep 2025 15:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0775BC4CEF1;
	Mon, 15 Sep 2025 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948416;
	bh=aQIpLszTtPkFucW9YoPQo2bZYyv04RjU/r/ONUZL0dk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MYwUPufRMoH286LgvJ4gUV5fSM7KbpWpSmE6KOhwzMNvf+YWZpT2U5jfq1R3s41in
	 e05giDXdFhemhpuaMab6zD5N10WjSNHs1bftk6ue1YB+KuOyaAOj6ltAKe/5OY57z3
	 +K7CSQp2gRhwsul2s9m69DMNIir1SK94kT0g5yUWw6Vt/f67FX4qRy6ZjbjxtyD+Lo
	 xSFWkDv3lcK1bXjCPgshAHCNnAOND0lkDmM2V+w3eLvsJdWByS6tnNZ2bpCQnlZ8+X
	 Un1tXUfQJTJnSjTyquZLHhUGPQ2GUIsqgzeEpgRbUfOfzpL2aWji9nH5C42Y8d2lzg
	 e8zvzc6ZjGw9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE6D39D0C18;
	Mon, 15 Sep 2025 15:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] i.MX DT bindings changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794841750.17822.12438734384425058170.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 15:00:17 +0000
References: <20250915132535.253859-1-shawnguo2@yeah.net>
In-Reply-To: <20250915132535.253859-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Sep 2025 21:25:28 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] i.MX DT bindings changes for 6.18
    https://git.kernel.org/soc/soc/c/1c615dd3031b
  - [GIT,PULL,2/4] i.MX ARM device tree changes for 6.18
    https://git.kernel.org/soc/soc/c/636d134e3c52
  - [GIT,PULL,3/4] i.MX arm64 device tree changes for 6.18
    https://git.kernel.org/soc/soc/c/6c1c107bf5f4
  - [GIT,PULL,4/4] i.MX defconfig change for 6.18
    https://git.kernel.org/soc/soc/c/8193017c7182

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


