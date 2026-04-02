Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EC6360722
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165436; cv=none; b=jlyOO0Au6FzqZbxu+9BecqcRZhUBP7kpE92+gM/f+q92e8cGJDeipCISzZzSbYDv/aXGemFF+SBVsDzoytxzZbJuaQe5eFfG6tV1OVzrAikuVsC7HxNIL36yIt6pfvfMLveJFcsPWBoUWsKPga9CNHeaHlIDHo1MwNVmVD0qF8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165436; c=relaxed/simple;
	bh=j4hxc5tiRLNX8uhpfbm1WpfvzXnwjNY+7mvnUjb6LoA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QSwTjRGJX2gdwnbPVSZg9txru8SMcGDoP7wn6yzrqDYSJRvAH/Am5EyD0KshN9omteWLRiLPLf1hIkUnuy52k+621P+80X5ATntiDyXilRMskfvrUNey5SLZUTFBCyDoQesEFTHOO40AzLrFUS94nImR5OBK9ykVwFcOyAaamys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWh2xHpM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWh2xHpM"
Received: by smtp.kernel.org (Postfix)
	id 67200C2BCAF; Thu,  2 Apr 2026 21:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51926C116C6;
	Thu,  2 Apr 2026 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165436;
	bh=j4hxc5tiRLNX8uhpfbm1WpfvzXnwjNY+7mvnUjb6LoA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qWh2xHpM4r4BRe1gvED+B5g8MHkWJiaL43vhHOj27YzloZoA7JsiQffI5ik0YfLrs
	 6n5oRecXFY5QHyKNKgbRdj749JkuspNH4Dh5T9iTPg5w29BgId9g1U/Esy3uX7GFNj
	 fZoBTxiJQBT7TB0qTIe/bUkdRBYAjI6rXIJxWSlGBjLkNwQbe0JWNFSStFm6MuosGD
	 4avFpt/og6CahKSDSKQIPRNOErTVqjMCd7Rmn6blhpwyF2weNj/ehpbDH/T1remUc1
	 btbUv/2OylbJBYEgcqZAg0Iew8d883RMsR/SRepkCMu9PVaCzfx4Ei3IPd4tcTd8id
	 w1yTxlkAqd/PA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E983809A09;
	Thu,  2 Apr 2026 21:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516541853.623252.11386778479718700515.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:18 +0000
References: <20260331214741.966509-1-andersson@kernel.org>
In-Reply-To: <20260331214741.966509-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Mar 2026 16:47:41 -0500 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v7.1
    https://git.kernel.org/soc/soc/c/a66cc657ef52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


