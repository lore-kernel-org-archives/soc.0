Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B7F3DCDA4
	for <soc@lists.linux.dev>; Wed, 12 Aug 2026 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570851; cv=none; b=T2ygvEj+fs/W0So/LHebI4SxDPOPFhpV0/F0fhn2LwEOeRt+66SwHr5JGSwsT2veBD1rgUPThnYGcPH9If5FCO2nKHyCdBOxUP2Oz8NolwxEGGlBUDoBh1lcIe4LftVWm5CPHxsLKLLsxyrPNNJcR0xsFf1WV4oQsh4Azpz8Osc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570851; c=relaxed/simple;
	bh=s3Xi0s30LINAPRt8Qr+QFx25NdJr8ygbZOzETOSAgIA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WMB/LSzI8p/qs0ETgzn1GmHpvWgnRT0kLNv79c0wgRXAkkz8UXYwG9vPXW+WgqB+zY0wW1kxjLHVmPCYQyd32lO3Eiy8xNoGiBprKmZmDxbSU0VpRmKjiqcA00Vijgt2vczOTsUypp8RElDgz2y3UwlLxjRh43e7bgIcmkxAtlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7ypCrf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7ypCrf4"
Received: by smtp.kernel.org (Postfix)
	id E7D9F1F00A3D; Wed, 12 Aug 2026 21:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22851F000E9;
	Wed, 12 Aug 2026 21:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786570849;
	bh=yMcks6OXtMvgb0B11sXAHQP+QNsO+NXMtbUGY7pkW1Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=g7ypCrf47dfpyyinl0VZwJUiWwr6YQasK56d9tZeN6tRzP8gFmQVE7CXdfTQg3rYr
	 //2EYMk/MFQVRK9roKQarxcUhnmUfSC/+ehza7gHioFUSZupslk8P7jYZOg/yfrh7m
	 Xo6oFhDFk/I534O08sYS4oJeD0flj0sgs7lBXchd3VqFN1DRn+E8DQrA3mruFuSwsk
	 eJjOAXOp3GIF4yN7L43mD7dd3eSObVb+AaSFatWZRBoi8pbwZ3EEyu+wfd2SBE3A7a
	 Bw9kQeQgLtYNlX6gdtmffJFoylBJXbwRUIpnZ6z4laTuezf8foNeORoYTqv46SN7Lu
	 mOHGAmmhXMttg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569BB380CEC8;
	Wed, 12 Aug 2026 21:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip ARM64 device tree updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178657080514.2114272.13118516805536121914.git-patchwork-notify@kernel.org>
Date: Wed, 12 Aug 2026 21:40:05 +0000
References: <20260812062003.1285582-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20260812062003.1285582-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Aug 2026 09:20:03 +0300 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip ARM64 device tree updates for v7.3
    https://git.kernel.org/soc/soc/c/6fdec78001b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


