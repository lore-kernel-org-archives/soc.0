Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA539223708
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535787; cv=none; b=Lm/BQUheiLbyiTA1dGd0LRqyte9N5NiPH6p2oq3JrYD5KYZhsFEybItsasGUFzQPrOHkJdG35NTRRTO3ykyo2K1T+YUaTUsPF1YMBsuaHJEP5g125UOdoC833O+t/n/u3xf5HTXblCJUlrXEkj0i462BoqlipbAN7OZogtL0fxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535787; c=relaxed/simple;
	bh=hZWP882Lnd65PH8KTZ74v3FC60hfKbg0zIul4bWmgdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n15gqrL9DfDtUN3bJ48Qd4G8cySMXgi8V4OdyrULJGlNEOP/f8wu70cmdIZiX0/6TmFF33vW2HOtpZ5ygjHLu9kUZvD6zjLDrMz++SMnnMu8A7nllJww/tT60zK0tYtYismY7v4saQ6u0iuCG9L39s89TfI+wVtls5opzMT8kM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=VohLqe3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="VohLqe3m"
Received: by smtp.kernel.org (Postfix)
	id 7A7C7C116C6; Thu, 26 Mar 2026 14:36:26 +0000 (UTC)
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD411C19423;
	Thu, 26 Mar 2026 14:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD411C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=freeshell.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1774535771;
	bh=1Lei1huVmK0jk2taTPA5pPS2SS/y9aUYJzZJfAWZZpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VohLqe3mXfhCHB6mZNGLhvm/bK+AfU5l5FHx+Rf5FDDAlSnppNndHEHrL9mhK99VU
	 Xhr2lG1PoXqPBuJyFZDRPKtM3a4bREPX3uOlqEwHlHufZKToAsc06AVnyiDMiA49QU
	 78S2R3XnFLFsoFAmnR+XYiXqSy/65Zg63WFodfvshT3eIxBVOPokvNYkelFSuiVupp
	 ki0YB+rPB9dnnn2/YrcqXNkNaAYGZZaimKJeHTAfGQUIpJjb9tXl7ibYeSh4OhtReV
	 h02/tiHtX9LOU0SG/WFMm00+HHmZsSknx0R8iBQ6E7eVuXTadnVJni0L49VDm5Imle
	 wNtf0MFg5l9GA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 84C28B220B6D;
	Thu, 26 Mar 2026 15:36:10 +0100 (CET)
Message-ID: <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
Date: Thu, 26 Mar 2026 07:36:07 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: Conor Dooley <conor@kernel.org>, soc@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260326-astrology-rephrase-836ec663228b@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260326-astrology-rephrase-836ec663228b@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/26 04:13, Conor Dooley wrote:
> Hey folks,
> 
> Please pull a small fixes PR.
> 
> Cheers,
> Conor.
> 
> The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:
> 
>   cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-fixes-for-v7.0-rc6
> 
> for you to fetch changes up to 305f2865bd034146b2eebc77c27fc50d8d79778d:
> 
>   riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card. (2026-03-19 16:00:13 +0000)
> 
> ----------------------------------------------------------------
> RISC-V devicetrees fixes for v7.0-rc6
> 
> Starfive:
> Two fixes for the SD cards on the Mars CM Lite.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ----------------------------------------------------------------
> Heinrich Schuchardt (1):
>       riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
> 
> Ilya Sorochan (1):
>       riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
> 
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi           | 1 +
>  arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

To be clear the "riscv: dts: starfive: jh7110-common: fix jh7110 SoC
boot from SD-card." commit does not affect Linux whatsoever, there is no
problem to boot Linux from SD Card impacted by having or not having this
commit. This also is not common, so should not be in jh7110-common, as
more JH-7110 SoC products by-the-numbers have transistor logic replacing
this signal selection to the StarFive loader in BootROM and so
precluding this from functioning.

This ignores the wider discussion about StarFive both deprecating this
capability (for Secondary Program Loader i.e. U-Boot SPL) of StarFive
Loader in JH-7110 BootROM loading from SD Card being deprecated
officially in the latest StarFive JH-7110 Technical Reference Manual and
StarFive JH-7110 Boot User Guide documentation, and the ongoing GPL
non-compliance by StarFive for use of GPL 2.0+ code in the JH-7110
BootROM; the latter being important if we want to accurately attempt to
support this deprecated feature set as a community (even when ignoring
for the moment this copyright license non-compliance).

I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
BootROM, and openly invite anyone that would like to help get this
effort to 100% is welcome to so that we may publish and refer to this
for technical competence. I do not object to the community supporting
this deprecated capability if there is any real documentation not based
on rumors and memes; but no one has offered to do take a moment to do
this most basic of fact finding. Evidently the StarFive maintainer(s)
have refused to support this, GPL non-compliance persists and only a
rough description from Hal has been written to the U-Boot developer mail
list that does not match my analysis, all while complaining about the
capability not being supported going forward.

I object to this PR it is NAK from me on the basis of stuffing this in
sideways without technical justification or review. Also I do object to
"riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
wrong way around, it does not describe the hardware; if some external
carrier boards cannot deal with the capability of the Mars CM
system-on-module having card detect line then that should be dealt with
as a dtbo per-carrier board and not be replaced in the dts by a
broken-cd, although at least we had this discussion and Conor made a
decision with all the facts and discussion available.

-E
