Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9322B8DA
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043311; cv=none; b=TLTrNfFilDsn+20htfNIwSQOfqrl01XBvOBFVFZp97LTxxOh0oLmxeU2oxGe3Q1SngmhLJwxAX9DOeLQ1S23ztDBuaUkSz9x4CBWIkBds8qz7XwcHqHVOvlP95ge73yf4TRAKqFu4p9eXvx/zWtQDBsu36WsUdt2dsQNA6zr6NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043311; c=relaxed/simple;
	bh=jn7+U3xpUaZm6rS5GUdFeT6lwfUTKX9bN7qEW95eZfw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tOd+u7qJzRnVaopM3jZEjRO1cV+ROehAuO9NijtYi3NcO8K+xMON4iDfuSbP/9CeVWJnuFu3WQgaQ11/YZAIwf2GxKSh0q5XkkiYQduu9i7A451ahxfI4Q+t91JwW5Ypbi0n1u4V1F+8Bgfa/4enuHkqLu+NKi6aNxNtgXHaXNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFQQqqWD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFQQqqWD"
Received: by smtp.kernel.org (Postfix)
	id 32637C4CEE2; Thu, 16 Jan 2025 16:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD84C4CED6;
	Thu, 16 Jan 2025 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043311;
	bh=jn7+U3xpUaZm6rS5GUdFeT6lwfUTKX9bN7qEW95eZfw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HFQQqqWDnWyJTWkPJjJI40iJoIWQHuNGz1hRcznhUwdm1K1nS4H9pISqvEpbGL1vz
	 3y7hsPvaJaxzWX1FDEiBCiRexPWsDVYHBuPYAds2a0dk4bdcWIy4e6gRD6ssoOXAYN
	 n+qmb+OYfVnE0byL3bJbdmWbXMsmNfQJ8M7IKtBIqNVtMBlinO4BzjdPPMp0eaXQTC
	 C4HssADxof8blvae6lu55BL6oMZXxzJKTw58mSessLWH195aruik06536CPvajJAb9
	 2YkXeen8blomgwiPrsXm5bTJhuhqORFXvbsi3QKxmPooHMQx1v9m+F3XuOUN9vngsb
	 HChOTnFpKYw9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C04380AA63;
	Thu, 16 Jan 2025 16:02:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704333395.1501791.1148755085190066061.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:13 +0000
References: <20250111181025.394631-1-andersson@kernel.org>
In-Reply-To: <20250111181025.394631-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 11 Jan 2025 12:10:24 -0600 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.14
    https://git.kernel.org/soc/soc/c/116eda2ec90a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


