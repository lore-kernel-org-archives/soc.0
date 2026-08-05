Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766EE3515CC
	for <soc@lists.linux.dev>; Wed,  5 Aug 2026 03:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901210; cv=none; b=tymhnsBdiIPz0F4xhEdOMHjlBvzXGlHFdZqS31YJ8qdd93545RMDI07aL5H46HRV6cljyoggDmknD1R43GuvDNFqbM7PrH+X+W9l4QrXTHVKpCUADsKwQTzgS7y3ZP8ezkz5eD2mvotFjalQpbN+S1W0acgrwcfh28eMytWtN9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901210; c=relaxed/simple;
	bh=b4CREaJvAYi8sl2vE2eKhPIc+kG49XHdS/VlxIpRVaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMfZVshMoO+BdBwRsr/RUeBjWkYAKAdW2L2Io803ZtoAGztoqx/JkGcohRTH8amzETa4KEfP470iL8WwsVW1iCCp/QncZ0x+3b4EvYXT+l5ufyFHFWOVzAVfsSM2U9clloY+6gEuxzGJEA5OciUNTSDE9zoI3elEwgZi5fBkeiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkztZLRi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkztZLRi"
Received: by smtp.kernel.org (Postfix)
	id 4AE401F00A3A; Wed,  5 Aug 2026 03:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D2C1F000E9;
	Wed,  5 Aug 2026 03:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785901209;
	bh=II5IA1znNWITelblXFEBESXbEeNGTkmwsKzBA47i+GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OkztZLRikLwIzwgXgxDt2A1+dfi8KgkE79jiMs+9ZiF3ZRR1wv17zHHmWsV5wk2/L
	 9ZjbmpMvSI2lvbMUjNf5Erdl6qt5bUcrD5jef7E8CLanmy51XnB4FSY+jNldSXXZaj
	 3SEyUNMe1l3/dy8Am07Jk4zEBfTYJGaiFqzC1721y6ZViI/n0QHE5VvtvjHyJodPun
	 6V75mWrdcyFugO/LORwEs8PpXkDcvIg093P01uX0DrMSBAF0Szt0w26UJiNbn8wIhc
	 K+7I81tUjvHFlwLsqbZsIHMtxqJ5/oqDAbcrwOWww9JDjG4dmiHHRsHzthKmD9RUb7
	 slfLC51pDAczw==
Date: Tue, 4 Aug 2026 20:40:07 -0700
From: Drew Fustini <fustini@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: soc@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.3
Message-ID: <anKwl/5re7CMFTXF@x1>
References: <al+cTw/+z7xoJXxp@x1>
 <55196187-178b-1f88-0947-1612410372e0@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55196187-178b-1f88-0947-1612410372e0@kernel.org>

On Tue, Aug 04, 2026 at 08:54:21PM -0600, Paul Walmsley wrote:
> Hi,
> 
> On Tue, 21 Jul 2026, Drew Fustini wrote:
> 
> > Hi, I created my riscv-confg branches to shepard defconfig patches
> > related to the riscv platforms that I maintain. The branches are in
> > linux-next. For 7.3, there is just a single patch for the WiFi driver on
> > the TH1520-based LPi4a.
> 
> Looks like this one hasn't gone anywhere, so maybe I'll just take that 
> patch into riscv for-next.  Thanks Drew
> 
> 
> - Paul

Thank you for checking but this was already pulled by Arnd:
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=6495ae297ceb

It seems the patchwork reply had a narrow scope compared to my post:
https://lore.kernel.org/all/178491121788.3229915.9040423834090729571.git-patchwork-notify@kernel.org/

Thanks,
Drew
