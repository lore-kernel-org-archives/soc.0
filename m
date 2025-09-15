Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACDD1FDE09
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944251; cv=none; b=CS0asT3naLN3PPjZQB5yG+ajXW4TJLEsqRj/dMeaDX3F5JL56KqVwd5aqlFAYv6QnV/oxg0ojEHdqjNliiqBIa+Wqb8EiWDAbAqoi62PFl/Zb2B5Htgm8eLgT7ULmkmarm8vczWqIi64crO7KIH/nEnjeQGJIjVplgujPYnAbMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944251; c=relaxed/simple;
	bh=snUV1FQvwZkAD9J15xxslbvU2IqNpPgJF4xMAvmK4M0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Xxq8ZRn+MVkVmbqUr4xyj14CJdvuWV0WDjqnQyPb6V3vXCj3s7vvuzRksacshCwBlQTbEeHIejh304ddD4/qXx55Yuki4L8BkGKBzzmbOSTueQQxruKUSrc4hPNo7V1tsM6tvHvCAlVr1VC7Wz4+RWwcCGCmk8UvWvOHOBzDWxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufJohGiz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufJohGiz"
Received: by smtp.kernel.org (Postfix)
	id 129CFC4CEF7; Mon, 15 Sep 2025 13:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15D2C4CEF1;
	Mon, 15 Sep 2025 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944251;
	bh=snUV1FQvwZkAD9J15xxslbvU2IqNpPgJF4xMAvmK4M0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ufJohGizOHH6WAtiTGly87oN/c/bYTzYxXnK6qNVbGf3y9XyWQNR0hN2N8eBXPiXM
	 jF9C6Vm2i9M63Fmd1R8no4sQgFkpfnCmDOVIt9wEvlI2dFsXgpveodW/0lIQQuKfVL
	 IYS5UWDWf9IdUptrihFLL3BbSFx8VNBEQeVJqVh7bLXVsa6snw7gCGA3Az026luJfm
	 Ev6ffxtKDV9oUFg+Ef93nUjVDFMf09IhUqTe31XjM7Yc7xbhDfh7TWalC8EsI1+/Zg
	 in9we5ZTmfOvz7b3FYjZ+i2vy9yeWemD/CiNnP++yKMBHq9y8+CZg7OZ9y2ALh6uw2
	 O27a8NDoNy1ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC1039D0C18;
	Mon, 15 Sep 2025 13:50:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794425224.4179625.5597347685652680778.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:52 +0000
References: <20250911233600.3033675-1-andersson@kernel.org>
In-Reply-To: <20250911233600.3033675-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Sep 2025 18:35:56 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.18
    https://git.kernel.org/soc/soc/c/a3ef7cad8b53

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


