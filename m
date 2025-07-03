Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C742D2F005B
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 15:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558390; cv=none; b=rpSoE75nl3W2kQJfQff1MrB9kru+FP+cOI6kzA/0FYV+sc/4W7VuDT8jFDDwo4lF0NXZXSnzUJFCbeUgKh8xCtQSAFdB7MjlWllZEGRkDdu3p2B9R0AS7SfHA6/i4j/qy19X3eA5yCy5WMsI2TxF0S8z6HJwMgElCtvJlHe0qpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558390; c=relaxed/simple;
	bh=7ULo1O6k55z0ZaQ4ZJF8z6dZVKT6OTsQN5o6JiOREDY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f9r+JQfAY2l5N9UH+uASiFk8bdPtMgW7WncsVQWAGUdyuvPwlpK01muqx+4FmtS/+k7btOgL5ccAxGgh9bvQFlk4k5uvIqaHxLQpO3tlm4VLbQHgYv8XoQH3YbAYKQIxu1U5/jCw7W2xPnSS2ZfcbrbzZ9HajlrItx5LXYyVdm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHIooaHB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHIooaHB"
Received: by smtp.kernel.org (Postfix)
	id BCB04C4CEEE; Thu,  3 Jul 2025 15:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F72C4CEE3;
	Thu,  3 Jul 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558390;
	bh=7ULo1O6k55z0ZaQ4ZJF8z6dZVKT6OTsQN5o6JiOREDY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IHIooaHBrO1WkEN4bmAiRym10KslvAKy7Ep0iFh/GTBvMQu0bTeWlKTyXZp/0aE8J
	 ZUF0hpzTzSh1l+VbpUCBeTJ8LxzvGs2/s60ofUq2QHYn906gUkXPxVsIrh6uBuLNn6
	 yU2Te8sk6evABZLgcs0AFRezvV2QkFS+jeanwYCAxUGZUROI4uePYYylqSVwgOlfCW
	 xLTdkk20jX18ZPr94TjrSvKSypg0yN5Z0zpSYDfcGtj9jOpXkQO2Sxk5HI5LXFGvAk
	 leek83AiQaRzB2A3+mW0mTBJqpuq4cIiae+Qi0Uxf3sQEbA+vXn8kva17r3thKucoH
	 MoAflH55l2l8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F69383B274;
	Thu,  3 Jul 2025 16:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] arm64: dts: lg: DT cleanups
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175155841499.1537604.11633718714546187320.git-patchwork-notify@kernel.org>
Date: Thu, 03 Jul 2025 16:00:14 +0000
References: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
In-Reply-To: <20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 09 Jun 2025 16:54:55 -0500 you wrote:
> This short series fixes some arm,pl011 DT schema warnings. I noticed
> that the lg1312 and lg1313 .dtsi files are almost identical, so I've
> refactored them to make the fix once instead of twice.
> 
> Arnd, You probably need to take this directly if LG maintainers don't
> respond.
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: lg: Refactor common LG1312 and LG1313 parts
    https://git.kernel.org/soc/soc/c/caec315724f0
  - [2/2] arm64: dts: lg: Add missing PL011 "uartclk"
    https://git.kernel.org/soc/soc/c/f060fee24a52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


