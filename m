Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5C62147F5
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422305; cv=none; b=piXtMkQtXR4gPf5SpqAeKFEXnEi/mO3umlN/ANQtm6JH8pIKW4zZUKkql+wdvGoQ6Q90Y2mCCdRCh19NlDMkaZuUANDAfUdxe5UX5yidbJ/TuubQMfS2xBtgSJpB6FpVpG8PWy7UeUmLCItqGfnett3Qf03ikkYgtT6MnvO2fyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422305; c=relaxed/simple;
	bh=0ffKnnuj+ew4uAs+VIZKeabWa7x0okw9RcMDxAgDq88=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BTBr1pp2KTcCZmdXuwOVaTHoxRrrvhsQQgA6ylEn6PQdbQvHuj+UFLXdlpZys0gKqHawCQ/8yfWNhSY0agwRBLYpwsSamtbe6GFxjS+B53iUzNFb8RAweTpxQMT3xTkRPBhftAw08wKDximaAXaezK6ocadVtDJzNG6pEdb7OiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q+CtTgKs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q+CtTgKs"
Received: by smtp.kernel.org (Postfix)
	id CAA3EC4CEE7; Wed, 19 Mar 2025 22:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DC4C4CEE4;
	Wed, 19 Mar 2025 22:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422304;
	bh=0ffKnnuj+ew4uAs+VIZKeabWa7x0okw9RcMDxAgDq88=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q+CtTgKsWsiuSGmbBMktvVDO8EZtMSiAwT2JYz96nti4KeJ0ipIF4049GKScl+wdN
	 QUfDAOZEaHKaQ6Ojp7PPspJDQVMXCv6n1xcul2z0LpdO2Y8ZluZcCV3uZIizHnX8HV
	 sN7H0RQfUX9K8KS87xK1cQ9iODf7VpwiKBbOHq8/VGklCaUCYnkPF53ocZUugXC4Sh
	 BDeaWWkoefkTH4U1kxbfJrOSMcFV0RrgvrVMvrTyBHAFUaCHLy0qSFOwItf1LlkWx9
	 36l0OEYfrs9Rfq6s6HQEyUfsRwO7kw2tWS8ybCTAao0ZMtjeyOmgVmQj7eR41lt7iu
	 HAbLR9Zsc0mxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE8963806654;
	Wed, 19 Mar 2025 22:12:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242234024.1211847.17124941720184361821.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:20 +0000
References: <eeaa8d3b-4fc3-4dae-92b8-0fc590e1a070@linaro.org>
In-Reply-To: <eeaa8d3b-4fc3-4dae-92b8-0fc590e1a070@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Mar 2025 17:16:08 +0100 you wrote:
> Hi,
> 
> Here's the GPIO interrupt controller bindings & driver, acked by Thomas to be
> merged via the Amlogic tree along the DT changes.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Amlogic drivers updates for v6.15
    https://git.kernel.org/soc/soc/c/c6325a2e26d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


