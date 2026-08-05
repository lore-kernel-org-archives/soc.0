Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A97283FF5
	for <soc@lists.linux.dev>; Wed,  5 Aug 2026 02:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785898465; cv=none; b=qKdO0dFN769IPMuYmgstIEW3wigUnNZyZqXxk1CC1XtbKlHa0QIOyX+vvRjVV0tUDsGHhNVEhzUju6+Zqq1yLOGlmNg6AKylTdjUOSlsdenfAZpMYnzrdbCG3rZgSxWTrAU7yreBohT0xNU+MF+yBXjEHCAUuKncFrXWrtsKD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785898465; c=relaxed/simple;
	bh=08Or3ZvO09V7tbkDrl4ckplSoW5L+R1CGN/If0PH9v8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JagW+2nmc+hmCm07Fbm8XT5IRvW8eDVpVPaK0zzwMBYT5+LHGgTU1+Ve5rXckS4rmONEOf3sqmKMeQ59BT9xRoNjYcsseqbe6pKIu4YYZKMFAaNE/+71q+SxwMSL998Mv9qvUTxSJsoCA5YrHWAbBcdZYnWTEmz/e3g7oWHbCg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuNtYGO/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuNtYGO/"
Received: by smtp.kernel.org (Postfix)
	id E89591F00AC4; Wed,  5 Aug 2026 02:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192111F000E9;
	Wed,  5 Aug 2026 02:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785898463;
	bh=hPZc/45ps7rDVjXO2mMddaftcA4mDvKoamKZkAuhllk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=HuNtYGO/2Ob01YuCIVm/dddAlh27D+i2ka8kFuPBSt6Vy/V/g7lAnNoL984SVSEAZ
	 cexbJqAuz7a0RvpPBO8pfw/7R6FWY66nsuGYjPm1s4SGmfEuakw8nvsFWMDPhwfa72
	 LMVN4p8L+Ct6yE6J1FRjhkLA/uZSAsGFInplu9achPhcItQ4L/f2vwSXEpkKyPfsfa
	 xmZgfcDh4h3q/m7bKzrQUiWJ0PbCmhIgoznA6OSg429XCjoOtJeO/6qvB34bwcHNYd
	 Dg5WUjFHB+CLt0dKKI93VCbbob3/1nDRQWMztg5/fx4qqEmKLUitJVpkHoFU7KesOF
	 albNdIDWgIktQ==
Date: Tue, 4 Aug 2026 20:54:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
cc: soc@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
    Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.3
In-Reply-To: <al+cTw/+z7xoJXxp@x1>
Message-ID: <55196187-178b-1f88-0947-1612410372e0@kernel.org>
References: <al+cTw/+z7xoJXxp@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

On Tue, 21 Jul 2026, Drew Fustini wrote:

> Hi, I created my riscv-confg branches to shepard defconfig patches
> related to the riscv platforms that I maintain. The branches are in
> linux-next. For 7.3, there is just a single patch for the WiFi driver on
> the TH1520-based LPi4a.

Looks like this one hasn't gone anywhere, so maybe I'll just take that 
patch into riscv for-next.  Thanks Drew


- Paul
