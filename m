Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB22836A0
	for <soc@lists.linux.dev>; Sat,  4 Apr 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775315991; cv=none; b=J+M7YqJjssSgAnXEup0S76DbmEXEhVuHgLQ0yrSKZTx2p5b6uH18IdvGpVuXY089V8D3PP0vaAODd6/1NYjjOfKG2oB3yX+HQjXAhXhso0JVlE2z/GnVfli/RJWUVlPOEttr9Dmmt8JrIVIrc+VodXrEHRmpNEYL7uE9RjGSiEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775315991; c=relaxed/simple;
	bh=RZpBy1W8ddbDfVqW4Yh7lVZzo1IIk9BJk40f7jgPCMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJ4/1T5lySF6n4PHJTGl72U4rZsrHAPMPGDqz6v9g3VAJ0U2lJKartRnn81OdJfugcMkLw8eV5SzQ7kBKIeOSndaCXFCEH99LG2SIxgS3qU5w0Pa+HVnK7m6Ww8XH0Q4iy4i+/48rmeQnCPsT8OIUEdESgl6l+3XSeai0ere4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9rT3Mys; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9rT3Mys"
Received: by smtp.kernel.org (Postfix)
	id C3B73C2BCAF; Sat,  4 Apr 2026 15:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232EDC19421;
	Sat,  4 Apr 2026 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775315991;
	bh=RZpBy1W8ddbDfVqW4Yh7lVZzo1IIk9BJk40f7jgPCMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9rT3Mys8dnrL+UZLBgvvxKaSDo6+VTgrt2wP6IMdYbxMIHrXDgBBuqBOrb16jcqo
	 HA+SZ3HfSbkE1ISXvLb2AClsOMa/yD8FZ7yrs74vrW2tfHti/B0Y6k32QBjnj8RzsF
	 1Bkx2WMdqSyZrn9ggWUgVJxg0yXodaYaxsB8+OznHYzgj9mI4F3yopcrfNkxKvSWI7
	 bQ4ah0r7jiPcpsxrwRQr0LuOf9+MdLzPJtrNgsSKPRem6mQKiiiPqEGqiY4vy6BvEN
	 5BsDVRNtuNmJtqY486oFJJLq19b8lNbJ+/fDsPYgZ/BQCbR/zoq1NeU6wmhkKW5ZCq
	 uEGFdFHBtWYXw==
Date: Sat, 4 Apr 2026 17:19:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Message-ID: <20260404-accomplished-rainbow-dragon-fce194@quoll>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
 <ac7rV0xGGVmxT-V4@inochi.infowork>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac7rV0xGGVmxT-V4@inochi.infowork>

On Fri, Apr 03, 2026 at 06:25:32AM +0800, Inochi Amaoto wrote:
> On Thu, Apr 02, 2026 at 11:43:43PM +0200, Arnd Bergmann wrote:
> > On Thu, Apr 2, 2026, at 04:39, Chen Wang wrote:
> > > For CV18xx serials:
> > > Just a minor patch to replace the compatible for
> > > dma-controller to allow setting DMA channel number.
> > > New bindings and driver part change are picked by
> > > DMA subsytem and this patch handles the left dts
> > > part change.
> > >
> > > Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> > >
> > > ----------------------------------------------------------------
> > > Inochi Amaoto (1):
> > >        riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
> > > channel number for DMA controller
> > 
> > Doesn't this change break backwards compatibility with
> > all existing kernels?
> > 
> 
> It will break if a old kernel with the new dtb. But I
> think this will break nothing since the DMA device is not
> used by any devices in the old DTB. And if a user force
> the some device with DMA in the old version, it is just
> not functional and lead to a broken system.

Then commit msg should explain that old compatible just never worked.

Please update the commit msg and fix the DCO.

Best regards,
Krzysztof

