Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828539BFFC
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042811; cv=none; b=jzbZ6SSw+I+L1lh2oKRTyA3n9VKNf0zuYBcdSKMQd/3urQvXRj6PUHIdY8QINWi4vRhdm9OOwQfPok9iKOA3rXBAH3/q23vZjkz9WpfHA7TvR58PRbTxtpQ08dC+UoYn8HBDk93hbfqt1Yn8V0cHwMsetewW6noUvmNKl6rdcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042811; c=relaxed/simple;
	bh=m8yKhzC3LaxWjfpfpdy07UdKE1XsSYKtP6Sim+B+8Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6MUtfM88hk6/ayZcgjkfrabMMpKWPTTfU81g7R9bKZ44wW30XSv2cn+6n+ngHjMqC7u55l1B1cZejqzMYi2iK7TtN5ifcv2IBUtpsyn/L/DgcsJcIwgIjHUy9bC+WLE8Nlj0t8rTVecsLeB9+xcKwecxppTd4+67WuWg0UydL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwaJapGr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwaJapGr"
Received: by smtp.kernel.org (Postfix)
	id CB4BAC2BCB0; Wed,  1 Apr 2026 11:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4BEC4CEF7;
	Wed,  1 Apr 2026 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042810;
	bh=m8yKhzC3LaxWjfpfpdy07UdKE1XsSYKtP6Sim+B+8Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwaJapGr4tnl7p14mIb0FOFPVc6cJdGfKQU7XuiYmejgQcBwRMLwJNzfCTxrDlk8w
	 +ZJMiYl4CPbLG7+igfwiVF8dAU6V9VvH4lbBl6p5zMCM7kb+NXoPN0oUOqBF3/lL3q
	 Env03O7LT5/2jZg+8q3J1HdUqaTugS6ZSZ+Y/ddNteJ4/Rr3hZgPePzhgPZSnYoojS
	 EwDlnEvT3KbVDNt3S0nD+nutI/qcL5pSEzS+ja8UdyokLmHI49A4KYVYTk1qDKhBMs
	 ++699uVrcLPcOA/r7lCWCsXU1pBGtuFQ3znOiT2YmhISYxaxmCGYCvPiCqhYl64J/K
	 NDRvRy7C+Ab/A==
Date: Wed, 1 Apr 2026 13:26:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller fixes for v7.0, part 2
Message-ID: <20260401-ubiquitous-brawny-camel-bfb1e4@quoll>
References: <20260324094255.3538772-1-p.zabel@pengutronix.de>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324094255.3538772-1-p.zabel@pengutronix.de>

On Tue, Mar 24, 2026 at 10:42:55AM +0100, Philipp Zabel wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit e0cf84109bc6c6768337123f1de24ff56b41c91b:
> 
>   reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-02-23 17:03:28 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-2
> 
> for you to fetch changes up to a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:
> 
>   reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:47 +0100)
> 
> ----------------------------------------------------------------
> Reset controller fixes for v7.0, part 2
> 
> * Decouple spacemit K3 reset lines that were incorrectly coupled
>   together as one, but are in fact separate resets in hardware.
> * Fix a double free in the reset_add_gpio_aux_device() error path.
>   This has already been fixed on reset/next by commit a9b95ce36de4
>   ("reset: gpio: add a devlink between reset-gpio and its consumer").
> * Fix the MODULE_AUTHOR string in the rzg2l-usbphy-ctrl driver.

Thanks, applied

Best regards,
Krzysztof

