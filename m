Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244340DFB9
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775899949; cv=none; b=H64XblUkSFixwPX1Rxem3le5oetmP/34AKsEuSjWv8/w9NyA+fiAoBKWlVWUo6V/nkiYyY1OCyQN2xMKpC5EYxCf/8P5jNGbSTfY0JtDQdn+ZWhGctIwvUHm8EyyxTIXQjRAIk29w0PFvWvyCC5Qu/wdpKCxQ0k//hoRsucFt/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775899949; c=relaxed/simple;
	bh=Bwnwhvav7SqaBcGFuZZ4+1wMWtuK1iYREbAFYllIJuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDHguZtE3d7mj59UsD54dPxiOXvq2tAftSB7OSsibe7v1fYONCoEhkfqujyu5E+BjZz64vmKD/pOSV0WrSKxkCR5gGupcDc3OfCpBR1PIXZsodLg2TG2mZuADLOG++GRSCFkYBOb5XSLZCDkiAeC27EnN82BXt6HGNQW+2tK/V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HaXSsm1S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HaXSsm1S"
Received: by smtp.kernel.org (Postfix)
	id 6E7F8C2BCB0; Sat, 11 Apr 2026 09:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A27C4CEF7;
	Sat, 11 Apr 2026 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775899949;
	bh=Bwnwhvav7SqaBcGFuZZ4+1wMWtuK1iYREbAFYllIJuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaXSsm1Sq4nXPSw6LEOW/k+FOhQYNeo0nXpITHwF+XkAZGvqtytXuqf0UvmMqAULG
	 g7jE5JE8esTBkZgWclucm+z6bx/ua3ORDCWiHHyM4KPR5PhcbzBYIy20I5gsdmq1Ch
	 XL8oyDoAhujzwdutvJXH4kcmchOYpZiaWh3iQ9WIO8xNCqWcZOWvd70kHIfG2UMJ5i
	 Ng9+owznce4KPf5kxS4ZZfHG7BpWj4U0BwcNMqVCvzivWuatm3fFYctp2kCkh1n55p
	 t4PtGRkdspC3qtuUhS22XXNIc04/mbaO8NiKlW0Ml8fcP/JtuupF2edZDgmV5KzDdm
	 fDMjVip+1tg4w==
Date: Sat, 11 Apr 2026 11:32:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
Message-ID: <20260411-spicy-apricot-newt-afa8a7@quoll>
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>

On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
> Hi,
> 
> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
> for the Phicomm N1 and a couple of low priority fixes.
> 
> Thanks,
> Neil
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
> 
> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
> 
>   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)

Days in linux-next:
----------------------------------------
 1 | ++++++++ (8)
 ...

So a few things were just applied, unless this was rebased?

I will wait with this. It might miss the merge window if v7.0 is
released this weekend.

Best regards,
Krzysztof

