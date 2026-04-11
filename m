Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815171F91D6
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775896205; cv=none; b=QHK5T1pXxIYxVfKbL4527lz75u69JQOEJzEhpLJ5sQiRs0CojMuiQ/RegJoASt2ycBmz23iNZzXVLtdjfKrsuVQwjcecrSdTiVvLcAn7QA1ZvLOT9hFLhSySiHdmf7+sjlEfJchjXkbwpjCfQOdD8lKAlbgtImrLtFy+i9FdztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775896205; c=relaxed/simple;
	bh=sNa47R7FO11+M8osg2I4wKoZye42hyF1yBwYH7np4TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOL3CZ46vKdrcBrj7lFeK138Or5m40GrPRCSCJs+PlzKmxn42Af7pyw1PjFXscTqNc6HfaR5+apxM70QXgwZuaTmAdo1ClThhN5vglu+kLxnd9efPqUv2DVhsgJva2c+MeYMolmUjLpawUvqA+hoALwBuMBE3Ti3VDkcUBCFWTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBApDLJn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBApDLJn"
Received: by smtp.kernel.org (Postfix)
	id 3B81DC2BCAF; Sat, 11 Apr 2026 08:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98834C4CEF7;
	Sat, 11 Apr 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896205;
	bh=sNa47R7FO11+M8osg2I4wKoZye42hyF1yBwYH7np4TM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBApDLJnqSTwpOUQA1e+zJVoyHFke2u+qArjGacFUiTnrO8eHobq/HuqA5CpEUU+z
	 RJSq01NLOwIm52QKdZV79xpMMtdFrjaZrL8ybYxotbZREu0ph8YgJWmJAtcN3PGRbn
	 DJVEc/8XW0fJ1M1Wvu3o0ZNmoreowkuXTTMGYVSAvSh5FEJB1w7F45VIWd4rMPhWRv
	 UAxHDi4QHwN9CPLqxYkl0RI5fyWfvrrQnEtlL2Wip0El2GP5Ce9l1HKL8MiyO5r3BY
	 AG/3f1pds8sX4oG49eTA18DoAV3uY2cXU8IXSZGxSPBVHR4WHkKCr3/4lyaqnySTUa
	 Gg/BfW7ZvMoYQ==
Date: Sat, 11 Apr 2026 10:30:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V devicetrees for v7.1
Message-ID: <20260411-loutish-hound-of-attack-8e2576@quoll>
References: <20260406-bronze-anemia-a5b3a254f46b@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406-bronze-anemia-a5b3a254f46b@spud>

On Mon, Apr 06, 2026 at 11:26:24AM +0100, Conor Dooley wrote:
> Hey folks,
> 
> Realised as I was tagging this that the tsu clock and gpio interrupts
> changes miss the pic64gx and should have been rebased. I'll send another
> PR later this week I think, with those two fixes. Nothing is broken by
> the two fixes, they just didn't fix the newly added dts, which is why I
> still feel comfortable sending this, particularly given I am pretty late
> already. My excuse is that I was sick all last week...
> 
> Cheers,
> Conor.
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v7.1
> 
> for you to fetch changes up to b0258f69f1e0ed98e8506706da9ef538389b27ea:
> 
>   riscv: dts: microchip: update mpfs gpio interrupts to better match the SoC (2026-03-31 15:51:52 +0100)
> 
> ----------------------------------------------------------------
> RISC-V devicetrees for v7.1
> 
> Generic:
> Add binding coverage for Supm.
> 
> Microchip:
> Add support for the picgx64 and its curiosity board. This is a PolarFire
> SoC without the FPGA.
> Add the missing tsu_clk for ptp on the macb on PolarFire SoC and resolve
> a long-running problem with gpio interrupts being incorrectly described
> on the platform.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 

Thanks, applied

Best regards,
Krzysztof

