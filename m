Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7583D88EF;
	Tue,  9 Jun 2026 12:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006753; cv=none; b=eDq+S88zGRlHbvIM8W8Qpt/BX7hh6T6d11EbMkOVTPEs5Uwxsla5eMEvCEixUafAEpaQ36d8qunIKXUOxiXz+leP1aK2Jp9Yb1kcvdJ6GP0NoALcUqONr+XyB8oNOx1UuNxEqQXE6GJRv6hqPEk45aKrgopCIwYyTIFHEEW+7qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006753; c=relaxed/simple;
	bh=YtObs/RVBIySZDAOzRfaUi5gOwPoSm3CH6TLM5Qy0Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foF+xAuhEP7kt0QjKMhqsl73u9TH5IUX7Z1r1uZcB+NTecqK7KWW40ocmgZMqrLVKXfb3zOaL9EFjPcYHD5SKe8wTf+nrt1NJ/mS2c0c1vBRT7aqLjZU6YQFrBEb95aTz27TAtBH5yiaE7nWJ7APC2w0R0vRP+hqh24F2KUBGTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBAi9LEJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBAi9LEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CA31F00898;
	Tue,  9 Jun 2026 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006752;
	bh=g8UFSx72RbpMItY1SQYyOWf0b2YOdayj8KbARCCd1rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NBAi9LEJgz0xgPh8Tv6S3ZF/2vmonRfnQ5eaTzjG1O5Iv//jlKEi4+ior2wD9Y3aB
	 L3sMnpac4VuUjiuQ1ns/kbSMvmft1DKwb7b8f+OR5kazE7CTjKUwY+w9cBkXZxhACs
	 AnBtkinRqAvGoX5IYJRH/AuF9K2OIRbCagoO0NCMgw/tAnQA5AE0kDArU0bfZo5s8m
	 vbNjkLLX4iVgCMM7CbzvH8SiUj5xcNRFA7FjtnLs/JCNq+m/1hrGdvsSGBgmuiekdR
	 9m0Ypz6cOg/UkEBRyr3oOIQd4cJKHceknQYhZ+TOv8AuuO/txld8hTmL5cKPKE/KuU
	 ullBC9AH4h2ag==
Date: Tue, 9 Jun 2026 14:05:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] aspeed: First batch of driver changes for v7.2
Message-ID: <20260609-terrestrial-magnificent-loon-24eabd@quoll>
References: <6b6b592163523beea48e875a047afc8b4bdbb00b.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b6b592163523beea48e875a047afc8b4bdbb00b.camel@codeconstruct.com.au>

On Wed, Jun 03, 2026 at 11:15:25AM +0930, Andrew Jeffery wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.2-drivers-0
> 
> for you to fetch changes up to bc13f14f5cd3d15054de38dc1232b49343d36297:
> 
>   soc: aspeed: cleanup dead default for ASPEED_SOCINFO (2026-06-03 10:47:55 +0930)
> 

Thanks, applied

Best regards,
Krzysztof

