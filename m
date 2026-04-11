Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF129186284
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775896331; cv=none; b=Iy64NvmXqwxGakC4WYhUtz+iL1EUHqldryzDqEA9bRxxCIQBRqjKwuG/QpCTW2NmexgGMaGw0ZbnvgOrxO6sL5meUw2iyI4NAwNjmh+levuhYg1xBssJxMF5MAB7+KKgxjtBCxri4sqchpMgRmt5nfKLsFI7fmyvIz7NC/Qs/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775896331; c=relaxed/simple;
	bh=HmgsdVZSABtANDAREGCwmrAh8TC6aMqoBTlAENcPbuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pu72Dw2WOqb2rn0uGcxWgjdGGtOcQCKDwMkQZg6vYzqIWiJ19wi5KTuHZz58V5NhHCCYVUM4ec83NJKZmc4T7KJJZQAynPiZBRo+ewIfcWfrcTBB3Odpg6SSxYzN+J30mahADiwVQA+Cpz/VP/NFDrXsYVNPcuFqe7xR+KSKGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1dSmwFQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1dSmwFQ"
Received: by smtp.kernel.org (Postfix)
	id 862A3C2BC87; Sat, 11 Apr 2026 08:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF560C4CEF7;
	Sat, 11 Apr 2026 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896331;
	bh=HmgsdVZSABtANDAREGCwmrAh8TC6aMqoBTlAENcPbuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1dSmwFQ/FnspaYaXCoh4AMby4Bl96nEoP//0DL836WeRau6zooB5SxS0GMiJ49Pc
	 Z6UCTzWxoENdEsqt/9xL2wM7kkiNU+jOE36HAppSsrv3XMwCceavXbEPEalkX4RJPd
	 9gnwtFLXN7fcG2FNIyhdHqSrIX/1QBfY90IlHkwnT5oqKrybPXpaB1NRbwxcFJ5Djz
	 IhmWdMerMIhIwe4bEBpdGrR4b6yKLyHTRb0/c12DyPqIKjue2PePeMcRQwoupe3sKU
	 tc5/NsROtgRghzmL5l+5gwQll+n09JtRGCrB5/y1uTgkyUzb6qFebbG2mgdriqK+CS
	 /wIs8GwmcI1MA==
Date: Sat, 11 Apr 2026 10:32:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V soc drivers for v7.1
Message-ID: <20260411-meaty-wolf-of-glee-eb7f5d@quoll>
References: <20260406-spearmint-request-b71f627dc08c@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406-spearmint-request-b71f627dc08c@spud>

On Mon, Apr 06, 2026 at 11:35:15AM +0100, Conor Dooley wrote:
> Hey folks,
> 
> Please pull my driver updates for 7.1.
> 
> Thanks,
> Conor.
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v7.1
> 
> for you to fetch changes up to bd34cdd6d214f815570986ce55978fd7ddd8d8ac:
> 
>   soc: microchip: add mpfs gpio interrupt mux driver (2026-03-31 14:13:14 +0100)
> 
> ----------------------------------------------------------------
> RISC-V soc drivers for v7.1
> 
> Microchip:
> Add coverage for the pic64gx in the system controller and syscons.
> Add a interrupt mux driver (akin to the one that Renesas recently added)
> that fixes a problem where the platform never properly modelled gpio
> interrupts. There's a gpio driver change here that Bartosz has acked
> that adds the interrupt support to the GPIO driver itself.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 

Thanks, applied

Best regards,
Krzysztof

