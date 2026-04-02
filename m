Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8354346E7F
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169058; cv=none; b=TV4rrjgNNT5AMqKddEB4QkCinA/V/iQoC1HMd6IfXOC2LV3i/7OQDxqxyMYSqy0pB8Zdqlrc2bUkaeHdet55rGHs0D+IQF4nggnQpHX798+Ps6J2RagRuFRM9CBHyQyfL8wIaKdZ4mYOCg8D/pYndAcp5Vy95JnUX0bCQI23W7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169058; c=relaxed/simple;
	bh=bGcCNAiu2fzyKe/nY1A4X0WwHbI925V1R/Vve9D4moA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UV+R/8YQRczwWiD0XjTvNB7kyhHf6dwOAinouzB8wUeVx2JwjuP/j+l0TSp5xpD+PYROYQvoWSApkD16Hc2oZWg6eWc5kq2FqWcucKlG+ercTCWjnvj4cEWDeAe/aIVFuWKEapoPH4eCmpdR5nsThOM3ief17dp9QdXdtKLuP0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feWG9Ym8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feWG9Ym8"
Received: by smtp.kernel.org (Postfix)
	id 9F833C2BCAF; Thu,  2 Apr 2026 22:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4F4C116C6;
	Thu,  2 Apr 2026 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775169058;
	bh=bGcCNAiu2fzyKe/nY1A4X0WwHbI925V1R/Vve9D4moA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=feWG9Ym8RshZW41Nfq51/VEo0dBMHLjcGmTCI9vNQQEytSUOzm3z95yWdXiDIm0eB
	 5tS++KIrij6yFVSRRxr5j0UFR5uWODcpfkkejJABG15826Xlh+4K5otTOCm0L71y/i
	 f89OLmmk5Mv5uJP//Ve2Z49mEt22vkp07KRAuNsoc0NDrc0f3+zVbt0q0/UGrT0xkT
	 MrokPmgagZQBOBW7PalU4r0Yi2sBqaSDT3aTzYHrxSlqhdS/0m+HuUtGfswrpXeEHq
	 FN/61LNUrXdbWYahjxI84TVC2NnWPNaYg7ikAZc8UidU04+tvYGOopw1dP7HVoW679
	 g5q1IBnnzILZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02FC23809A09;
	Thu,  2 Apr 2026 22:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.1 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516904078.642994.7142878223704424653.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 22:30:40 +0000
References: <2902697.BEx9A2HvPv@phil>
In-Reply-To: <2902697.BEx9A2HvPv@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 01 Apr 2026 23:27:47 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below some more Rockchip DT changes for the merge-window
> for 7.1 .
> 
> This time they have also marinated longer in next without complaints.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 7.1 #2
    https://git.kernel.org/soc/soc/c/13c4068f84d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


