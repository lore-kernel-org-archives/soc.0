Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9F5375ADE
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043847; cv=none; b=CwEQmG1Yjv7gy+TGV2A6y5ZWg7l4aEzmbqqioiQFChhSHbT2NIOTlx36n0bUo6jcBiTofNcXvWbp1lFiIPhuXBJB6c3IYmNczOtkbntA/XoRpQPuAYuehBFS0Cps9V/9S8Ig2r+U21dvYt6858PfSWFL0di36+yvPDJ3pixw4Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043847; c=relaxed/simple;
	bh=msYVK4Utdiqx9U2vKN4AsAcQwo+MGyKaSM3z3gcoNPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AECmBWQxRgC6RdIZdXGa44ombOsI+xU8bNzPcRZJ0E8fmQnl3hhsiIiH6lCSfHERrD6b11STgQULkYUbhAQ35hWtLzBCVYeWma+2nq/UY3Dy3NKUqkLeg8ZyO20UPk3cMuetCg9rY1wX8o5AWIEEpPqEP2nbok8KaWqH0BsyYO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSF3OmF9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSF3OmF9"
Received: by smtp.kernel.org (Postfix)
	id 42521C2BCB2; Wed,  1 Apr 2026 11:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FB0C116C6;
	Wed,  1 Apr 2026 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043847;
	bh=msYVK4Utdiqx9U2vKN4AsAcQwo+MGyKaSM3z3gcoNPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSF3OmF9Gh5QP08gC3sEz7Qg7lNGlacb1ZwnTpz4+WXuiZ0eiUIe1iNsBuFdlwufb
	 hfygd6sG1d5RDZ5RtYlaJZSmsvWpf46u+xbQa9+kJPFPIsf+0opQAnNAaTbdoaf90e
	 k8OmvpcTJsfT9ff0R2uNyS1nX1h5m7d5XvWVYgcvpWIb6OS5gRNl6otlmEOSnCFdky
	 J87pk73eLGbdkWtaAnJYwN67g1gLzMGt+3ftaD6WPMBsbfSZjzCyfpQS+UYLr6C2Lk
	 ryRbKfgKX7gcNVIIMmJPlrWYkEB8FYtL1i0Eo/Rce7d/AcxMVYsYGhVsyJ5yllo1NC
	 /1qrzOq2EpqYQ==
Date: Wed, 1 Apr 2026 13:44:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ~RISC-V~Microchip soc fixes for v7.0-rc6
Message-ID: <20260401-bold-positive-flounder-6e7b0d@quoll>
References: <20260326-vertebrae-relatable-adfa3baabfd6@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-vertebrae-relatable-adfa3baabfd6@spud>

On Thu, Mar 26, 2026 at 11:21:39AM +0000, Conor Dooley wrote:
> Hey folks,
> 
> Another small PR here, worth pointing out that the exact contents has
> been in linux-next but not as these commit hashes yet, I squashed a
> fixup patch just now that I hadn't realised got pushed without being
> squashed. Might be worth letting it marinate for a few days if that's
> a concern.
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
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v7.0-rc6
> 
> for you to fetch changes up to c7596f9001e2b83293e3658e4e1addde69bb335d:
> 
>   firmware: microchip: fail auto-update probe if no flash found (2026-03-26 11:14:11 +0000)

Thanks, applied

Probably better if the fixes branch would move to v7.0-rc1, not
continuing the v6.19.

Best regards,
Krzysztof

