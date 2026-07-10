Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B350A43B3C1
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698721; cv=none; b=Ft2wzEbV5bjfCfSXd5CWv+IYnsh5ejB3JXxZMXVPHxbEhl8dXQNrVlIyaoNStQ8Pp56oAGCkCFw4trRNXiAfOT2zyYC29rzjG9LsK2AcP92wgth7m9ha34DYqgkPCEv9GgFaIX9MDpcO86pPmjWtCKQjBQYu7YfJSW/GTn3YLzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698721; c=relaxed/simple;
	bh=+BN29xlmR6TzmS5AJwn5S8KbW77w48dse3YAodjlLrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBvZiZlhuWZYUmbKWOUEA2ebO2y9IwO9e42VTSROVT+9z0df0PJr8gO8fBgOO5DOrf9pPWp7LFpODusc7BmRe+jg/0iXkO16Nppg7A8abC+xbD6IroLhq2a7HxnRb8bOtD+GTi3SmC+snuilcM8cM0Zj/uW9M7bzHV6oD9IwNKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAWE/UXL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAWE/UXL"
Received: by smtp.kernel.org (Postfix)
	id 331A11F00A3F; Fri, 10 Jul 2026 15:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF921F000E9;
	Fri, 10 Jul 2026 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783698719;
	bh=0Sgoh7/RxsFePSFsMzG9fKuzgPHgLtxTqVoyNO11ia4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jAWE/UXLy+qngfTw9rxZFmgWyYnkZaeBz4l0Yn4XxasgdrrruSe4DnKmbzqIIfSEf
	 nudYP7EzE8bv3mQvXiX12I4SqlkgG57ZFne6Qv7pCdynmqIj6aflpMknIR8NktBPEi
	 rgMKIjPwFzzNTrDN51ShNbrMC1gdwSz1Hwp8Cf86N7WiwmPSMcTqJvvuamYCjzfLG1
	 zWXOa57dk9oz+mcmyO41SznnoW5J/f4RznnaZ0SisEU0U39NPpht2z/qMdR+EnEFjV
	 Q9uCVD8bz+8OT7UA+qv0ez4sv2L/KFFkAUhanJsuQsLy+WPhu5BjS/QqhgNucp22dD
	 D6j5NAvIOo+Gg==
Date: Fri, 10 Jul 2026 08:51:55 -0700
From: Drew Fustini <fustini@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.2
Message-ID: <alEVGzSqo5FANRTa@gen8>
References: <ajAt3ml9pMIMTLTq@x1>
 <f0f61421-5db5-474b-b904-b5764352671b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0f61421-5db5-474b-b904-b5764352671b@app.fastmail.com>

On Fri, Jul 10, 2026 at 04:23:54PM +0200, Arnd Bergmann wrote:
> On Mon, Jun 15, 2026, at 18:52, Drew Fustini wrote:
> > Hi, this is a late pull request so no problem if it misses this window.
> > It is just a single patch for the WiFi driver on the TH1520-based LPi4a.
> >
> > I recently setup new branches for riscv defconfig patches and they have
> > been added to linux-next. I talked with Conor and this seemed like a
> > good way to pull in defconfig patches that RISC-V SoCs need without
> > adding more to the plate of the arch maintainer (Paul).
> >
> > Thanks,
> > Drew
> >
> > The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> >
> >   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:tenstorrent/linux.git riscv-config-for-v7.2
> >
> 
> Hi Drew,
> 
> I assume you saw that this didn't make it into v7.2 and you
> already plan to send it again for 7.3. If not, note that
> the URL above is invalid and the tag is no longer there.
> 
> When resending, please use an https:// type URL.
> 
>     Arnd

Thanks for replying. Yeah, I sent it very late, and looking at it now, I
also did the pull request command incorrectly as it is actually in
fustini/linux.git.

I'll cleanup for 7.3 and make sure to use https://.

Thanks,
Drew
