Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF532AD37
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281593; cv=none; b=A3Eiz8CiJjyNxwp8u2wPXTIXqbqnoKgDYWcHDO3iW7dFAbCRChppg5di/sZoS7aG2mt8jJgixqKSLeGTg2M020qvUN60rOwlDMohxjfvofKpI8k4E1SZYXUYiQMuTaO9iT92e+yWjaRb/DysrobLhlClkWePc9rRsQDBiZcOXHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281593; c=relaxed/simple;
	bh=KMDZFg2pja389ZCCMUfZ5jieoBNqOrrudYFHJRqAi0Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rGYCuJDTgsJldr7neyYQuGu4kAVGQQRFFi1ncqSd9oeAifu44htERNUHMQni0uG0FjnVqBJU57tLxBIHlZ8ciCD/2XtGjW4qWhqc5JEtRPKPRsHvsKhUUzgs3tH6yvIXba1mQq+rQp8E0luJt7Qh48bYNL3G/ivmKjRZFW/6spI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVqfYhLU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVqfYhLU"
Received: by smtp.kernel.org (Postfix)
	id 7D807C4CEFB; Thu, 27 Nov 2025 22:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D3EC4CEF8;
	Thu, 27 Nov 2025 22:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281591;
	bh=KMDZFg2pja389ZCCMUfZ5jieoBNqOrrudYFHJRqAi0Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MVqfYhLU3qlWFi3R5+oDDCM9ewt7MWDDsySZIHJSrr/jfO8DO4wuTpQ0KDyPcE782
	 fVO6A8WCJJemdNzIYMeaU6G3LJwEB4i3VqB3gojKERMqfAqiX5MWb27f96Wk0Hlayj
	 AS99HP74aBjo1P1Y++KKd7n2p0K5KvkJqM3fv5+zaoElB2jfhLRGFw4xWbCvdUem/h
	 DpgpwAz7tgCeBBxX73ybgr3MBBQxd9rZiWqiGY+zxBCUwD/5o3O4MHORy5FLR4YsY4
	 EcszL3A2HFkzEjB/FAEw4an9X9VXMjxt9XgL2UJTs5NOunxe4zTFrnBc48fIfjGBtQ
	 Hwo8H4IJbBIcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F28C63808204;
	Thu, 27 Nov 2025 22:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC driver changes for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428141379.55019.5715570450901606351.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:13 +0000
References: <20251126211634.8864-1-sven@kernel.org>
In-Reply-To: <20251126211634.8864-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Nov 2025 22:16:32 +0100 you wrote:
> Hi,
> 
> Please pull the following changes for Apple SoC drivers. These have been in
> -next for a few weeks as usual and details are in the signed tag.
> 
> 
> Thanks,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC driver changes for v6.19
    https://git.kernel.org/soc/soc/c/aa3294ff417b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


