Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEC230264
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775897393; cv=none; b=I9L/Wzt/5X+kuQdTMUShv/mg+8PQ/iBw3eE9+/5qI79UQ+jgJeFP9jPD5PtB78+2KBUu6u2dTsQHdXOLyeHAeJoULX+Gl2NY3bkRBLMv+yCGvid/YcDGJ8SoZZVhlHeY40dT3CU2iie/OhvRKXkAg7Inj6oqbTGexPy1/iT9Ai0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775897393; c=relaxed/simple;
	bh=KVDPs0/AR7SfA/haz9MFeLHwZP/iNdbl1ulmOeYe3F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nf/+tXm3XK/wMK8D3BPmsImlmOUAVGSvCBKl8grVtiVYTUmbKjJ0JnNk/1Bvas10D3YWil48ayFPfxZi0xOvdrrFchMPu1fKYI6m+bXbxZbcyof3wio7mQloaZ7pwC7XhTet+SKZPP7PeRU/AoCYaUOx0gjnnrdJY0LFM88M9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtRXhwTP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtRXhwTP"
Received: by smtp.kernel.org (Postfix)
	id D147EC4AF0B; Sat, 11 Apr 2026 08:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6430DC4CEF7;
	Sat, 11 Apr 2026 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897392;
	bh=KVDPs0/AR7SfA/haz9MFeLHwZP/iNdbl1ulmOeYe3F8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtRXhwTPBNQjpr9wuxzV0WvknJFHtD1f6ORK9Vo7ALKRuBiJwFfpTiaGn+DG1jkdh
	 z5t1zFhjNKyjBMhAnhA61RdsQGuvPjUheh+IpZ/TjcBNu5207odJzYENGIzoUrcPSJ
	 3ORsIWYygOJOYl95O3onNNHY0Nq1fDPylnEJzAO8yMQ6IsmuAmVbprvI0QG1YBYWjp
	 jBohcpBJpBQj7nG30LvZwlCAcbn79NZ5V50w3ZqNruKSxa5YS9unT2Ag445QmdCgIJ
	 9OaZf7K+n3PcDAg+gVnfYBBEwrIyE+FVacJNaWrOwluMTlWZWpxX69+azreFV72tOL
	 0q/zWw36hpQiw==
Date: Sat, 11 Apr 2026 10:49:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Message-ID: <20260411-tireless-agama-of-advance-5bdabf@quoll>
References: <20260407100841.3150090-1-sudeep.holla@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407100841.3150090-1-sudeep.holla@kernel.org>

On Tue, Apr 07, 2026 at 11:08:39AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull ! This is the only fix/update I have at the moment for v7.1
> So, I am sending it early as fix but late as an update for v7.1.
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-7.1
> 
> for you to fetch changes up to 83210251fd70d5f96bcdc8911e15f7411a6b2463:
> 
>   firmware: arm_ffa: Use the correct buffer size during RXTX_MAP (2026-04-07 10:47:42 +0100)
> 
> ----------------------------------------------------------------
> Arm FF-A fix for v7.1
> 
> Use the page aligned backing allocation size when computing the RXTX_MAP
> page count. This fixes FF-A RX/TX buffer registration on kernels built
> with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
> larger aligned span than the discovered minimum buffer size.

Can we avoid per-driver trees or pulls? You do maintain also ARM SCMI
firmware driver, so this could be sent together? I think you also use
the same Git tree, right?


Thanks, applied

Best regards,
Krzysztof

