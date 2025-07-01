Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4B1E5B7C
	for <soc@lists.linux.dev>; Tue,  1 Jul 2025 05:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751346679; cv=none; b=SbNlnnrhyEmRXP4YSeQLSj3LdnHP54OxTlL6qRWwP9Qv2QNaooXy1HT1xRLq3Wsl5Q925ma2QlqGbjODqbEjBZrMMN5n9PU1pAOuqY/x7GxP9tib25WoIQ6rZc/gvMnHVxY8O1pdEZ9ptP/0LJoyjdm5MlP/ryt76a4TEZihMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751346679; c=relaxed/simple;
	bh=PAjyZAGdS4a1sYZYyUKK7gQ15IbfNqvQaXwK4FCEUZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHNSbKMAiBS66pzHYaTfYiLxCkmLhdJ3LUHNrHdOlrowWUa5oVsuB3s4ed2xuJqoweENLD+OqK9vVyUC6ITb3qxeZp7gawpJAXstAX/dGWeasTdrCz5oglx9aTS/3pZLQ/jb57j0lRuFvUIGAqz3rPplfU2hIaD3eszxV+rkw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w6BFMVuR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w6BFMVuR"
Received: by smtp.kernel.org (Postfix)
	id 333E9C4CEED; Tue,  1 Jul 2025 05:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97886C4CEEE;
	Tue,  1 Jul 2025 05:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751346679;
	bh=PAjyZAGdS4a1sYZYyUKK7gQ15IbfNqvQaXwK4FCEUZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w6BFMVuRGt1ZnXye74MHBq4GS0QlHzV5hnT+81JRyt2DdsEryIaHyqy2yp6jQHbJe
	 7dhJmRW6q+W9YIThf8bd+bqDQMOOlsEmPmj2f+rkcJXOJGxH+E+3jZeB8tQiJr9tl3
	 6LF0kpLdEpfgze+2R8HMozw+PjtTHnWjhwuKUUsU=
Date: Tue, 1 Jul 2025 07:11:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Bjorn Helgaas # quirks . c" <bhelgaas@google.com>,
	pci_ids.h@broadcom.com, Stefan Wahren <wahrenst@gmx.net>,
	Randy Dunlap # build-tested <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 4/5] Broadcom drivers changes for 6.17
Message-ID: <2025070139-garnish-leotard-9824@gregkh>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <20250630190216.1518354-4-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630190216.1518354-4-florian.fainelli@broadcom.com>

On Mon, Jun 30, 2025 at 12:02:15PM -0700, Florian Fainelli wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers
> 
> for you to fetch changes up to e3ce7b897388339b407d57969acaa26063e38209:
> 
>   pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom SoCs drivers updates for 6.17,
> please pull the following:
> 
> - Andrea adds the RP1 clock, pinctrl/pinconf/gpio and misc driver to
>   bind them all
> 
> ----------------------------------------------------------------
> Andrea della Porta (5):
>       dt-bindings: clock: Add RaspberryPi RP1 clock bindings
>       clk: rp1: Add support for clocks provided by RP1
>       pinctrl: rp1: Implement RaspberryPi RP1 gpio support
>       misc: rp1: RaspberryPi RP1 misc driver
>       pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support
> 
>  .../bindings/clock/raspberrypi,rp1-clocks.yaml     |   58 +
>  drivers/clk/Kconfig                                |    9 +
>  drivers/clk/Makefile                               |    1 +
>  drivers/clk/clk-rp1.c                              | 1494 ++++++++++++++++
>  drivers/misc/Kconfig                               |    1 +
>  drivers/misc/Makefile                              |    1 +
>  drivers/misc/rp1/Kconfig                           |   20 +
>  drivers/misc/rp1/Makefile                          |    3 +
>  drivers/misc/rp1/rp1-pci.dtso                      |   25 +
>  drivers/misc/rp1/rp1_pci.c                         |  333 ++++

Any chance to actually review this code before you throw it under a
different maintainer's responsibility?

And what's wrong with patches, why a pull request here?

thanks,

greg k-h
