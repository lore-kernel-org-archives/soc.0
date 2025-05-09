Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A5235072
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826216; cv=none; b=cpxesMXpgncizR6HZ53pznDtqBBsLJ/rvJub2iRhr9hiwjcBaAwo4wZXTkuowmU4dCExGP9p5AB1nGgWiokRad7PXg/i6WOfNI3TVeqowf1d5RasMvXl2uEQMlmKyKs8xcHGPHWjs3o9JhC0JuVikiOdwYreuZmyqg+xQ4zMRS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826216; c=relaxed/simple;
	bh=5vleXnbxyA1QP0LOR53AUCWpcdDYPVjFHO28va6clPA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NAjNQp456iAy8yUVQF/6qw6NBHkLXjoOc5TS2QyOh2BQTtoXSl61XV0tUIqgrNX3nKF7PA8kwJUCIYjyeOJ99WsICP+3JiGAhvG0TqskPxd2XvBOiD6oikcfy4kkK1VcPBbwIKgfl3cDFRcy4GYh3T7vCblZUg0wkWfwtLycFPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uar2uNp4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uar2uNp4"
Received: by smtp.kernel.org (Postfix)
	id 12CAFC4CEEE; Fri,  9 May 2025 21:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F158FC4CEE4;
	Fri,  9 May 2025 21:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826216;
	bh=5vleXnbxyA1QP0LOR53AUCWpcdDYPVjFHO28va6clPA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uar2uNp4vCR/kUBZLeiP6MGkWOWAZ+9W/kTfeBlCM97+pPA6MAr/8QNchy+Z+05/b
	 ECTCk0MQcV2OrqRoVA8vzmKbbRnbykt3fYDOL2qx6CasQbxUxuJYagd0Ely/0IWKJ+
	 OhAbWc4NVVDgT0ChkbSm2coiEu+ETeLB3icTscdLMxwBzsscBUMbzuEMo/psJbMj3P
	 wwa5j9R/v3dGoZiwlucSxgFnjpym/q35845JUpN0KlalZjTPCazXQGiSIlZbIAjCpF
	 c3YhXTgbMM2eeYgzAYuDwLFH6jN4RIt28IFt143UhvS+JTT3ctyXRA6HppCo0PKN48
	 AxZ8iEdEN2S1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B9839D61FF;
	Fri,  9 May 2025 21:30:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC device tree updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682625425.3817276.5251903623137999497.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:30:54 +0000
References: <20250507160827.87725-1-sven@svenpeter.dev>
In-Reply-To: <20250507160827.87725-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  7 May 2025 18:08:27 +0200 you wrote:
> Hi Arnd,
> 
> Here are our device tree updates for 6.16, details are in the signed tag.
> As usual, these have been part of -next for a while already.
> Please pull.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC device tree updates for v6.16
    https://git.kernel.org/soc/soc/c/2f57af56366a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


