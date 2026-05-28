Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC7E30F92E
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006209; cv=none; b=jhfu/Gh1qukMgqKmnHfOw1PJMI/bPjli+KjDU+EC85XVgwgHIx5ikplbPReUgAslRzvEbXDvuHdT52V1HE/waKCDvzQhIJqLKpauFEytnmTPQlrGKmxvqpmMUWoq9nmt528KPsHhCtpMWRd2/VF5TPnvKFn/WJo5m9wdWEE5B5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006209; c=relaxed/simple;
	bh=AkfTu10UvjJE1cuP20xE6uOeLCiWqX267mUSor3rkbg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o3YHNxthTJSi3z2UOEp2d4+tqEdZbgTAumgPeoeXdObgiSIj54sl5Yi0cxsmdxvVxknkOiyrirssRqzc1JXi0pY81ZrZ0Zbm0k+8G24xtCBmuv22WuoXVg/IE4KP6isn8y/J40Vg2x34kGP6LSAQ0poy+qyK70WqSmy2nE0yfcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/NgHYnw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/NgHYnw"
Received: by smtp.kernel.org (Postfix)
	id 3FDFC1F00A3C; Thu, 28 May 2026 22:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2611F00A3A;
	Thu, 28 May 2026 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006208;
	bh=A0Wq63314bfx9aJcJqvAsoVp8llEEiOyRsp2MbvpvYk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=n/NgHYnwIZZL9SFrcj3iykb75b9dxRB62bfsLadVYsDYHflkBbKsu6MmroONG7hU8
	 SuI4F8ho9eF+kCo3hh44BuhjCi9durazoLQAAf0BIZdUZtxwyAED5vg29t2vGfL5B4
	 bodgkHhLCUXdpBAbrDZsMKMAPSAkIBYphqVE5zRPWr6WUH7FlA+QFjDXDS2OF2PWIn
	 PIZrTiGaIPlMvmtwCJJhRIuK+uePOHHLEsVWwlgwKP4aikXcPPkDuhQNR2umD+iVpA
	 /q+RRnB0MhWzAZc1LIWbo2tqxWgmwk3cdK8Ti4RQg+Eg5n3NlFdZIbIrTLTCepk+KE
	 kVx2mRa6RW06A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93E403811977;
	Thu, 28 May 2026 22:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX Soc fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000621213.1533055.11780934259464309326.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:12 +0000
References: <20260528190555.3779280-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260528190555.3779280-1-Frank.Li@oss.nxp.com>
To: None <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 May 2026 15:05:50 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX Soc fixes for v7.1
    https://git.kernel.org/soc/soc/c/04e12996daf1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


