Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657DB33AD9A
	for <soc@lists.linux.dev>; Mon, 20 Apr 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700807; cv=none; b=Xr0aSR9zeSqcniUCWxAjd0KuCjU1RKcFQDuSLrCo0paeWB+dbzYR6x4o8plRPdwYB8QXR8DO+wUrmet/maYJMj/+u7VGmbsKtPb3sFqythyAfmiyXsYlrioG8gbZtV8K4Lhsd1laXaGPzJRanMQVN6zS+GaQnomVw05T8HbaByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700807; c=relaxed/simple;
	bh=JmLTuD9jnL0n4MX5VDDguc/FPkBmkPvMDipdYiNCrv4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l5TRfjOxgDgKtLkCI2THW8HFyRG9bCl8FOxg/2EgYMAnx5RQW9itqCltNEcV9XLJQ3WRu6WKtPp2WaE1GxWOvOV1G2mGIu5nvEiMeBMrH6oO03e9yHRFhKJn+bj8jIiPA3b5ieeylOUOybYo7vB82VkbWTI/IsY3p8L2vcT4gzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZ0QrGxV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZ0QrGxV"
Received: by smtp.kernel.org (Postfix)
	id 425F9C2BCB6; Mon, 20 Apr 2026 16:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C777C19425;
	Mon, 20 Apr 2026 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776700807;
	bh=JmLTuD9jnL0n4MX5VDDguc/FPkBmkPvMDipdYiNCrv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RZ0QrGxV8yemA0bU0ckxmkXa97MJsEBPpNNwhTsNO5KIXjVlSpDUiN5cK68vUcNiV
	 m6hZxM29j6aJK1HsO71KyeiwxAg0s+LAYv395mp1rvamd/Ib+9bpkDbtu2OiRmwM06
	 ySfeJTj+M78qljQr773xKLWbEWRjYDBYjhOghevvp3011lC0aW7GyQ06FrDvzVaA5I
	 4kzTrH72Q3oumsWOcHXJhQlVaKH3hf0rJKqbaceLK4wiarOunaxAfqElTCMvJ3Rbgo
	 31hvRkzypcB+ARMRGHNBywpUpwLRtgyYaCPdETbFPpW760xIgNLfuhDe7bxnsMYz9E
	 D3ZSHKSDyT33A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D67393000C;
	Mon, 20 Apr 2026 15:59:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC fixes for v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177670077157.1706382.1847638175573466703.git-patchwork-notify@kernel.org>
Date: Mon, 20 Apr 2026 15:59:31 +0000
References: <20260414202428.5278-1-sven@kernel.org>
In-Reply-To: <20260414202428.5278-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Apr 2026 22:24:25 +0200 you wrote:
> Hi,
> 
> Two fixes without any functional changes, they just update Sasha's email
> everywhere and fix a typo in a dtsi file comment.
> As discussed with Arnd I'm already sending out the PR now so that you guys can
> decide when to merge this.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC fixes for v7.0
    https://git.kernel.org/soc/soc/c/d21877ac2766

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


