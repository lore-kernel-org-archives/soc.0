Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451593DD875
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405071; cv=none; b=YXpPbS62A6eftl37WuNL5HPpb2+j60L5yInJo3Ai/4PY1BKvdXPylrcYNgAcy5Yeg8TPlp2MConvG0xV0tJPCCPP6Qt7NZKmEgJ6m2aI8L0eh3SY9f7r8vaVWSafp5S+9tl1OIw3vU4gylePlSJRHxkJwf4U6W7H08a4wNMjgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405071; c=relaxed/simple;
	bh=XHSYEZNq2bxBfrhGdeMLMFIA5Shr0vGBeJZxhbE++rU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=t/3sc2Jl4GVnPfDV9C4/paX+FD6fvEyLktj7XlCI5gFSReR0yyPrdlW6ZeK1DtA4/P8cknSHBcWXVDMQ4+2iZVi4k+tTfDrHcpnhm4dp5eGqsfXZ+Nwy6YnCqG841106KXnkXrwY49BGR5v9WQCTCC9pOrUf5LqKclkJSzv7MjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVecm9rX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVecm9rX"
Received: by smtp.kernel.org (Postfix)
	id 04CBC1F00A3A; Thu, 30 Jul 2026 09:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E241C1F000E9;
	Thu, 30 Jul 2026 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405069;
	bh=CjAMYrulJK9+ezt4Ia/Ad5QZ4ZRSOg4h+jczORMDnrE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mVecm9rXYETixJw142hHGBdPZxI0RU53iI6CyYhpksF48g0CYjj2PToKKfbp9Slpc
	 zzK4z8Z7JzPdqlr9WCp8ITKxyWWxUuBWbyWit7WI0J7eLp/7RNF0zxNQpONc7LQ+Sv
	 88QhLYvBVp53q+Z1InVUMZDVGO5yYtLEaM/aka+817PrHoFo5NF3QBzz4fb1j9nz8k
	 KOOBGOGP7vFQV7WOfOdqPn8PWbWQCMagoJw3C6fK8R8s0hzrMMAAaKfUAZVmAySvVC
	 JKNdfQs/2NzbSz/Tve+6xT5gRk7lCMB4peQWnpfHX0cKjl+owKXIZAiaEYm0iqdkbg
	 dVZkJOcPJ88cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A2B381195C;
	Thu, 30 Jul 2026 09:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178540503337.3469699.9541885180879006677.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jul 2026 09:50:33 +0000
References: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Jul 2026 10:32:44 +0200 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.3
    https://git.kernel.org/soc/soc/c/253b1036b916
  - [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.3
    https://git.kernel.org/soc/soc/c/fb1cb3242b9a
  - [GIT,PULL,3/3] MediaTek SoC driver updates for v7.3
    https://git.kernel.org/soc/soc/c/aa469c0c55d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


