Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F3B1E3DC7
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644370; cv=none; b=TqLUg+h7RdO9zM8bXx5DWJcZH573mveAjEBfWGuPAb/ILGDYEi9RjNPnw59kroH9eGA0/Vvmw52A9YCblVzWnMm+vQDVI6yjXKhCvcTtjiod0fYBwAvlt8FjMbHlsIYRx9pMTAkbrHFQWBhPe9wW+HB0JyNerTzEa91iNXewDFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644370; c=relaxed/simple;
	bh=25BUKmwNMKAW73pLZIooe3smVAuNWk9Whg3x34PSmQM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VHZg3AK9/ZpUenw15VoI0lgRJbjxtfvOfFHXw83F3VZfC0vr2ShShOW5VdlspKOv/qExxCmKDTq351XiXjoHWePRd17tHDCAenqbUWxXzyPsCb8d1FxqRNFgef2kwmV1Z3pyJbuVZ8qOS29Cwr/NR8Z8doKe274QWmSdztmPjTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGLndgSE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGLndgSE"
Received: by smtp.kernel.org (Postfix)
	id 0D10FC4CECC; Fri, 11 Oct 2024 10:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE84C4CEC3;
	Fri, 11 Oct 2024 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644370;
	bh=25BUKmwNMKAW73pLZIooe3smVAuNWk9Whg3x34PSmQM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UGLndgSER0jtKO3wnNVjUlKqqfIx0icVfhcoxoLjE1/VIXpu4H17dTiZZ1aQ4dIjr
	 MPxXgKbJ8uB7kfP4prGHnqOJ2yr5rkHkP8G2yxI4sSR4Jj6XwAIkj1QyYlMjJKhlss
	 duU0AaUG+/QnEa7DMw3vl2IINexQKlEmVUchashMtxqfHSSNTUTWsWufPGaB8pYwJP
	 5eiZxdB351Vn5QYgj4zyB4do5vI88wYcFMT+J2KnsInLtdco/extCO3KzkEHM27v/X
	 OI9glJ9DwrmfhfvDbnxFrjkuEGlIt/ZQdltBwWQTpSxBXiqjFrsS9DrcITwPyn7ZPx
	 Iy34/Ql/zts3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBFA3822E4C;
	Fri, 11 Oct 2024 10:59:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: cirrus: use u8 for addr to calm down sparse
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864437428.2676212.16556423454335221544.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:34 +0000
References: <20240922065212.7483-1-nikita.shubin@maquefel.me>
In-Reply-To: <20240922065212.7483-1-nikita.shubin@maquefel.me>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 22 Sep 2024 09:52:12 +0300 you wrote:
> ep93xx_eth.c:805:40: sparse: sparse: incorrect type in argument 2
> 				     (different address spaces)
> ep93xx_eth.c:805:40: sparse: expected unsigned char const [usertype] *addr
> ep93xx_eth.c:805:40: sparse: got void [noderef] __iomem *
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409212354.9CiUem7B-lkp@intel.com/
> Fixes: 858555bb5598 ("net: cirrus: add DT support for Cirrus EP93xx")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> [...]

Here is the summary with links:
  - net: cirrus: use u8 for addr to calm down sparse
    https://git.kernel.org/soc/soc/c/878716d40cdd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


