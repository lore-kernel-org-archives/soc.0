Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70B2ECD26
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946611; cv=none; b=FBJgiXOVh2jKF9ZuB8f6DJjDH5amMT9mtKqK+zc1LVJIh/YzKAxezERDRjCIT5NH/9uVPaDQDRQmTqVAg6V3NVGGZu35Hja3Cg7O/TSa8eokdBYhEe9pWM5nLbW7fO/iiYjh1SjF9cdf4zxmXWUnIrVAzmdtibB1d1xva/0knls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946611; c=relaxed/simple;
	bh=TB9cPj+CWGzWZRI0dnAs6uZbMhqEqQH7DUh0KjyjKek=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RgqWaVdBhn+WIm+t19q4cEQtVT3QDePXeqw2DAIau9DNC5YsMszZSLNOd8J4fPGvq65B54vwR8cD6gK5CWLpXC16pt3Jt3cxynnkwPktFau4Y1Su/JOoAAwPSTMuBsJ3qgkEKdMMke3ARiJNGprwH2utYp/GQrQUs9pRqHGXT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdzwYmRD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdzwYmRD"
Received: by smtp.kernel.org (Postfix)
	id 90F3BC4CEF5; Mon, 15 Sep 2025 14:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB4DC4CEF1;
	Mon, 15 Sep 2025 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946610;
	bh=TB9cPj+CWGzWZRI0dnAs6uZbMhqEqQH7DUh0KjyjKek=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TdzwYmRDs0yR2RBM5sG1nJcOSI+lpA4RqYZzM8mRfAom86ifTfT9Coy2LbIqJ7fab
	 Oom0lazlI9c38OsJRI97rotY9IpwPdwg/sLlcZVs/WUFDteCyGrcvd8ruWWQxafx9B
	 gfMBLy7DKkJnWsoOkfCyhmQ9J/Z+NyUgJwk98YuX6oIWmrb1WSGC75ksnh4ZwCOUhc
	 66FPJUzWnRQqaJCdos9I5tAp4cNKWkqkaaIUnkF7dkYDgUEKti4PXAxlYscLAi7fJH
	 BvKvIL3Y4KRkbKQL9muhFOYpm1SqWG6zcRxJKW3GlEpRpZPjQJycGzK9Yh/uqC8wie
	 B57UcY7nIugMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C6739D0C18;
	Mon, 15 Sep 2025 14:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE use SHA-1 library for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794661198.4799.13636930716695550179.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:11 +0000
References: <20250912091611.GA1442659@rayden>
In-Reply-To: <20250912091611.GA1442659@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 11:16:11 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch for the TEE subssytem. It simplifies the
> code by using the SHA-1 library instead of crypto_shash.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE use SHA-1 library for v6.18
    https://git.kernel.org/soc/soc/c/15550d05c50a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


