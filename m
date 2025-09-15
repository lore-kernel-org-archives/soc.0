Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF4572639
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944267; cv=none; b=EeQ3PAsypBZLphk3c28JE4sj5IlgJib0rTgyYvOY4bmEbNFOLgswmPNWkOhlQX2OjaoYFda5MlgGn5VkyylvvGDX7AakLtCoRAhI3tNIZ27uy+Ug/tConuaUF0244ow23tb30IWiyDHknwRlkeVSaahhSmQ0ffYOOzZbSLIYV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944267; c=relaxed/simple;
	bh=wZxOxdPvWIMrNWvnVhA6Nz8ZY6o9POnBmK1bs1f1QIE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Cq0x+5ltW6EwumE8KBsIFPlmjiBrNhNdcJTSNoWky+88G7e71CXGcVZDStR1aK1TTYL3iBQiFmbIK2AS9cxHZHhVvVJWYqXRT+gC7i6VPCencCmGBx+ZhlCzQD0I1U0cgyQtpV3ViOK66XCY8CPoySvvscQCUqcLB4E1w3ThWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHKv31Qg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHKv31Qg"
Received: by smtp.kernel.org (Postfix)
	id 52438C4CEF7; Mon, 15 Sep 2025 13:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF4CC4CEF1;
	Mon, 15 Sep 2025 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944267;
	bh=wZxOxdPvWIMrNWvnVhA6Nz8ZY6o9POnBmK1bs1f1QIE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FHKv31QgU2Di6Yvx8LCmIX3Q1VRv8KuXm0uEfZm69nUvKTiH/bxT6E0haSxGsPcod
	 QT258Sou/HPmlyTrk3C6Wn8DZTRzJVqOAs1xtBazsnLsWECqfrah2y5kOwjtW+wfj6
	 xt1LyMeP3yUkKAnifAO6eETAByrOBTenUI4zTwftB5iGP/F4716/nCn5gEeTE7Aof0
	 6wASeM6x3Tj5xeIhIJ3uLnFJ7h18SFA7o628Ckd96wDMFYIiTiP3CY/okPWtDQqrGZ
	 LuN0MI8s34W1TdxaYruCFU84RrEx3w6u3dUqurdQ9/F++BioWEYTWC9UulsXFnf8Ag
	 kaCOvDNqIVMug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC4039D0C18;
	Mon, 15 Sep 2025 13:51:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794426848.4179625.5122171344350443597.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:08 +0000
References: <5241735.C4sosBPzcN@phil>
In-Reply-To: <5241735.C4sosBPzcN@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 07 Sep 2025 18:47:23 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below and in the next mail Rockchip changes for for 6.18 .
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.18 #1
    https://git.kernel.org/soc/soc/c/46cb19e52ac7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


