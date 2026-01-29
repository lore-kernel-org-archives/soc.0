Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4621DEAE7
	for <soc@lists.linux.dev>; Thu, 29 Jan 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680264; cv=none; b=DzDkEoPSV9cuK2D4rSb0f5mVZVLb2+XuxBYzXweeiKlERqKc6XxGk6YrQ23q/+frwwOZC76dcojrn/nJl2FQ04FOLVRtswuyBjT/Pp4BkXEK3wKpGS9EGbMsQ3U9Vixr+w+a0S3IyLqstTW3+WMICpn+3UgEkCo/gxtvSfcFXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680264; c=relaxed/simple;
	bh=2C49EdBwgK1V48VliAsHVquOq1bjIxGVyTUK9upmnt0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tA9uoBfGlBxFYM7qysAknXXf9VaRI9CzCT/5cxy+qE/kTT2O3wlvhIdi4K+L9b9Vp6LPnntPIbsEeC8wO+pRpMLkGfzAJ960U+ret8AsWxJbCutoxZFtS1uCkdRI0/c87+0nz5fViOmIYts2sr4ravJIa2Prp8kji2ZmkZQHY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHjyhw3F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHjyhw3F"
Received: by smtp.kernel.org (Postfix)
	id 1DFF2C116D0; Thu, 29 Jan 2026 09:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083EEC4CEF7;
	Thu, 29 Jan 2026 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769680264;
	bh=2C49EdBwgK1V48VliAsHVquOq1bjIxGVyTUK9upmnt0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KHjyhw3FM9KkdTrngcjQuJJqgINLYZOj7LoA9+4xSgMgb0oelcR9sH/E05dM77rpO
	 lBZbEtss40Scv+dYerdUI+AVA2HoicF0A3z+1tMPcDG2oXsDHgn3ybjvTAyUWakgAz
	 +5U/S85K4h+nVmmCBN1Q6jnufyrYkklO4fxOwyJtwAx3kOhRkHgxfQa9YT57kNiWTx
	 cvVe5YREoLccavg6G/TXcOVLuyk2o5gsVxvu7MlE8UWZ/gDzbFfrx08pRN3fpqMjUu
	 hyVzesmcaqksKsHU3bwlSN63ZVKFKa/0KdcCjmbVyMRKJkvGGsajM8mabocKFHqtt8
	 ko8h4rR0Nm55Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4ECD3380AADF;
	Thu, 29 Jan 2026 09:50:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of hisi_soc_hha
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176968025711.2433421.14649472699154233423.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 09:50:57 +0000
References: <20260128-audition-professed-31d1b66d5b4e@spud>
In-Reply-To: <20260128-audition-professed-31d1b66d5b4e@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Jan 2026 19:56:31 +0000 you wrote:
> From: Yushan Wang <wangyushan12@huawei.com>
> 
> Add myself as maintainer of HiSilicon SoC HHA driver as I will be
> responsible for this driver.
> 
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Add myself as maintainer of hisi_soc_hha
    https://git.kernel.org/soc/soc/c/c7e45aa0a91f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


