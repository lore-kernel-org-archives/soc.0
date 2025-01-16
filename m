Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C3C22C9ED
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043292; cv=none; b=t8AxBrJgqErzy0X4QmfJjg45zK761Gzc2ogzPRNhDpRVF1g7PTAZlAu6a1yNCeYUuaMbar89VuxsGd2DMJ9Wb7L8raupvkz+L1w0XrgHB0T0x9imePiRSyQnWod3ZY4Q040J9yn4KgWfdpwyAn/F34VfDALmyRnOcpJU1xyGUJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043292; c=relaxed/simple;
	bh=AP9ium96IAjRxao6nITU7FtlezINzZfMIwQRRZf7eP8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LyDkvbLjQIw2V4ytlVQv8fZvDwTu2v9wt+BOy22Qc83lmS/BKKE0cvA4yBb+Hn/HKvGlsRDVU6UkO3QN0GYqgswgJmmMt8E2+7QQnbJu4LqhbcLze+Zz+0VjrFOqvd7h5V0DKdAlgbdBeCiHAhREbYOXH8K9hH5JTRNxqk2adyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBexHvZn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBexHvZn"
Received: by smtp.kernel.org (Postfix)
	id 5FD96C4CEF6; Thu, 16 Jan 2025 16:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C4FC4CEEB;
	Thu, 16 Jan 2025 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043292;
	bh=AP9ium96IAjRxao6nITU7FtlezINzZfMIwQRRZf7eP8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OBexHvZntfkKtIEymXXz4+hbBtwRO5Kx0hj8CaTzKxNoNW9y/eMaglJzXxVx0ViOw
	 RKRzjsYy3hXdu8LjN4FxXC5p6R4XKhFniL8RikoOBPER7TMW/0F7N0gZJ+lcKgK11x
	 owUKeIKpKMuzkbvPZMl71hF4OaqGj4jTgJX/123H8S+u0xXAQZnxAlB8VY0FG6zZCG
	 9rQNZG5djPzLJsmCvOQik/rs97/TwLnlh2iAtPKVR45t0KwxibuF5Dfjd/MfXJkgk5
	 hJMqBj4UvClYMC/h/fhhik0jifBhKPSJJMyxOdryhW+KiPz9s6Kf5S3pqGkLCHK3ml
	 PpVb0mO8EXCYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7141F380AA63;
	Thu, 16 Jan 2025 16:01:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: various for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704331524.1501791.17686876034854413769.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:01:55 +0000
References: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Dec 2024 14:28:45 +0100 you wrote:
> Hi,
> 
> Few cleanups for two platforms which were not picked up by maintainers.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: various for v6.14
    https://git.kernel.org/soc/soc/c/925477396d3c
  - [GIT,PULL,2/2] ARM: dts: various for v6.14
    https://git.kernel.org/soc/soc/c/d527a65d1388

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


