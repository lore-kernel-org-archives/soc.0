Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42E4188915
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490612; cv=none; b=GXiBXdK0wYrHoRP4YRCLJ7TuJSZd2gnVjI67mrRUTHOLNZk0+s/NPiYGZebJwomhZzWuDkR0BWCexLG+tFfXyFM3ZTIuXQTyz0QhpQLinUBMtEeBk7RbGBNwtPMUtHP9IbgyjqreJk3euORwDnbNyeXBekgxaZIclkSqoSMbhK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490612; c=relaxed/simple;
	bh=IxCbkVdEn/PYZFwTaeHIY9gvkwICpUTctMEDfgYn1dA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Xd3t5YQWG4RdsjLIxJnFjymkMhlmcIfbBj4Ixyg6g+N0HwsVv7RcUvnCODW0OMECaasiUYlQIR9Ytclib/YKTlBk1kZrq0dpVTf20MihbIcexHKT1eIbThfmyZDeJyBjqYSz2/h9TXGsvTWZZuhW8/EPHIMKokfu97ERUhGYO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8MCqq6c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8MCqq6c"
Received: by smtp.kernel.org (Postfix)
	id 7B33FC4CEE7; Thu, 20 Mar 2025 17:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6449EC4CEDD;
	Thu, 20 Mar 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742490611;
	bh=IxCbkVdEn/PYZFwTaeHIY9gvkwICpUTctMEDfgYn1dA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L8MCqq6cHWBUxrlXm00tJyNSKXjnD5gbsnp1xGgQ1z7XrRhHadCpGScgwBlrjgQ/P
	 RPxxPjUdIYpSiThpDUnVtlqFNfHbsjv6TZeAjwB6hBoK1DvlE7NPwLcKFJMcVJ/X+c
	 ay3QGaaSPo2MeNo0P9a3R+R2CqHRWm8Sm+gnXvMN8Ep/291J4uj2YzfRcqMpZIl/oW
	 wIYC5Td6gxIDa23/3Xu8lW90PqzgSOqujSMKFszOdq2DWA8MSOt3nq2x3s4po+H6iu
	 3DEq/sEdRwxfBLUk2ToOLaITldkuqPbL3cEb5vHgzWkLW/AtTxW7pV5RyXE0xynzkX
	 7ne8qx0/p7nhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C3D3806654;
	Thu, 20 Mar 2025 17:10:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: ZynqMP SoC changes for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174249064694.1843567.17987656430600336319.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 17:10:46 +0000
References: <CAHTX3d+T+_zvwAVqGO+J_+Yia+wXAGsaEbPi1ye1AUYXoq6dmw@mail.gmail.com>
In-Reply-To: <CAHTX3d+T+_zvwAVqGO+J_+Yia+wXAGsaEbPi1ye1AUYXoq6dmw@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Mar 2025 16:05:32 +0100 you wrote:
> Hi,
> 
> please pull this patch to your tree. Tree is based on v6.13-rc1 but
> that shouldn't be a problem.
> There is no conflict with the latest Linus tree and also don't see any
> issue with Linux next.
> The patch is pretty much cleanup because firmware is not using that
> parameters anyway.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: ZynqMP SoC changes for v6.15
    https://git.kernel.org/soc/soc/c/2124055fb5c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


