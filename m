Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9E51D530
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907820; cv=none; b=m0CvyTJATk5MBYrnU0Jd7tWNSi2MMkTLWxo7BTIxGt4EG2n7k7RO9baNlDFIsMlC+Vf4OhhvlUD+sRiQHCdM8dgJYiw9EPljfS8ADArtrpK64GzlcY5yiZ5rZgzT4Jku4Enrww+xiEL9fHdc+4MSSOh9Rx/5YLfDmDuVp7MFbtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907820; c=relaxed/simple;
	bh=gUZstf/kLWIS7dDi54kX4GCtodDSbQ56zlQxsE7UdUg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Hsmbj5W/kW44ySCPOg4pws5vVs6cuqdNOJd1w3rq4+RM9bcjfxYsUpgmh7lEEgnNGe6/vTQbBTCbiLpMyD/v7zRVLseE9HkQzn56BdY/MtkQze6aonLFWGQnCBqikxspKRIVQikz7PJxgyJ2KoDDLYTWmePBLb6oLOTlz/U5fV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQozmVPX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQozmVPX"
Received: by smtp.kernel.org (Postfix)
	id D3D131F00899; Tue, 13 Oct 2026 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCF21F00893;
	Tue, 13 Oct 2026 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907819;
	bh=lQxbp71KD8HMqDs3/DzYHqJdNxS21I9RJrvDzC9AK54=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OQozmVPX1rwlqdgJlOBk2Bv3yZ1KPNd7L5iDmdj4n9KvIzkVBj50BhvrkQKXIGG1V
	 T3QWlEuQ48uNCQquQbovzDF7JAZLtbauFGKMoSRNgXudCA497L3riNoL/RnpHfnIhk
	 SVkUoOlrpraDwaUxk8HkOE7/3gj2rInMf2MBP0zOtz1hyPVsImyHYPQuoVbCVK1Q/P
	 O0tZLwj2YP4gLRTcCFOncaNlnt5jlKqn6K6hY1g0/4ozutKKMdHssaoBbio9ybf1qF
	 Bc7nElQ7QNaPw4t7T8PjuF7se1auHf/H/V12yIIAuHD69I3Gc/xNh6MWBt9a4qP/tZ
	 VdUBR05n9mL+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B435939D5FD8;
	Tue, 13 Oct 2026 16:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Amlogic drivers updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190781821.417156.3440700625473080006.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:18 +0000
References: <a1f0aa7d-be6b-4229-8345-66595a47be74@linaro.org>
In-Reply-To: <a1f0aa7d-be6b-4229-8345-66595a47be74@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 6 Oct 2026 13:01:29 +0200 you wrote:
> Hi,
> 
> Here's drivers updates for Amlogic SoCs for v7.4, mainly clock measure
> support for Amlogic a4/a5/s7/s7d/s6/a9.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Amlogic drivers updates for v7.4
    https://git.kernel.org/soc/soc/c/a5c3d987fc55

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


