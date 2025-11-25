Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FFCA5A
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078678; cv=none; b=FFAxXqDUjk/tSeituY1arY5jXznKo5QRwRWMxwHFugpHAqYTr0/LTe8Hgkg2hiHwiv9FCquqtc8VCE2nSSHC/0TwJmgakU4tcXcaIz4IzcFmnsivh96pjdtqwwwCYq7t1JRGgkv2i/wF8lBaWtbwwyI2rInewKo0cJngxeCTtz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078678; c=relaxed/simple;
	bh=8HG6fbbFuHbDpNXJeip9CQd2XSim2A4q5QrMEzptSh4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BFcRjt1OhesXDomw7IzafNH8h+0Rwp+k0/r4j6QY2u9F41483n5yudSECDStXaRTHu5iuiGDPargKlW3j+oGwRoB1rNgQM3oW0EJrUFzs6x/JeI+A2vOSvXZfktmYGO+ZxZgOvJ0PEgbG86Dv8joZh2AAu01Iap0JbyazKDlcCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I40XiVQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I40XiVQB"
Received: by smtp.kernel.org (Postfix)
	id 05D9FC116C6; Tue, 25 Nov 2025 13:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44F0C4CEF1;
	Tue, 25 Nov 2025 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078677;
	bh=8HG6fbbFuHbDpNXJeip9CQd2XSim2A4q5QrMEzptSh4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I40XiVQBjvOK7s47KrWz/sB6VKYgbrddxzE+IwxfJMBo8bWaEDtO4nWWYPlLNV5N5
	 RGRZ8mFG5HhsOgOr4QkiFtxrp1FP4bb8T4q1cbWmsnuPtXemXv2Ip53M0o/e/gSVFY
	 fKhaE9FXbZSjWPpkswBPyJGl2QHF1+oVCTk8z9r7lSgeMDb0kQ9bgTNQJIhtpKIMuC
	 zTbZkkId/S37Gn66QCGkPS5xcONFfl7+HtPcfU3jxfllJc5RcwCUA7ykTmuPlhvAoZ
	 hvODC9oQXJDa7s7+TrBs+WhGfLgHrcGsCRg0haFAhoEOHnawmaA5Y8mDdMWuXS3uwk
	 drRJz+WHzedrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB2A3A8D153;
	Tue, 25 Nov 2025 13:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/maintainers: OMAP updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407864024.736376.3932605264854194404.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:40 +0000
References: <7hqztwk1n5.fsf@baylibre.com>
In-Reply-To: <7hqztwk1n5.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 09:30:22 -0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/maintainers-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/maintainers: OMAP updates for v6.19
    https://git.kernel.org/soc/soc/c/fe57a0a548c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


