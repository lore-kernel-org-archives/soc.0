Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5FB23E35E
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078662; cv=none; b=P3ULnGXViACeRGjMkDIpbHAOCuoGHtTxgfNF1fPA40eUYzuraNhcxmiZCzaR+hEY7wlhRRqoi5F9vyUGpNFX8PF2LqweNh/13s9GRpFn9azwuT1quVLOPD0xAs/ZmGQU25fhr4Of/IZfbPaDvizHZ4f30ExqhxmJ3RM9IdFl3tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078662; c=relaxed/simple;
	bh=ZQrwkYGblmF4IibDz53BJthv3LmOGS0AaZXp8DwczFI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nAuscGeKr4sOc0Pgqc3v9J50TiGI/Y69DaTbYNDsscva7Ub12MW9Cq+qDbMas5bY1Y7fn70rpAgVsKP9s/Waz7u8ao1q93Vb5LKPRVgxvZkxP1Yu+Jqo0w2lZXaIl5coGJng2pKulCxXXimgE2RHuGUGUAtbpAP0xmaxMjlwYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROGMWv2a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROGMWv2a"
Received: by smtp.kernel.org (Postfix)
	id B9188C19421; Tue, 25 Nov 2025 13:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F80C4CEF1;
	Tue, 25 Nov 2025 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078661;
	bh=ZQrwkYGblmF4IibDz53BJthv3LmOGS0AaZXp8DwczFI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ROGMWv2aIvV1RNwn4Kzbm30nOW+7ROHA4yZeY9Xz1NRfNEfWi1mToR0SIqUuGfc0I
	 nIUQ7rYCD3hk8m5KE4XOS7eWTarJL/er8eZeuXJ7pqony/knlQb3doVq9A9S9A28SY
	 NhZA8aKeHLI9JYMjfvcvke1wFssafaGfh3U1vYgRqPNk4jRXQFCpXcFEzBlPVjClL5
	 PbPEl7OGYT4taOAmHzcFDeKCYNde7sLj+oe802wDWpDl7uQtT5RMT+HNsxu08X4B8j
	 b7nNIkr+dJf4ZKn7A41L2Yf6AK22KsDAtDa6qgL57eXP+7QUqYgSdkHItYwzi8HVfQ
	 7hBXJhUpbvpmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 655CE3A8D153;
	Tue, 25 Nov 2025 13:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/8] syscore: Changes for v6.19-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407862401.736376.762872309256843898.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:24 +0000
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 15 Nov 2025 10:00:36 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/d34a71ba2173
  - [GIT,PULL,2/8] dt-bindings: Changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,3/8] amba: Fixes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/5d5b056ba352
  - [GIT,PULL,4/8] soc/tegra: Changes for v6.19-rc1
    https://git.kernel.org/soc/soc/c/aee7ea468104
  - [GIT,PULL,5/8] ARM: tegra: Device tree changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,6/8] ARM: tegra: Default configuration changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,7/8] arm64: tegra: Device tree changes for v6.19-rc1
    (no matching commit)
  - [GIT,PULL,8/8] arm64: tegra: Default configuration changes for v6.19-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


