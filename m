Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3E2F6168
	for <soc@lists.linux.dev>; Wed,  8 Oct 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921071; cv=none; b=Ee4hqAZIIFMiaNurSwgHl6FNBbct6wriEqdmFUUq6S1XGJUBpMc1QP5yFgC5g4KtB7g8CcywjriKx/85tK5SeXct/rbv4ql+rle0HT1vMC/Hjc2UXMc833yUcYoOrUpt4arQFt0o3Xi57LQzLJRnSwluuntqQXdXhorp2JOHqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921071; c=relaxed/simple;
	bh=eiNVRJAM0iUP9ItjFyPnYxmes4r4KRzCqkMJZdultOQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pFcv6lCjZ6IPn7hzny1/w66UyuGXfK3/E124TgMp8aT5U2kja8sPN7IL/XyhAbOzrbY7VvuSo2rJt+2PUlO1qUzJNWymR5CFY4hl187vriLbaEalROKo9PzhNLl/z6NW7qidxq8Vf4TxIsaa1G/c107gppnxrbtBGq0Qx7p5QR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOsZumFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOsZumFF"
Received: by smtp.kernel.org (Postfix)
	id 1474FC4CEFE; Wed,  8 Oct 2025 10:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38A1C4CEF4;
	Wed,  8 Oct 2025 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759921071;
	bh=eiNVRJAM0iUP9ItjFyPnYxmes4r4KRzCqkMJZdultOQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aOsZumFFTEWWEeSdqbgFdDAoKVb+Ssp448A/GH1kErME/QM7fNIQlX9+rPMJuyQ9C
	 QdY4FmQiIbc2yCzx+nsNx2lq4UIpTw5yyH7RDU1Lb9TFL3r8S+Pg1ziLAhfH4fr5WK
	 c07NbYvFXVnYde40WgyaQ5FQdSSMgC5IaXZz6cYk+Cgrfl3Gbcx3AxI4oiEsWKLBbd
	 jeIkrqvJhhwWgQuLPz4kaVhOEJgpgTV6/Ia8YCH81r2pvVkmFKriF7y2O6Iqg1nYWo
	 9E1Q9CR9u20+05YTTLEN+2X0eSD/vdqqAGjia4jugmiVSV94lvVJElfktxxteJ9RN7
	 IWWkzoyUYvfog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFC83A40FEE;
	Wed,  8 Oct 2025 10:57:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: versatile: clock: convert from round_rate() to
 determine_rate()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175992105974.3011254.6055459705650625073.git-patchwork-notify@kernel.org>
Date: Wed, 08 Oct 2025 10:57:39 +0000
References: <20251001061100.372737-1-linus.walleij@linaro.org>
In-Reply-To: <20251001061100.372737-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  1 Oct 2025 08:11:00 +0200 you wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: versatile: clock: convert from round_rate() to determine_rate()
    https://git.kernel.org/soc/soc/c/65d2419f931c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


