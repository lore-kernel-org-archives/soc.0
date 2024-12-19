Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F86225411
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616545; cv=none; b=Et1+W1CpmfO23K1VZdmBltrApga1VnQVk1dH5c+nOZGFrMeyxI6RqT4CFUCE7vE9SHv3+rbP59E+q8Fa3JJoB8bBJoXqGS5QAnRdeIHhuXo1p+LseqYKMTsnLCgtJ/x2sUnGuZzHnipkiaKVPSwyCalgu/+0j9mjUepWjmi9hf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616545; c=relaxed/simple;
	bh=mDyC9BihTj1Lh838q/SXn+hfrPcdGozRgEKgDusFQq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1vgyRw/oEcYWUBS0YtoaUwccSYPdu4RPAgH155O7xJp4fznltLo1rxsZVTrBG1YwlEiZ43OWq2k3bH10ZMfviTTJeJSJX8db7BEsq+sBP/8gR7Xc3evdBOduX9jRUZpTELbbF/BKuPVaAx/U13tLkRGeBpUXHQ5r/k7OIS9E0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C1BC6C4CED0; Thu, 19 Dec 2024 13:55:43 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FA0CC4CECE;
	Thu, 19 Dec 2024 13:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FA0CC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Thu, 19 Dec 2024 21:55:34 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, soc@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
Message-ID: <20241219135534-GYC3697974@gentoo>
References: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
 <173461125325.241921.7669060101424869020.b4-ty@gentoo.org>
 <20241219-lumpish-reach-00c29cf962fa@wendy>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-lumpish-reach-00c29cf962fa@wendy>

On 12:52 Thu 19 Dec     , Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 08:50:41PM +0800, Yixun Lan wrote:
> > 
> > On Mon, 28 Oct 2024 07:04:00 +0800, Yixun Lan wrote:
> > > Add myself as maintainer of SpacemiT's SoC tree, which
> > > suggested by Conor [1].
> > > 
> > > 
> > 
> > Thanks, Applied to SpacemiT's SoC tree:
> >  https://github.com/spacemit-com/linux/ (for-next)
> > 
> > [1/1] MAINTAINERS: setup support for SpacemiT SoC tree
> >       commit: f187e72262c3245bc032a1a0f106784fb8562a0b
> > 
> > The for-next branch will be sent via a formal Pull Request to
> > the Linux SoC maintainers for inclusion in next merge window.
> 
> BTW, did you get your branches into linux-next yet? I forget if we
> talked about this before (sorry).
yes, I've sent request to Stephen and he handled it already
https://lore.kernel.org/all/20241029173322.4d879601@canb.auug.org.au/

also, I've requested to join LKP project
https://github.com/intel/lkp-tests/pull/386

> 
> Conor.



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
