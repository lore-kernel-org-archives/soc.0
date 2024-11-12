Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66472003DC
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424981; cv=none; b=NJbqK+WXabBZSjl8vjSRfansJKkjtdtdFnp2ghwn1NXIw72m/yKC3xahGyPHLhdrHpiJMx7aumAU1PQ5L1YWMX7qtisms17CWycAaYXGMQ9eXbr3yrWguQThZlWzG9tqd8UrA/0Ig4EevYoaOhhI/OhPTRKaJzNjTvA/r/nwUSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424981; c=relaxed/simple;
	bh=vfWl3exxnNgMzpdae9dhLpiLHSPUuod9c5cg5zPIdm4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Hxroq9RwlZX6sCfhJDUGZcnSh19fA9kxzDh2LCW8z1N8DkuSUvc4GsCxHx7bw/xYk9Gj8FR3IMWvSwY+Zpo5YCnTwgdNAbKXeMH3mjESmb8AQZP+o8bCAwsAnwgegO8sqXgM9vtJt76zH+axe/Zqsj3C+OZbI3k8f/9wO5C+J/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjVN/KRc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjVN/KRc"
Received: by smtp.kernel.org (Postfix)
	id DAF1EC4CED0; Tue, 12 Nov 2024 15:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5593C4CECD;
	Tue, 12 Nov 2024 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424980;
	bh=vfWl3exxnNgMzpdae9dhLpiLHSPUuod9c5cg5zPIdm4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CjVN/KRcKlRG4wPY6j7ISTAhxXNmS+uuS9EARMTZGoEu4dkIgg4NT4LYrzdfjyJi4
	 SYRQ61WRNFCxxCvzahTa4GCUDGRQVh1MsoP6s1s4525flCITfJxkaU9d4tc7bmT+Q8
	 3AUCBDbJuLa1SyWat5uM1hBlZPrLcKdADd54YvO8BzGJWMlDaaj542azayzU9fTvHd
	 cPEzxAWpXoeQPOn9M+lQqmlTrMmcSFK1tPzN66LFvsK3paSZ6+GhWhQn0d4ejHZKR1
	 UsWjWy7l6UwmUOw4zhLJQxIvfB92JZOtLKZw6fCsc4bNwfxfCnu15l8j5tQLlqaQwM
	 wwEUQypb4mRgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ACB3809A80;
	Tue, 12 Nov 2024 15:23:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Document the driver
 private data structure
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142499073.562452.15166743835465198015.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:10 +0000
References: <20241111103957.15899-1-kabel@kernel.org>
In-Reply-To: <20241111103957.15899-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Nov 2024 11:39:57 +0100 you wrote:
> Add more comprehensive documentation for the driver private data
> structure, `struct omnia_mcu`.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/platform/cznic/turris-omnia-mcu.h | 42 +++++++++++++++++++----
>  1 file changed, 36 insertions(+), 6 deletions(-)

Here is the summary with links:
  - platform: cznic: turris-omnia-mcu: Document the driver private data structure
    https://git.kernel.org/soc/soc/c/372eb09cd985

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


