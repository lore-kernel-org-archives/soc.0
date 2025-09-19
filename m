Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446722E3B00
	for <soc@lists.linux.dev>; Fri, 19 Sep 2025 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758273915; cv=none; b=bQmsiFR1lbbbqcMFY0nzGZRB+IwCbdm7lwrfYwaEH4kyFUXAfoZZLP2kY4uBzrZ/EOr4V+mHiUA2acmsGkX+H/0hsCRsVO5OpoUZNa4Oc7WkTaWBRQl1BB8Vaq3NK3W9AXGUHGn8vpKuqR+O+QUTwuKZF+bO0sw/0GXSa1M5/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758273915; c=relaxed/simple;
	bh=+hQV36ermCg3GTswyjokH750Usr+sQ7Ds8u5SZvEtEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrbclEgFztPEFPAvZDQOohUZr3HDSkk81LXNF/d4kEBv5XK02/Gzf5GJjSgON9PNINtL12s6j9i+pu9QlRDQFTQG1rq0i3dv1aKQPrff6fDVsSMZcc/K/ULwW0Zs6/XIt0NJ2ljRl2Ly3uiBNzQi2ZcGI9UmkjXaZUgUHbsUXVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C6682C4CEF7; Fri, 19 Sep 2025 09:25:14 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C60EBC4CEF1;
	Fri, 19 Sep 2025 09:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C60EBC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 649F03420AB;
	Fri, 19 Sep 2025 09:25:12 +0000 (UTC)
Date: Fri, 19 Sep 2025 17:25:07 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Mark Brown <broonie@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alex Elder <elder@riscstar.com>,
	Networking <netdev@vger.kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	soc@kernel.org
Subject: Re: linux-next: manual merge of the net-next tree with the spacemit
 tree
Message-ID: <20250919092507-GYA1279412@gentoo.org>
References: <aMqby4Cz8hn6lZgv@sirena.org.uk>
 <597466da-643d-4a75-b2e8-00cf7cf3fcd0@iscas.ac.cn>
 <76970eed-cb88-4a42-864a-8c2290624b72@sirena.org.uk>
 <20250917123045-GYA1265885@gentoo.org>
 <20250917125947-GYA1266976@gentoo.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917125947-GYA1266976@gentoo.org>

Hi Paolo, Mark, Arnd

I'd like to have your attentions, see below

On 20:59 Wed 17 Sep     , Yixun Lan wrote:
> Hi Mark,
> 
> On 20:30 Wed 17 Sep     , Yixun Lan wrote:
> > Hi Mark,
> > 
> > On 13:03 Wed 17 Sep     , Mark Brown wrote:
> > > On Wed, Sep 17, 2025 at 07:48:34PM +0800, Vivian Wang wrote:
> > > 
> > > > Just FYI, Yixun has proposed for net-next to back out of the DTS changes
> > > > and taking them up through the spacemit tree instead [1], resolving the
> > > > conflicts in the spacemit tree. This would certainly mean less headaches
> > > > while managing pull requests, as well as allowing Yixun to take care of
> > > > code style concerns like node order. However, I do not know what the
> > > > norms here are.
> > > 
> > > Thanks.  They're pretty trivial conflicts so I'm not sure it's critical,
> > > though like you say node order might easily end up the wrong way round
> > > depending on how the conflict resolution gets done.
> > 
> > Thanks for the help and fixing this, but ..
> > 
> > If it's possible to revert the DT patch 3-5, then I'd be happy to take,
> > but if this is too much job, e.g. the net-next's main branch is imuutable
> > and reverting it will cause too much trouble, then I'm fine with current
> > solution - carry the fix via net-next tree..
> > 
> > But please use commit: 0f084b221e2c5ba16eca85b3d2497f9486bd0329 of
> > https://github.com/spacemit-com/linux/tree/k1/dt-for-next as the merge
> > parent, which I'm about to send to Arnd (the SoC tree)
> > 
> No matter which way choose to go, I've created an immutable tag here,
> 
> https://github.com/spacemit-com/linux/ spacemit-dt-for-6.18-1
> 

I've sent out the PR of DT changes to SoC tree for inclusion, see 
https://lore.kernel.org/all/20250919055525-GYC5766558@gentoo.org/

There is a potential conflict with commit from net-next:
 e32dc7a936b11e437298bcc4601476befcbcb88f ("riscv: dts: spacemit: Add Ethernet support for Jupiter")

the conflict itself is quite trivial, and should be easy to fix, and I'm also
personally fine to have it solved in net-next tree if Arnd has no objection

But if need assistance from my side, just let me know - I can handle it
- if the ethernet DT patches can be reverted from net-next
- I can apply them at SpacemiT SoC tree
- send a incremental v2 PR to the SoC tree

> > BTW, The 'for-next' branch is a merged branch contains clock and DT patches
> > for SpacemiT SoC tree's which isn't immutable..
> > 
> > Let me know what I should proceed, thank you
> > 
> 

-- 
Yixun Lan (dlan)
