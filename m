Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F563B443F
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 11:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855463; cv=none; b=LYIZ+aN5O3UZg5M2upeiSgyDrUqWKJ6trJ5VvOlq9d8r0iehBYYYQyufEXCQCK2tSvr90cvh3yF1KxkoHQJwTafGT/TGOBXFyQ6lRc4YDpvz663ikR0uM4GBKqVSGwNHvVba9MLvFadmfqnc7EudLtq6MxOFMInmnJF59FGdEsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855463; c=relaxed/simple;
	bh=6R8F3xd4or363gN69JaibvxR2L25WDGIdl3wlNBH4fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4yPHiroMJriGGr4IQD++Tg1Tsn/N7U3Jq79byOmB618BCEUJwBerlfQLnN3E21L8EunSD3LFlIr47Q+9Ge3KN2HyhcZHnVSWGrCc0XjTzfZwjgXcaegvEVdterE3C/oXadNstB88j+Gedb9XZkkATuYMJ0J0XW7N1XXPsKX5J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hs0AK4OZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hs0AK4OZ"
Received: by smtp.kernel.org (Postfix)
	id 275AE1F000FF; Thu,  1 Oct 2026 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44D71F00899;
	Thu,  1 Oct 2026 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790855455;
	bh=rZYiPvtNcrffY7Ay63KQhcl5bvMLOR7QVe2mHkSjCNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hs0AK4OZmuEBYLvLfJJltebCbczCtGNT7ZlMgjJiptd89xDI97/NcJZQSkSIrZaix
	 Be5R5sZUuN/h7+rNflp+QleaQi7e9p6fkQ1Geg4N3MIQYneYPLvZHMLNCdeRt7jyZl
	 jZIfvCwbcSge59pDGXHCRUScwE53ze/147sZnljgaTLMn8nj/mRxsgejCqLlKpN0lS
	 uH6bjaVj/mxRnHT/T631DwSp9pgm4Q5AsvIsqoLvPE2x+ZEewiWYXVqpIwmhwbtoge
	 u0cmNa9JN0JRUeRTtyxYFv2gE924XJ9i7SHnpFIlDNaJIHLIhXFbd4Twf8l1e6Dpk+
	 w4y5jQFU9on/w==
Date: Thu, 1 Oct 2026 13:50:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.4 #1
Message-ID: <20261001-amusing-fat-parrot-a0c726@quoll>
References: <1940582.atdPhlSkOF@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1940582.atdPhlSkOF@phil>

On Mon, Sep 21, 2026 at 11:44:31PM +0200, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below some initial Rockchip DT64 changes for the merge-window
> for 7.4 .
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.4-rockchip-dts64-1
> 
> for you to fetch changes up to 7aa165b62ccaf340da22c517074e7c6853db55cd:
> 
>   arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar (2026-09-02 13:07:56 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

