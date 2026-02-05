Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED3110F2;
	Thu,  5 Feb 2026 05:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770268991; cv=none; b=offSWHDquD0HQuwa5VsjbW+ubCwPUTk6X0w2KUqePaxCAFZzAv8+K0U6t4rsd9DueGJkL5r2vFWdK7MOgvK5L8IqfNhRfYhFMaWs4505H7997z7CR9rDV5hiGH9A48yOguhEpRBpRXaeX1A04ZAS0lp+BEPUjzl8MXIhm0UshHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770268991; c=relaxed/simple;
	bh=ptywbAJew2XYurULYzSEzlK6ebrZCkri2+g8YABW9MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNq1jrSaUySU11bHweGKyUutjXKpcZunFUcG3nPR9cjGlwafWQD9NU4Yx4ysjn1Q0KkNgSD0cuImnMfUhGsiIJ/1I5KNoUc8OwZIMw1G5jaUBWosKaRiM/Z2bHmLkrVAFtDIe0ip+lqpshDvwE2Z4Jz8UtA4xLioasabrUZsd8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7BIDWLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7BIDWLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89459C4CEF7;
	Thu,  5 Feb 2026 05:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770268991;
	bh=ptywbAJew2XYurULYzSEzlK6ebrZCkri2+g8YABW9MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7BIDWLjdeeldEH1VS9Wd9aYiDzNb+QzgvJH56Yz4QlBkNR+WTnHIOO+ZNiX1Ia+U
	 /Uv2AYuvcbxhZJS7YbK5FoUN9eEi6d5Mfi5V5sg9UDuNBD9uOTmk7wpvGuUuLnfV7C
	 3HnxEPSv583aIe7nAy9JpQmnLIMnVXGD1kAq/uMAqeTwTLHMUpJbYkhtS4Fr7g4GTE
	 skyRXTk2leYf8COD7LEGWUeUUYgn1L7/gQvRZjoJdplgZi4U7y7gy5vIKg45/hH0KM
	 gnCW2J7hYWyQaG/Rvmbyh3uJkBMrSjoN4rRuy9S0fyiWK3lkCoN/b9nEYsWJBlLeH4
	 2B9ID4mCOayig==
Date: Thu, 5 Feb 2026 13:23:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: Re: [GIT PULL] soc: fixes for 6.19, part 3
Message-ID: <aYQpOu_htw-c2tnt@QCOM-aGQu4IUr3Y>
References: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>

On Wed, Feb 04, 2026 at 01:17:21PM +0100, Arnd Bergmann wrote:
> The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:
> 
>   Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-3
> 
> for you to fetch changes up to c3cb2722e28969650c58d6defb09d57339a2a223:
> 
>   Merge tag 'qcom-drivers-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes (2026-01-29 10:02:11 +0100)
> 
> ----------------------------------------------------------------
> soc: fixes for 6.19, part 3
> 
> Shawn Guo is moving on from maintaining the NXP i.MX platform and hands
> over to Frank Li. Shawn has maintained the platform for 15 years after
> initially upstreaming support for i.MX6 and i.MX23/28, and his work has
> helped make this the most important industrial embedded Linux platform.
> Roughly one out of five devicetree files in mainline kernels are for
> the wider i.MX platform.  Many thanks to Shawn for the taking care of
> the platform all these years!

Arnd,

Thank you for these warm words!  I really appreciate your great effort
on arm-soc maintainership in the past decades.  It made platform
maintainers' life a lot easier! 

Thanks,
Shawn
