Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E010E6FC3
	for <soc@lists.linux.dev>; Sat, 14 Mar 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773487161; cv=none; b=UnvyaA2gOwSx+yN2e6iOxN0Yr7dguaF9mR18/maXu85MPOWm86bVvT5pg8KTZckneGyS3Qn2nbcviW3DdX2QI2xUFspnN5NSTBaiSXdJ4rR/02ooiUawnQB2B6KeSWI3T8Ik5caheos6MyJc/gjAuJmGD3FH+arKF0i5stMAAu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773487161; c=relaxed/simple;
	bh=dikWE6HNN6Di+3MQ32RIVivnTwpdoq5R2GHeIxhEZYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9cM+hibQHqfp7FDGEv0KbU6EU+P1gS41LraTMcxRY56NKN82OOyqWprLg2K18I2r9+A/MwrhZQdCZuuGou82WvjqjV7EopOMisWCZv7nq2mvh80JpRAdJuVvmiuBeoRCilIjY1Nidxlb3rphT/FURTXjz8btQoVV0fh5KTp7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZs3lXwJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZs3lXwJ"
Received: by smtp.kernel.org (Postfix)
	id A3356C2BC87; Sat, 14 Mar 2026 11:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF4DC116C6;
	Sat, 14 Mar 2026 11:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773487161;
	bh=dikWE6HNN6Di+3MQ32RIVivnTwpdoq5R2GHeIxhEZYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZs3lXwJKIV4tm+5E94URl5p7F2TmnEZg57gELtDtVsPsnFfe1GBnhoF1j8gX6g1i
	 EIAIhTcatfalTEyYEQk5d4v30Vejup5QkTmQwnSF4+0rr/wZBSG+r7LaWvNzpUZG3f
	 ApwvBvuUgxTNZqNE6uDFANqF57+J/b3myoTfvN79prKBWOff8FAVdH+ER3ZfoXn9Kr
	 xhnjxYzocBCZvLPOmkuH1uv5FNghxUPi6HBKkZ+hJcK/fO4/s5GDzAcVqayNTvgBpt
	 H8d1/L7GwFgx2Bdjg8e2VmvVTo5/Vxt3Re/+yFY25AT1P4oOMRg+howux7B5fMV5SD
	 sJ7yAl/zlXhWg==
Date: Sat, 14 Mar 2026 12:19:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Message-ID: <20260314-laughing-vigilant-cricket-6a918e@quoll>
References: <87sea3680w.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sea3680w.fsf@BLaptop.bootlin.com>

On Fri, Mar 13, 2026 at 04:53:03PM +0100, Gregory CLEMENT wrote:
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
> - Add bindings to validate the device tree that has already been merged.

This has 0 days in next:

Days in linux-next:
----------------------------------------
 0 | + (1)

Commits with 0 days in linux-next (1 of 1: 100.0%):

So it will wait. Please send pull requests with code which was in the
next for minimum one next release for fixes and few (5-10) for
development.

Best regards,
Krzysztof

