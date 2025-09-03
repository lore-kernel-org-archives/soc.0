Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0495129D0E
	for <soc@lists.linux.dev>; Wed,  3 Sep 2025 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756929004; cv=none; b=j4EE6vsk9f5x+M7K6FAFOWZ5FXNht2KL6L+vwuxXCrdJCwwoGaRNPcvKg9eBuKN1h0ZOFTNbQu04QpQmId6lrAtkXGsz4bST78hvgEw3MbYlWG/iX+0m+0IdXFy9lMnald6bJFSlqJ5NT0C3SA79muYrF8I0NUyOiBkReJ6MfXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756929004; c=relaxed/simple;
	bh=e6CrO29KltWb2ai1d/RD7jAJlmHdnUQbFsMB+r38C/k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RNRdd80louchmn0/k4CrLqa6ZFtvVQt9EV8MXCiGSWTDQZNuxGrscEjJKolf+8GqNvt7n4PMILcCvA5/TPsjzLCEBgFLX2nXfvxzT7x5LQDbsSlb3Wi28RfBuvJfwgq4FDeSPPS9BYDmKVdEKxsx2mrb771V30blcwYGt9ynUCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuxaKQlQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuxaKQlQ"
Received: by smtp.kernel.org (Postfix)
	id 82D91C4CEF7; Wed,  3 Sep 2025 19:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB8CC4CEE7;
	Wed,  3 Sep 2025 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756929001;
	bh=e6CrO29KltWb2ai1d/RD7jAJlmHdnUQbFsMB+r38C/k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XuxaKQlQ6mu99mGtzZ41KA0CGG8pK5zAhcIOT4gp6+k3jfsP/52iwsB1YBssEqt6U
	 oTznPc6CTdZ1VLN8OwbybQHYTwBCzTFqfeJsxJqcD+1vsPvTgwhAJwoAF2ezHrFQOI
	 ToEIBJzZCnzU7HzBP9d+3vbUhsNFTx1s1rIY4gBlVCsjYi7F5h/yAvoLmS7P5D995T
	 UtQcEkcVIopeb/calgoAUnTQynxo6xmNjnu0Pkabx1N351IXzMb9SMVudWQk+4p+t+
	 syvrifbcre32KsOmgqKZ50WtBtw6szTWAC5iXY3FWOC1jmdkkziPfj5fnZ11QkIQ7l
	 9Cm5k181xHHgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0F3383C259;
	Wed,  3 Sep 2025 19:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.17 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175692900650.1180377.14254442150146415976.git-patchwork-notify@kernel.org>
Date: Wed, 03 Sep 2025 19:50:06 +0000
References: <5909239.Y6S9NjorxK@phil>
In-Reply-To: <5909239.Y6S9NjorxK@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 03 Sep 2025 14:29:49 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below some Rockchip fixes for the current 6.17 release-cycle.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.17 #1
    https://git.kernel.org/soc/soc/c/f2e8f1f5f5c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


