Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90F825A630
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 23:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737071286; cv=none; b=qeFrUX0Z/F3Ob5lFtBoocJ3EwNjmOL4xA07+3dNOZ0EHhPAYQlmEiXALBtRQCP+G/EjriVJP2gdCsll8i0Gt81WDiZdqNcKF439orQBnHn6Ow2HmgH865fVIXNDbCZnPeyX6f+iuFgaJpQsYFR9lG1Jea6a7yK7IjAAMkCY+ki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737071286; c=relaxed/simple;
	bh=60DYFPCDI2nZ1GeeNHS3XJANwaovrZuaTA/M3hrj94Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMYxPWy3zUU8mQWDE8bdEHd7mxUxAHErlQXw3YA2G1OofX9rA/eeb8MOSgIZcu/M9fkZJOFYlCNdk7UosG+bnNLQ+ScUogLO28MEu63WSxRTxLBJXWGZ/6ftfVU/U/iw6Pnx6gzMh37Ut4FhNesAtsufaYCbv7e1vsOMWXNUVto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 6C08AC4CEDF; Thu, 16 Jan 2025 23:48:05 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66CB9C4CED6;
	Thu, 16 Jan 2025 23:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66CB9C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Thu, 16 Jan 2025 23:47:53 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, Conor Dooley <conor@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>, Yangyu Chen <cyy@cyyself.name>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
Message-ID: <20250116234753-GYA20457@gentoo>
References: <20250108142122-GYA3300457@gentoo>
 <6a8bb914-858e-479d-a7d9-09e0ff688160@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a8bb914-858e-479d-a7d9-09e0ff688160@app.fastmail.com>

Hi Arnd:

> On Wed, Jan 8, 2025, at 15:21, Yixun Lan wrote:
> > Hi Arnd,
> >
> > Here is SpacemiT's device tree changes for 6.14 cycle.
> > All patches have been merged in linux-next tree for testing.
> >
> >
> > ----------------------------------------------------------------
> > RISC-V SpacemiT DT changes for 6.14
> > - basic device tree support
> > - pinctrl dt node info
> > - update MAINTAINERS info
> >
> 
> Sorry for the delay in pulling this. I just had a look and found
> that your branch is based on -rc3 while the soc tree is currently
> using 6.13-rc2. I try hard to avoid unnecessary backmerges of
> upstream contents into my tree, so it would be nice if you could
> rebase it onto 6.13-rc1 or 6.13-rc2 and resend.
> 
sorry, I will keep this in mind, and will rebase to 6.13-rc2

> While looking through the contents, I also found a mistake
> in the contents:
> 
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -0,0 +1,459 @@
> ...
> +       aliases {
> +               serial0 = &uart0;
> +               serial1 = &uart2;
> +               serial2 = &uart3;
> +               serial3 = &uart4;
> +               serial4 = &uart5;
> +               serial5 = &uart6;
> +               serial6 = &uart7;
> +               serial7 = &uart8;
> +               serial8 = &uart9;
> +       };
> 
> The aliases here should be in the k1-bananapi-f3.dts file,
> not in the k1.dtsi file, since the mapping between exposed
> UART devices and those available in the chip is board
> specific. You normally want to list only those devices
> that are marked status="okay" on that board.
> 
> I would suggest you fix this in a patch on top of your
> existing commits, but make it part of the pull request.
> 
Ok

>       Arnd

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
