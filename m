Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796A236A70
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826219; cv=none; b=CCK/WIJg/WEn2IrPJXgQHF/TnNie8xzOHpZv1Jzbq2VHiJfNCuPez8D1dxrLIjG+wiD7xKhhvSHDbrdJ6NaDKKYAKPxxZp9O6m/b8LHq1de0Ve+9Li6PzwMudhKuWRakIO5+GdYwShiHaMAxkdIiB0o12ktqgG5O1+UPrSc8Tss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826219; c=relaxed/simple;
	bh=s14L55XjPR/ZAHT0btXLB75QS+r/TKaGOa3DofufrTc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=L3w6eT+hxBAJg0SOMm4tWbx44b1c4ulycZO0quGFGvHWaPKTDoNqtQqFZjRJqXeyGYfajjm7MZ+B+shzgyOkMLTjyE1NQ3xYeb6t/AxGgYXZLeadL06Ul6pyaVGU6ygnfHzOi5q+PrWANJInJsdQqqDa2FdJptnWaG576ZpQBcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNAfBhtk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNAfBhtk"
Received: by smtp.kernel.org (Postfix)
	id 93FD2C4CEF0; Fri,  9 May 2025 21:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E56DC4CEEE;
	Fri,  9 May 2025 21:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826218;
	bh=s14L55XjPR/ZAHT0btXLB75QS+r/TKaGOa3DofufrTc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bNAfBhtk1ozNKjo/ewGjQowv/U2BRb2R8ovekz2YnDvfxcxf2wRBVYo6AWY49ObrG
	 0NqiPFodI3L1Q6bDzihATh22Ik4UdP9AYYUfTcq9R0YGWAwcT6v/7fAJoz+NJCfJsi
	 Utd6JOvOoYSs2e6teT7FjF3YMkskF7M+gvq0ttq6EA1E+BRRQQPns4vTbMvx0SlzWK
	 d5F3twM3F13zC76romDQywI0mQASWlAcuVDyTXbMHBCFLx9wE5kzBznnOKYhX2KOGw
	 luThvCf91oOfYegZ/kgzbqfNVSaudNxuYvXNMm5MkSs1iIleoh2oOHhSo4MxifFXyn
	 AJl39soiEfW1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A8D39D61FF;
	Fri,  9 May 2025 21:30:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682625674.3817276.4115972518707379210.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:30:56 +0000
References: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 May 2025 09:58:08 -0700 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Broadcom devicetree changes for 6.16
    https://git.kernel.org/soc/soc/c/7b2c40796878
  - [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 6.16
    https://git.kernel.org/soc/soc/c/fecf15fab3f0
  - [GIT,PULL,3/3] Broadcom drivers changes for 6.16
    https://git.kernel.org/soc/soc/c/29bf77f0805d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


