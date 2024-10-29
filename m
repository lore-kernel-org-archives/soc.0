Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D6D20124E
	for <soc@lists.linux.dev>; Tue, 29 Oct 2024 06:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184231; cv=none; b=kJmi+zA9MHm9Ef4yF9fht/NxtZQf2GAmVby+gQHPJ+sxNnMHKJijQQpR6qu3EBkyksoHdmIFRhGSCk7nr8cZBF/xvHndG6oI8E9i/tb8yKqpKxJ4ZvqRxr6Nkeuco3ZaOIv+HPz6agP5G0+7pTwZ1KviPZqb5A1mjCGjWVzQRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184231; c=relaxed/simple;
	bh=p6ZYZ9OWhXmmYKnTAhTfRO3HXLVN4aZzxE3EOAuJU4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDXNRuRa2gFwRshmnmXII4+zsvxL8Yahn3xk3h8JQbtqu1J560Ipl0fZkcE5IXN1igIhI/eDWoV22vQ0FBWXL4E7Lt4F1ysoKZYnmFLJh1WAH0fepNtGcdOFxeubJ3JLjwP2OgaX6/xIxsWxBDhu1I9Acnyry09ov3kktcii2Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C9875C4CEE3; Tue, 29 Oct 2024 06:43:50 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2852C4CECD;
	Tue, 29 Oct 2024 06:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2852C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Tue, 29 Oct 2024 14:43:44 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jesse Taube <mr.bossman075@gmail.com>, soc@kernel.org
Subject: Re: Include in next: spacemit/linux
Message-ID: <20241029064344-GYB97300@gentoo>
References: <20241029045326-GYA331364@gentoo>
 <20241029173322.4d879601@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029173322.4d879601@canb.auug.org.au>

Hi Stephen:

On 17:33 Tue 29 Oct     , Stephen Rothwell wrote:
> Hi,
> 
> On Tue, 29 Oct 2024 12:53:26 +0800 Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Please kindly include spacemit/linux tree into the linux-next:
> > 
> > https://github.com/spacemit-com/linux
> > 
> > branch for master: for-next
> > 
> > branch for pending-fixes: fixes
> > 
> > Repo will be use for collecting patches for SpacemiT's SoC
> > which recently I took over:
> > 
> > https://lore.kernel.org/r/20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org
> > 
> > The patches in the tree will be sent to Arnd Bergmann and soc@kernel.org.
> 
> Added from tomorrow.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 
Yes, I understand and thanks for all the info..

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
