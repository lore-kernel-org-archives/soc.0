Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A43264C3
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858316; cv=none; b=pZbjmKFmN50xFoX0wTePKLW+gWxINTHHtJj9dY9EU55ATkcn16UcwN2S0I/awb6aoOT3hjCwjesnr1nIU6KgfGoZIB3/0NLX6N19naVHEKEtc8OPsS5DLEVwDQtCPo8z16quR1ZN3SXu9CaWSKNDo92cVzBAW+H0Y7i2owrRksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858316; c=relaxed/simple;
	bh=P+QaGfxfF5ecip0YDs1+1u0hyK98fgAp0S9QQNbS0AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9RH9jmudKlLJX0o/i5ymtuMXUrnY2kw5rK4ikYFYeBf5VFUmGUdnQAO3WZbzVc+XrQASBsvhSfJ7GGlrQePgm55IEbK+HNWb543XDhMM2ybXdj4KRxvSmtbZIny92HlvU3nQSsrIYdn6E7IXtJGDelsJ+blaOCiUQfCt+pMgLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gdcn9DaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gdcn9DaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42771F00898;
	Thu,  1 Oct 2026 12:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858315;
	bh=suHVd3HAMQKMs6q2Wd9eb7Sfm9QCKKpljSv+opNS5XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gdcn9DaLVkQEP+04LAx6+nzhDCqRLLsGIAxF8mmrt9BON4AMzZvwG/ISPu0LqqGvc
	 8g1/KvNMOpfE4ZqBzKGwdERM2qCGl25ileZJ7OpVSXYmRUsvASV6qXY7nZxK6Z2jpJ
	 iEElmo8L+7iA7yNTRUWt/IouLJvxkBT/FMbnaKoQZAtJg6VwiVGlrawiQT2sXo0j2V
	 zXILyELqsa/NdYo0Agb7bVyNCtt1Vj18pOK+LNTl40PJ+H0bpkTQFwxDyGDFoV5bg+
	 0RF1TIC2ZC8T0hMJT4OvVURARvo0Ihp6PYB0eKvoMvhqk9qXkK1CUA5scL4w2OjQ3b
	 fJL/BWPzxxiXw==
Date: Thu, 1 Oct 2026 14:38:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Anders Berg <anders.berg@lsi.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: Re: [PATCH v2 14/14] ARM: axxia: remove entire platform
Message-ID: <20261001-hot-teal-seahorse-3ededf@quoll>
References: <20260914140821.1805449-1-arnd@kernel.org>
 <20260914140821.1805449-15-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914140821.1805449-15-arnd@kernel.org>

On Mon, Sep 14, 2026 at 04:08:16PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The initial Axxia port was contributed by LSI in 2014, but never completed
> after the sale of the business unit to Intel, which kept supporting the
> bulk of the drivers in their own downstream BSP.
> 
> The downstream work has also ended now, and there is no realistic chance
> that anyone would rewrite it all into an upstreamable port.
> 
> Remove it now that the 7.3LTS release is out and can be used as the
> base for one more downstream rebase of the downstream patches if needed.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Cc: Anders Berg <anders.berg@lsi.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Acked-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied entire set.

Best regards,
Krzysztof

