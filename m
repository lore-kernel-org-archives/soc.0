Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69FA3B774F
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 17:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928912; cv=none; b=tLwfHkW0Yw/Y8rAoMXiNDrJm4OSR+FEvG4USnQ3J/d9tUv81nF8/ArrnSjjeGxBFKqeaUBOpExtSRyFJZ8yw5ZBv5PGuWTfmECKad4S5Cf8UL7+sfDNoPVOFxo2YsKGfb3GvLS+uaCCv6RHlN5U4c7IUNPmbd+MFTXPD+TlkL3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928912; c=relaxed/simple;
	bh=6EsoCMNC5sXMkFgYBufNFBA0ceJXkOiSoYKRAmHD49I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OE9w4J/Le/1Zh9IlKLeSpTEmLRKA3G9I33mfXe4A+onpjGI8JfuzwLXe3NuzqnCs5piDV+c6ul3aRohQDWXJQf14GfblGT/TFsJbLRdbKLWiar531Am3uApWBjOPiBln0aHgpXDL8oJmT6kTlsXDgBWxFkaumeLFy6r7Ty3WFdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CufYP9+5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CufYP9+5"
Received: by smtp.kernel.org (Postfix)
	id 812D4C2BC9E; Sat, 11 Apr 2026 17:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31245C4CEF7;
	Sat, 11 Apr 2026 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775928912;
	bh=6EsoCMNC5sXMkFgYBufNFBA0ceJXkOiSoYKRAmHD49I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CufYP9+5KHkN6t9LkVn72Q2qRM5DtFdhnLAB1QY6xa0ir4DuS/s61+dSTDD8syKyK
	 M6GhpH2tAAkZPyTOUk2WFyyQjkLpD1/6RygNBO77WhTLdlw4fxGhM702pSOq+ga3n6
	 mryn43CI5TK98uc8kIVSu+D9a+4c2vIzDa0TqO4UOjTmrEAqSXZSWK2PFHCQN89CBQ
	 sotOtflZUGTW7fsvHy/GUNgqDvOOG9gkhErGWOZuOdGQ8WNxPA70CQTiJAqdCSNijg
	 s1ABHbNaqldR0+WYoEqss0+LW7VC+VhF1Dl5AF74UlJDflYNVqstPzb1poSrN/Rb3U
	 DoUwuF8uhSz3g==
Date: Sat, 11 Apr 2026 18:35:08 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Message-ID: <20260411-exotic-astonishing-piculet-0cd25e@sudeepholla>
References: <20260407100841.3150090-1-sudeep.holla@kernel.org>
 <20260411-tireless-agama-of-advance-5bdabf@quoll>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-tireless-agama-of-advance-5bdabf@quoll>

On Sat, Apr 11, 2026 at 10:49:50AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 11:08:39AM +0100, Sudeep Holla wrote:
> > Hi ARM SoC Team,
> > 
> > Please pull ! This is the only fix/update I have at the moment for v7.1
> > So, I am sending it early as fix but late as an update for v7.1.
> > 
> > Regards,
> > Sudeep
> > 
> > -->8
> > 
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> > 
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-7.1
> > 
> > for you to fetch changes up to 83210251fd70d5f96bcdc8911e15f7411a6b2463:
> > 
> >   firmware: arm_ffa: Use the correct buffer size during RXTX_MAP (2026-04-07 10:47:42 +0100)
> > 
> > ----------------------------------------------------------------
> > Arm FF-A fix for v7.1
> > 
> > Use the page aligned backing allocation size when computing the RXTX_MAP
> > page count. This fixes FF-A RX/TX buffer registration on kernels built
> > with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
> > larger aligned span than the discovered minimum buffer size.
> 
> Can we avoid per-driver trees or pulls? You do maintain also ARM SCMI
> firmware driver, so this could be sent together? I think you also use
> the same Git tree, right?
> 

Sure, I can put all of the firmware drivers I maintain together. I had
for some reason assumed individual PR is preferred.

-- 
Regards,
Sudeep
