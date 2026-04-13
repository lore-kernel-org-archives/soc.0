Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1537DEAC
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069150; cv=none; b=nLA9AQIdaHPCJfRErlbHECvpvYM2j5YRmy5i5oEab0y3KeGMHXB4vZiOnrB9NrlVpwQHza8puBeIwY18eNf7k1Qlxbfct/w0FYx2gev4Q74na9Q4jDMzlliD0u4EpamdQcFfgOZugSSIiAjpBeyNhjCUbSYl81hkJXvPoX9AlZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069150; c=relaxed/simple;
	bh=BiNIBNFEvjfdjnsBqksdXXFnEweIGfhc8bp7l1pCXGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9ob1Vw+/ctoVRdrmiAzHC+WzfwUYBL2pMcA847kTOCUQET6U3AUWwiXNLYw8fBjX6Ay4L1eQ5Y1pl2Daih9b6QzL7OAjWGkosdLha0C6vv2CqdnOtGutdagZmkKI3M+yYN6HcFPIXvvNdUlCURQzQdC4BLjmmw81KfJvhfslto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX1HDsJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KX1HDsJZ"
Received: by smtp.kernel.org (Postfix)
	id 0913AC2BCB3; Mon, 13 Apr 2026 08:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9A4C116C6;
	Mon, 13 Apr 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776069149;
	bh=BiNIBNFEvjfdjnsBqksdXXFnEweIGfhc8bp7l1pCXGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KX1HDsJZpV39XyXhw5gKqQYq1yi25yiqTzZN2NeZ+1T2jX41HHA+oxDVesshLgrZ5
	 ZTHnYfDxqvKCVXBBBNTG8yKwPHfxRrSabjL61f2AH/fiYsiSZ3YfO5ZOCF1PBAqAok
	 MWYiaryuvA5nj5Sl/y2/AnLgs3mSQV+Dh73OqbYQ+TPdJ3qP8sJ0fQkQLUUnXcRq8m
	 zIhmBd+c92Ea91Syp6zuQeCPYkFCuFgxjen+7B/3vqoJxs6zzmB2uEQLE/HS975myW
	 i72cjKzRYv0XHBtm+SciVDFpPiY/pMfR3bU+VsiW22TBV3Y+V86opKxKRBt7cOSUb8
	 eJTMmtNcdw6sA==
Date: Mon, 13 Apr 2026 09:32:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, arm <arm@kernel.org>,
	SoC Team <soc@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Message-ID: <20260413-inventive-fox-of-novelty-b7790d@sudeepholla>
References: <20260407100841.3150090-1-sudeep.holla@kernel.org>
 <20260411-tireless-agama-of-advance-5bdabf@quoll>
 <20260411-exotic-astonishing-piculet-0cd25e@sudeepholla>
 <45bc09d9-33e0-48c4-92a3-9bf8e64ef80a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45bc09d9-33e0-48c4-92a3-9bf8e64ef80a@app.fastmail.com>

On Mon, Apr 13, 2026 at 08:23:58AM +0200, Arnd Bergmann wrote:
> On Sat, Apr 11, 2026, at 19:35, Sudeep Holla wrote:
> > On Sat, Apr 11, 2026 at 10:49:50AM +0200, Krzysztof Kozlowski wrote:
> >> On Tue, Apr 07, 2026 at 11:08:39AM +0100, Sudeep Holla wrote:
> >> > ----------------------------------------------------------------
> >> > Arm FF-A fix for v7.1
> >> > 
> >> > Use the page aligned backing allocation size when computing the RXTX_MAP
> >> > page count. This fixes FF-A RX/TX buffer registration on kernels built
> >> > with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
> >> > larger aligned span than the discovered minimum buffer size.
> >> 
> >> Can we avoid per-driver trees or pulls? You do maintain also ARM SCMI
> >> firmware driver, so this could be sent together? I think you also use
> >> the same Git tree, right?
> >
> > Sure, I can put all of the firmware drivers I maintain together. I had
> > for some reason assumed individual PR is preferred.
> 
> To me, that's a function of how complex the changes are and how
> you describe them in the changelog text: If you have a lot of changes
> for the merge window, having one branch per firmware type probably
> works best, or even multiple ones if you have a series that implements
> something new and a number of random changes do existing code.
> 
> If you have only a handful of bugfixes across multiple firmware
> subsystems, a single 'firmware fixes' is less work for all of
> us, with no loss of readability in the git history.
> 

Understood, will try to follow something along these in the future.

-- 
Regards,
Sudeep
