Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9453FE650;
	Tue,  9 Jun 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006912; cv=none; b=Hucopw/1a5Y8C1qg9yPUme1JgBrWlWLOjEbwa7axgDzhmu8w9cyvqbePqjslv3my3PNbKbV/SVsdBphYpfqjB/xRsLcjheTIU7+Q3Vfm8VyJIfERgENOZizscSNve2vtQGEzjiLaSdZp38jNuRqnlyGsgft/8aBV4hm+nXUgy7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006912; c=relaxed/simple;
	bh=ZHzB3NgSQX2TUo9eWZE9/jpK+5TMbk+Xaygf8hIo4Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Keht0x594zinuOzse/h/PjrmeIcF/YyqZZp/zKA2Xl4OxNIfuG3hEBJ7ui0YUuvt/W6ZbEr9zHyaHH5cLC8OMwWmF3Oh9bScqzaZwokUjUXyx1kbplpztCDkKzcu6lOg+h4lLbZ94lRHduOyHPhIsxqRzP1RAAiBhXEKUikdNUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6zkuvUM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6zkuvUM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE911F00893;
	Tue,  9 Jun 2026 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006911;
	bh=z4QYzDYf4/LUWmcbI+d1Kkrx+Xii4UCyajoKUl5bZMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6zkuvUMo1dX1Oo/ktt7gDmslK7EFxj38ahtkJ2xhdF/GSRgn25j7AHTBZmIcJUMT
	 JFyLmyMZMs9YbeBIkOcAoAD29R0IWlkwfFuz5Pno6wfrGhFk5aJ383vGdJW8jGo+F1
	 Zfw/8DdrADuIzwPS+e/HO+qR/5JutfPOXuNR7XR2HYiVFBE27v+Ag1YQDLgMfSV1nF
	 iDwyHxQYYScK5TJUtxONzMJ3kgRjFAatKT2/r758I9LBWIrhgac+xJLIUiOQV+MpR3
	 QDc9paWZMSQzQXiSFwxiuktCDkiW0l5ci9ZP+en6IGlKmLV6SIQzLFexkNi3N9FVRf
	 iloZ0b3GkLgCQ==
Date: Tue, 9 Jun 2026 14:08:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for
 v7.2
Message-ID: <20260609-beagle-of-splendid-contentment-bbaae3@quoll>
References: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>

On Wed, Jun 03, 2026 at 11:25:29AM +0930, Andrew Jeffery wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoton-7.2-devicetree-0
> 
> for you to fetch changes up to eae82b6e8c2399892e145195cae9aaa0b960fdaf:
> 
>   arm64: dts: nuvoton: Add Ethernet nodes (2026-05-18 23:18:01 +0930)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof

