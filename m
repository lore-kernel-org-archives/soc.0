Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C03F7E8D
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042667; cv=none; b=dBQITJtjeiueDvds1Y6vwuPJXQQMhdu7HPkA9D4a6jVeINYELphKecpoVyERWTz9TCeut5Zd68R6+oCN911KX0q8pdfMSD1Fb9fPZbwbSt09YZ0H0AGF255K3QPOn4xuuXeWeoj/MKUzzrEaJGecRkRr0mZeYMkfJ8H0lVEJjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042667; c=relaxed/simple;
	bh=y/ngwuhS2Jpyc7YPVHpxC4rTjEHqs+MNlAUE9lvy6ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eABbewm0gtrY2fpw8scWpOoOZAJjrXMcyuhmLW13oWtPsS0DXjDyGWHhF3mI7/VdI5dOCPelB1keOJtosGB4GhQZnGH2eyEyObw4NWVPK8lMbqdJQ09+yPY09QUZsnZrMxcxXk1avbMgsYzCztS0/AeFPt+nP/DxB69xVtZXFfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFKQByon; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFKQByon"
Received: by smtp.kernel.org (Postfix)
	id 7AD94C2BCB3; Wed,  1 Apr 2026 11:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4B2C2BC9E;
	Wed,  1 Apr 2026 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042667;
	bh=y/ngwuhS2Jpyc7YPVHpxC4rTjEHqs+MNlAUE9lvy6ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFKQByonYUSgTjPkV2Aykn9g5VCvZzzHo/SC8SWELW+CT47wk5/9yIzsD9e5tgW0q
	 ikjhfUMqzGaiDJ3xfyewqYzurXovNyxW8PMZoWcae1t1qHdnBOkTsvGqXps7P0TEdX
	 q4mu4LTbUE1qxawxTqo52soq7OtLm/uC97bOmJu/ZHPyMFi/Y8uSXI9VSyu6cWsoN0
	 U021ThzgmwK4I3X76ee4qRsUs4KBXbFSomPFTTvGXSGoncqOIjfCilOgb3hScksV2A
	 vfZ9gB4d2csuedAb/TTiBnHD4vqKlEqeMXKD40bUBIDfHA+Z8CxC/M8BE7Vr4eQIMr
	 Lct2gHc9KEyoA==
Date: Wed, 1 Apr 2026 13:24:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller fixes for v7.0, part 2
Message-ID: <20260401-imperial-hare-of-defense-8cfc87@quoll>
References: <20260324094255.3538772-1-p.zabel@pengutronix.de>
 <39b18202a275168eb4344a2515f7c18723eaf8b0.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39b18202a275168eb4344a2515f7c18723eaf8b0.camel@pengutronix.de>

On Tue, Mar 24, 2026 at 10:55:47AM +0100, Philipp Zabel wrote:
> On Di, 2026-03-24 at 10:42 +0100, Philipp Zabel wrote:
> > Dear arm-soc maintainers,
> > 
> > The following changes since commit e0cf84109bc6c6768337123f1de24ff56b41c91b:
> > 
> >   reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-02-23 17:03:28 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-2
> > 
> > for you to fetch changes up to a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:
> > 
> >   reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)
> > 
> > ----------------------------------------------------------------
> > Reset controller fixes for v7.0, part 2
> > 
> > * Decouple spacemit K3 reset lines that were incorrectly coupled
> >   together as one, but are in fact separate resets in hardware.
> 
> It is important that this makes v7.0, as it fixes an incorrect binding
> that has not been part of a release and which has no users yet.
> 
> > * Fix a double free in the reset_add_gpio_aux_device() error path.
> >   This has already been fixed on reset/next by commit a9b95ce36de4
> >   ("reset: gpio: add a devlink between reset-gpio and its consumer").
> 
> Because of this, commit fbffb8c7c7bb ("reset: gpio: fix double free in
> reset_add_gpio_aux_device() error path") introduces a merge conflict
> with reset/next:
> 
>   https://lore.kernel.org/all/acFRVzvV9Dww47v_@sirena.org.uk/
> 
> Should I resolve this myself by merging this tag in to reset/next as
> well, before submitting reset updates for v7.1?

Yes, please merge the fixes to your next branch. Or base next branch on
top of fixes commit, when starting next as new branch.

This merge conflict looks quite significant.

Best regards,
Krzysztof

