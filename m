Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2830ACEE
	for <soc@lists.linux.dev>; Sun,  4 Oct 2026 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111671; cv=none; b=Y3BvraOZxLSEKHVOqXEjpNPZpIfeIfHXHmzWTH2KIRosgf8EaxgPuTFgNUkCCtMgXrR7Y57Sd/NABo+pNpaSIFm+CDdkuLDxIBm63175ifaTLqebhAwaEcKmgtIJ9IRo2IcjCmrKeir3Xn7yZPMWcVzQ1xd4AfjGcCHjfNF8pKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111671; c=relaxed/simple;
	bh=FAQH0fWG+UMOLc7WvTMXiswPDPpJLjoq4Dq6LhufkHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY/w/OozKwg8RMv/PJMujK6qo7l2DK59/yaC7vbvy3ibdnsnNJhylSWKpZ1hAlaxad/KUW6mf6DHFl5moB8uIVqgSc1uK7NhfB1sDToJWP0Damqrsb54JBuMvASfVBJz2Jz9lGPELrdVRBTpUwL6LRqkyNbg+5S+YIFGSnWXuMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxahJQzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxahJQzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C460E1F000FF;
	Sun,  4 Oct 2026 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791111668;
	bh=6kopioqHpTcZMPLSZnL2p1LjYG4zHRyxFSvg8n/BMRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jxahJQzlEPxblUZEXzWhDdypG3mkT9HOSNjeFpqi1Ma2bPQsCNYrtUkdsPP7YEMwN
	 wuwMOaRgDIad/jUhxKy+SrY5tPiAccCfbS/wItq3ytkUtTMay/vK5fv32sqerI3W+g
	 3+f80hcOx49r1enOdCUb5R0vV0KQT3iLWCaER1RowmawO6wLWxvOBmNm7RROj4SbMv
	 nrccLzYhheo6GYRTvaQ/gXDcsT8jjE1JWVyGbArxNZHRnvH9Kqq9abS1JpEyDe4ZDD
	 8qjhdQFDJ4FemT7SAHmnUJ1FbLUwDM0XQ7I+ROqmj8ZkfasD4r2NF60zWGb7WU6e2O
	 kZEeoEfwfcr+A==
Date: Sun, 4 Oct 2026 13:01:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Gemini DTS changes for v7.4
Message-ID: <20261004-wondrous-convivial-dragonfly-bc44db@quoll>
References: <CAD++jLnPdC-LjiofpLFHHh+BqWUhwmE9ee3xLk1gsmRD5r7wHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLnPdC-LjiofpLFHHh+BqWUhwmE9ee3xLk1gsmRD5r7wHg@mail.gmail.com>

On Sun, Sep 27, 2026 at 11:21:11PM +0200, Linus Walleij wrote:
> Hi SoC maintainers,
> 
> the following are two small DTS patches for the v7.4 kernel series.
> 
> Please pull them in!
> 
> Yours,
> Linus Walleij
> 
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
> tags/gemini-dts-for-7.4
> 
> for you to fetch changes up to 5bf1bb010712bba28eda926ed453db3cab91381a:
> 
>   ARM: dts: gemini: Use a level-high interrupt for TVE200 (2026-09-27
> 23:13:42 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

