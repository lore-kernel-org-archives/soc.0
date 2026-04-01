Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454943AA4F6;
	Wed,  1 Apr 2026 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043358; cv=none; b=Hme9Qs3fXSUe/HphUM5bgWv1hFTghCw4bI6M3n2L3A0C63vrl1Nvw2IFGV3t9V0fr4zAB8gv4qBA8FlO2/fvHTzKrMV1GlWmA6Uv9eNiMWQ8pL5ZxgcI2kOlZI0UOwu28G7k85zP8IymDJ+vLzfazZQUfdcoKNkDu4pbWx9GNrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043358; c=relaxed/simple;
	bh=sff6V0+SikbFfnnkuOiFBlCiqZ50wVPswHcHFFLJGmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDDbbrcsM7y01ztaUfLQ2Flanz1NfmS/UJoLWgBN9y4NTxatnApGPy99BMZ/16tsrumhSkv6djnyLQa38mZA7bEstBFzoAYekgwp6U7INCay0FB4ZsISGaHAf9PV+c9XDARuWBoxcpZC5gmpAwshhiiTlTarodyCJPrk9izAbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBoUc3LC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBoUc3LC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9D8C116C6;
	Wed,  1 Apr 2026 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043358;
	bh=sff6V0+SikbFfnnkuOiFBlCiqZ50wVPswHcHFFLJGmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBoUc3LC2c+qN4fkZK6Cqw0ymOV5YmE554r9dGUUTJ7ePeCc4aTLdJZgHeyuATAod
	 OW7ZnFmtIf9go8WObN5EjT3d4VNpuWHpc+OoOUneqtbWJ495e1gwd2YwVJkKQH6osk
	 x0Q+9qVhVpqAAw/qGFTGKViqT9KKUK3AG8GNHtkjFmypfV4+YqaB5pFX724M4qxXBB
	 Tmbd/qV7OSfvVc2f/Ycm9o3HEdVCCR2nfka8SxXKibb+81Fxt4aQTBWqt1moenQ7Xp
	 e2ZDPR1I1gzD4nBNXkUd6NBG40yYSCwS1w60HKBZI1QsFyHoLCqdbSvMh4a5dQWF7I
	 B3N/vFNsrmt6w==
Date: Wed, 1 Apr 2026 13:35:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] aspeed: first batch of devicetree changes for v7.1
Message-ID: <20260401-duck-of-striking-engineering-3bcfab@quoll>
References: <df8ef5ea7b9e254658934c18de20fd9805a82d74.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <df8ef5ea7b9e254658934c18de20fd9805a82d74.camel@codeconstruct.com.au>

On Thu, Mar 26, 2026 at 01:39:52PM +1030, Andrew Jeffery wrote:
> Hello SoC maintainers,
> 
> Here's the first batch of ASPEED devicetree changes for v7.1.
> 
> Please pull.
> 
> Cheers,
> 
> Andrew
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.1-devicetree-0
> 
> for you to fetch changes up to 76b4ec8efdc3887cdbf730da2e55881fc1a18770:
> 
>   ARM: dts: aspeed: anacapa: Add retimer EEPROMs (2026-02-23 12:02:22 +1030)

Thanks, applied

Best regards,
Krzysztof

