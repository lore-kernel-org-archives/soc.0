Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E11829D267
	for <soc@lists.linux.dev>; Mon, 23 Mar 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774267881; cv=none; b=e5d5dDR9DdYVyFz4wWz9QYTorFI9W/1/RQHazgjDkH9cNSc7Jyt0PVMKTHqEmTMAbW9m8wIpzw8aT5W9FMhUTWJ/gAsIm4Wh8E5tk/d1+ByjmV8eJLbXb0HwswLZXM/GpE+bqROwWOWiMmwT6BiOS3HtxlOHJBo88LptSJSiq2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774267881; c=relaxed/simple;
	bh=+V7bc4/5lTZPzVaQcdFvZeZCEi9TT7wqSQRDVxe3JGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POkkcf+H0A1nI65xaDgpSmU+zo6bgP0nsMAWFOSnT8agPeAAkAo2dKkmVhtY/xnLF7bbzTcAX4pq9yqYx1p2EwzbXsAjQPz0OQRH1CzMnvd/D+DoRZS40bAgpTgeYAFvAyczJpKj5wIh0FLhd/qYu0c7EVwT3wBbsVYJjrOLIZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tu0ZumBt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tu0ZumBt"
Received: by smtp.kernel.org (Postfix)
	id 1FB78C2BCB1; Mon, 23 Mar 2026 12:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE955C4CEF7;
	Mon, 23 Mar 2026 12:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774267881;
	bh=+V7bc4/5lTZPzVaQcdFvZeZCEi9TT7wqSQRDVxe3JGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tu0ZumBt3+UHF00v+LQcOpaXuKDg8ix9xwyiQhv9gr5cTX3PUTKm3C9iIV3ETlP3R
	 AFrn1TQ5K517Kb73svj5AurL/EXTgh/v7P0dc4oJweP9h2bb/MEOLCOItAJXDCqMul
	 Kwl1ZBt/Hgt0LBPvzilbHk8FwgLnQbtgZG2RT/eCb8noUhoKZLZP4HmjljKc/+vscZ
	 aTpH0gbbFf919Rz/EsWhIJ+qi8V8MZ8iXAImA7EgiiPhWvrCGzSP/HcH6e5jzffcuj
	 dn1oDOgPpuPk5l2UBe6UvbXvx4yrJLQoVN0zP9g5LCjHNtvPm3KHJcRFz7kRQ0C/ZQ
	 SMQi1a36h5XAA==
Date: Mon, 23 Mar 2026 17:41:14 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, arm <arm@kernel.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org
Subject: Re: [GIT PULL] TEE shared memory fix for 7.0
Message-ID: <acEt4roJbZJoRCJC@sumit-xelite>
References: <20260316074150.GA2474723@rayden>
 <20260317-illustrious-finicky-frog-90a86c@quoll>
 <CAHUa44HXjrPbPv0sBxzrW6o1iQVWdp2p-1-jroukZ8dxSvPmMg@mail.gmail.com>
 <dfidrflp5p637dqnn2e6sqr6gbp47gimjlkechjjtlbr7re2e4@kgwofxcumhes>
 <c3f1a10d-8437-4d17-8dfc-286935ba9e51@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3f1a10d-8437-4d17-8dfc-286935ba9e51@app.fastmail.com>

On Wed, Mar 18, 2026 at 01:39:41PM +0100, Arnd Bergmann wrote:
> On Tue, Mar 17, 2026, at 13:53, Marco Felsch wrote:
> > On 26-03-17, Jens Wiklander wrote:
> >> 
> >> I'm under the impression that it is a fix rather than an improvement.
> >> However, since it has been stewing for a while, it's clearly not
> >> urgent. I don't have anything specific on the bug fix, other than that
> >> we're supposed to stop taking those refcounts. Perhaps Sumit, Marco,
> >> or Matthew can add something?
> >
> > It's a long outstanding fix regarding memory page management. The
> > userspace gets informed about this memory API misuse via a warning print
> > incl. a backtrace. This gets triggered only if userspace uses OP-TEE
> > trusted-keys or the OP-TEE EFI variables. Therefore I would like to get
> > it into 7.0 but 7.1 fine too.
> 
> Yes, that is clearly a bugfix. I think we'd also want this to be
> marked 'Cc: stable@vger.kernel.org' as it should also apply
> to 6.18-LTS and 6.19. Greg tends to also pick up bugfixes that
> don't have this, but it's generally better to be explicit here,
> especially when it's not obvious what the impact of the fix is.
> 
> I've merge the pull request now. If you think this should be
> in 6.18-lts and Greg doesn't pick it up by himself, maybe
> let him know about it.

Thanks Arnd for picking up this fix. Last week I was on business travel
hence the delay in my response. I see Sasha already picked it up for
backports.

-Sumit
