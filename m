Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181F7263B
	for <soc@lists.linux.dev>; Sat,  4 Apr 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316142; cv=none; b=QfJSSE+Aev8tVeqjx7219qnUrABvvUK4XGRL9f5VF7t0BtRzYfzAW381s1ucwWoPZqa0ytc9YHQ2mYtIhfpl/GuTJLfHYXr/d85pvKXp7Xpq8NdylCgyYs/w0oR1MMWfUw3D9pxda9qjc0y73rVCi5pcmiD9jxrJG8CP3qIBb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316142; c=relaxed/simple;
	bh=Ppz/O79346bLLCfgNyv13kyN0qysezj1EnPkWURU7AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwjIf4WtTfRGxchVJkQBvv4a9unFAozmW0f5wFV4fkfpjP40KBeVahJ3qXtJa3RFqbGPQojDzc8j6aGSamu3H5E69O5sNU/TopL3JFMwYZgFGXLMk6g1rUM4AEC0l4ZGqMxyv36WVDM+y4xXW0PdtjDi3ewl3JWDbS3L5bns5hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrUMiwft; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrUMiwft"
Received: by smtp.kernel.org (Postfix)
	id DC943C2BCAF; Sat,  4 Apr 2026 15:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456FAC19421;
	Sat,  4 Apr 2026 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316141;
	bh=Ppz/O79346bLLCfgNyv13kyN0qysezj1EnPkWURU7AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrUMiwftsg8nYQqjIb9yjkXV117omnCPLtwqjPTBTsEqW/RrQOjrp228U0mib0Hd2
	 OkahZMZm2pvowXdxaL3jYER0x42Dr2mNCrIuUzBwF1t2QprNb9W33Ng50yqeBxWRRW
	 ClajmeDno5mYy25X8EVDk5yScVciDcKDfV4iksmvXwzcLAv/94l6+qwoJVUDcV65vv
	 UTWWtfUoD7LIJ/fYwagYWBZ0o+nyX2gsGHdi7dujJ8/L14pwL1Z9gCZnb2v++dV96O
	 +43wVQi757XUPo2/o/dtUnkoq3zJDWz6p4Uw/qnC3RQ3c8vc1VSV4PxQPM/z15lgZ9
	 CzAzMirSOX4ug==
Date: Sat, 4 Apr 2026 17:22:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip AT91 fixes for v7.0
Message-ID: <20260404-enchanted-proficient-nyala-a5fede@quoll>
References: <20260403070239.2552455-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070239.2552455-1-claudiu.beznea@tuxon.dev>

On Fri, Apr 03, 2026 at 10:02:39AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.0
> 
> for you to fetch changes up to 907150bbe566e23714a25d7bcb910f236c3c44c0:
> 
>   ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB (2026-03-23 12:54:24 +0200)
> 
> ----------------------------------------------------------------
> Microchip AT91 fixes for v7.0
> 
> This update includes:
> - fix gpio-lines for SAM9X7 PIOB GPIO controller

Thanks, applied

Best regards,
Krzysztof

