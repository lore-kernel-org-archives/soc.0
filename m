Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D6E23BD1B
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775897692; cv=none; b=uIM6IpjCmxb7Acxt7N8RXngHNS9d+9uvuKXRCWcaVSeHE2GPmAKLw6z5Pz/SUcD4s5YjiMfW2mEgsLXx1MFW3+2Jksp+oZRv1u/kCt6Yn2ThZk2ZtoegKI3cikvvqIEsY3yMzLJieoNq1GyrggAcVhDI27n/abejAckRK2f/ec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775897692; c=relaxed/simple;
	bh=IO2YPV6AEKfJ4Hz9ub8GiQZXFSmfuRwPQfE4POfgvJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyHNtuoM7sktr+szon39kI12RCjqVCNA+Y2AqiPiA+u5tWmFrD8/vlOfzpHxb1N0iS3MUicqZxXi0fAudKSH/yyXbbA50Xr/en02oAlIJm1aVjZ0ZigTtngZhpQhkYZY3Saxf22q49x3ZeTQsWXxWIQnIxSnwf3i1DW7IUl2kF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaKrykhF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaKrykhF"
Received: by smtp.kernel.org (Postfix)
	id 53D5DC4AF09; Sat, 11 Apr 2026 08:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5231C4CEF7;
	Sat, 11 Apr 2026 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897692;
	bh=IO2YPV6AEKfJ4Hz9ub8GiQZXFSmfuRwPQfE4POfgvJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaKrykhFSF4ef54dIyhFrWVCBtT0ow/mmsohmXHRlf6bskYDFbpWDJQkglZulXJa7
	 PHpLn6tEBmYNTJztBLrshOkofYiGF01M9MtZylmqZi/7G+kkmGWTC3jWT9VLCG8LcO
	 pljHF4O7vblfysd+LJvABVBjJTPvWZQFER3MgodrWPISmvnhp63+Heh56ZC9/Hg777
	 tY1mwHWvbpevo8wQGy1etQGrETUPmx1xZlawIv59dflU6F5/NgSqPJkPkptFDm3zIp
	 d0VM7vnmes3BphrQQAyRzeeXwVa9lQb/bG4WVCj1ht9cX5T4yFi/kc0Wk7bM5+Y/By
	 I+7Pay5TllChg==
Date: Sat, 11 Apr 2026 10:54:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Message-ID: <20260411-inescapable-overjoyed-dinosaur-14130d@quoll>
References: <87tstk35d2.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tstk35d2.fsf@BLaptop.bootlin.com>

On Thu, Apr 09, 2026 at 10:28:09AM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v7.0.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-7.0-1
> 
> for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:
> 
>   dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0100)
> 
> ----------------------------------------------------------------
> mvebu fixes for 7.0 (part 1)
> 
> A new device tree has been merged without a binding, which triggered
> warnings during dtb_checks. The commit in this pull request fixes this
> issue, enabling easier detection of new problems in device trees by
> reducing the number of false warnings.
> 

Thanks, applied

Best regards,
Krzysztof

