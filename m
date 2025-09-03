Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C18C29D0E
	for <soc@lists.linux.dev>; Wed,  3 Sep 2025 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756929005; cv=none; b=Yff786YfHVskpnIN+JJw0nDC1vUNtyc8i3lZ0VfrtBYvPLb36CIbbztL72MHGJZB/mTsK3GyHe6LN83YaLFcgyCtXpcvgYIH2yuC9nqpjMezq1Kjwos//06JxqhxQtddA09t1xREHSKKfo+oQk8kuPiZjVugpR+/9PpZTlpWXwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756929005; c=relaxed/simple;
	bh=iTAVhhhcY9k6X6w20IvtJ/OwtRPOUq4IWb7kU+9DTjQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jRq2j2c2qaZrjEVI9MpHvdF8YWg4IXzRXTuaE/oJgykYHybVksf3pM0ocZmXEY2bqTHJGFz2xfnyL1gKPfuNZSfki/9mq927syHdoqY/xsw/dvlAqCrEHA+xnINCPMTTQh9vrK5biJNbJRiRwv4ub70WUjL+6p9ghNwA3KPOZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2wu7PVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2wu7PVY"
Received: by smtp.kernel.org (Postfix)
	id 3A745C4CEF4; Wed,  3 Sep 2025 19:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BD3C4CEE7;
	Wed,  3 Sep 2025 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756929005;
	bh=iTAVhhhcY9k6X6w20IvtJ/OwtRPOUq4IWb7kU+9DTjQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d2wu7PVY0SNJXx62LWh4+dfmtKgpnFuUp6oS6EaQ1chCUH5i3E7UWUrt+1xx2N8e+
	 RZMKmHisgt/XdvhOb7mTwDKNm09jhipSymAWFEDf/B2kzzcwMAd6PRHfSM3VE+m4BK
	 NswVcYL0U2dUrcoDin54+6KOZIfcZ2GVOKcsnI1x+Am0HAPgWtXySbuNPTs35m71lu
	 b1Nj5SCNQBt7oZMs2QHEbOMOx6AjQl+w8xNFatW19TTZRljq13QNKVk9xAZOo7jL8p
	 qdIwFJrCTn461QzxmllrSLHHe6eQ4CBbUufAPeOc8yzaP5ANRBK16EQLkzO4HYzRpo
	 +HOLzwSE75M9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71720383C259;
	Wed,  3 Sep 2025 19:50:11 +0000 (UTC)
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
 <175692901023.1180377.13169206247574343920.git-patchwork-notify@kernel.org>
Date: Wed, 03 Sep 2025 19:50:10 +0000
References: <5909239.Y6S9NjorxK@phil>
In-Reply-To: <5909239.Y6S9NjorxK@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


