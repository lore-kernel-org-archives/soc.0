Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72107266579
	for <soc@lists.linux.dev>; Fri, 14 Feb 2025 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545798; cv=none; b=jrw3poVj0+SROaLjh8SW61Rflo4L7ztw3HNx4CgJg0xulzMirxY+5qvTgp/akKTFch3ccI58ILnsRdUFR9CEnQrQ1uWSlkYDqA89EzpLRGRyfujQNU8KTvyjU/tBZTCjyGx68ui4Zu67dgRwc5hDO7fNxRpan/yMjLe0y3dmrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545798; c=relaxed/simple;
	bh=tqcVhVvsFrGt51X/4fZXwRdnGgcBLn69HCymRTYX3qM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GBS81O2UdffomAQdVuTq4aAtHPG2neo0YBkAL+WnZcQbi9aSto1zaW4lRwBALy8dE9w2uFVGXJwxSyMT+EKyJgLbswUjivFF5Xpeif1nls8xHUGRPEpflgA/qypDzbADn9RfTJ3PlkhVCeZW5RPmM8pEH4X8l4NPCHkR5nu8ayU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHqeG5xN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHqeG5xN"
Received: by smtp.kernel.org (Postfix)
	id 651CFC4CED1; Fri, 14 Feb 2025 15:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CC6C4CEDF;
	Fri, 14 Feb 2025 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739545798;
	bh=tqcVhVvsFrGt51X/4fZXwRdnGgcBLn69HCymRTYX3qM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FHqeG5xNK3A1DYnWABWVzKfCDsrC76t++u3YCMYU7nQR7QqdY6PtmAo2D22AJGiwJ
	 ZN53Vvo3hIBhsY2tZDxh5+PaAD+VQkHdmU6aDk1aJFucj57hTvjy2mUzi5G80VDldF
	 ziZwa5s4KNMANqe1FsNJ8J54bf+cBo++zp20NY9YPMsx9AYEAsZTpjZe/v0VEmCFQs
	 G9VGO+UCVDCidygQiol7tgjJ3DmiI+92/F9H+ly2Ik/XLIAMoJQxCnUMFgUS5Tcg2c
	 wB0V0Rdzh2F0aFDYUKESgBuO15HC9+nS829OTSz/yJRMEDqBLQfIMWVUCQD95kRCNK
	 pwIsCrcvvkWsw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC0C6380CEE8;
	Fri, 14 Feb 2025 15:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: arm: apple: Add myself as maintainer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173954582777.1980112.7071625847233698700.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 15:10:27 +0000
References: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
In-Reply-To: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
To: Janne Grunau <j@jannau.net>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 08 Feb 2025 10:22:01 +0100 you wrote:
> Sven and I have agreed to share the maintainership for the ARM/APPLE
> platform after Marcan's step down. I'm handling the downstream Asahi
> Linux tree since April 2024 and worked on or wrote several drivers for
> the platform.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: arm: apple: Add myself as maintainer
    https://git.kernel.org/soc/soc/c/f0570fdc8f72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


