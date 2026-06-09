Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AB840B395;
	Tue,  9 Jun 2026 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007539; cv=none; b=U+eY5vzfxL5F+AHODZOZDcWJeIsE2AxeEBSlYTXSlMyzGKpSduFAoJefiS19dHy/JOqEjmBgnPNweryAhsVqlLrgCeRWop0uHaiho22eaF571rW8mFbC5oXyWGhyPkWBYsV0a4PhJ5n5bnEPentA+t2kE6g3IC8TSXgVS2phZ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007539; c=relaxed/simple;
	bh=61jixD+1/BqwO3ErWN06O4QvEDlB0WBfuOg5SDM5NTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEr9Gfrt+hlMKYHW5HVsolg0JOxcTtza8cwngyGZ/g5ra46SaENlFiWvQN5+xeCJfDQTFIYcTXRxSZN5rAgzutJr/JfLeKY1jaKRd6hteeVmjjiVe0z/WdFWqKXUYM8zLRozQ2MB4IhC73igDYwI3OpNBz15Gk5H9WLiU3W1t68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUrsJUo4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUrsJUo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE091F00893;
	Tue,  9 Jun 2026 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007538;
	bh=vDOEE8xBUSXxvq4xLfdOp0TCxRvuaF7+Cmh+3kfoHpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nUrsJUo4SBKUrJ95fNqHM7pJvu41I5sV4u6qmdzT46KMoUiI3QxhnETMEomM1BtgF
	 wwaQL/RoH5HufkUOZectSI3noKVXotyShS5hikS4/xGVaGHzXQgVRALWFpNSLv4aYh
	 Gey+VJ+gxydk9kYpnIuoGKemrS98uO5GM5ATv1knOtXYsn71FnX3YbVaLM+8ITLkuS
	 D6TWh3teAkMZFabGIlK01zvI9Wb7JyqsopMHLibnqbW6imSojLIiRVJ+eB369GeaGc
	 ITPlPwPtKqR8wraGxn/YyxqOn0xg2qhZrv1O49cLoo9uyOFKfLSr15B5KMvuSoH2j/
	 HtkYY9mICf1lw==
Date: Tue, 9 Jun 2026 14:18:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [RESEND,GIT PULL] aspeed: First batch of ARM devicetree changes
 for v7.2
Message-ID: <20260609-axiomatic-bizarre-boar-03f773@quoll>
References: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>

On Wed, Jun 03, 2026 at 04:48:43PM +0930, Andrew Jeffery wrote:
> Hi SoC maintainers,
> 
> The first attempt[1] missed the preamble, so here's the same again,
> this time with it included.
> 
> [1]: https://lore.kernel.org/soc/55ab27bc5e09252b1dbfdf1505693eb193b8e846.camel@codeconstruct.com.au/
> 
> Cheers,
> 
> Andrew
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.2-devicetree-0
> 
> for you to fetch changes up to 1249ee157de518a76cec169e2a5db4d6e523cc90:
> 
>   ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename (2026-05-27 12:44:26 +0930)
> 

Thanks, applied

Best regards,
Krzysztof

