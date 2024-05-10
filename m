Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4206C25B74
	for <soc@archiver.kernel.org>; Fri, 10 May 2024 10:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4BF2C2BD11; Fri, 10 May 2024 10:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A73C113CC;
	Fri, 10 May 2024 10:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715338386;
	bh=F1zc5yZJOXB7Tu6k40pMSpQ4O1l6Top2RS5ppzJazas=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=txLTVpp2Fx37xGuPPYNZ/lrIaNXIWlB0UgMN9Y8OFUKoOh1mHcYqkOhB5EOOiSL6I
	 RwiLTuWMi+Ua3OnEgJD0/bBr/aMFwGYWIZuVT49QzpmzVCrCz+/081yKk9JWjoG9Cn
	 GjLMKx1zkEuyBkDdV7W0Nx7uxwVSd+UIpeEaVfp8=
Date: Fri, 10 May 2024 11:52:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-crypto@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v10 7/9] platform: cznic: turris-omnia-mcu: Add support
 for digital message signing via debugfs
Message-ID: <2024051007-rendering-borrowing-ffc5@gregkh>
References: <20240510101819.13551-1-kabel@kernel.org>
 <20240510101819.13551-8-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510101819.13551-8-kabel@kernel.org>

On Fri, May 10, 2024 at 12:18:17PM +0200, Marek Behún wrote:
> Add support for digital message signing with private key stored in the
> MCU. Boards with MKL MCUs have a NIST256p ECDSA private key created
> when manufactured. The private key is not readable from the MCU, but
> MCU allows for signing messages with it and retrieving the public key.
> 
> As described in a similar commit 50524d787de3 ("firmware:
> turris-mox-rwtm: support ECDSA signatures via debugfs"):
>   The optimal solution would be to register an akcipher provider via
>   kernel's crypto API, but crypto API does not yet support accessing
>   akcipher API from userspace (and probably won't for some time, see
>   https://www.spinics.net/lists/linux-crypto/msg38388.html).
> 
> Therefore we add support for accessing this signature generation
> mechanism via debugfs for now, so that userspace can access it.

Having a "real" user/kernel api in debugfs feels wrong here, why would
you not do this properly?  On most, if not all, systems, debugfs is
locked down so you do not have access to it, as it is only there for
debugging.  So how is a user supposed to use this feature if they can't
get access to it?

And debugfs files can be changed at any time, so how can you ensure that
your new api will always be there?

In other words, please solve this properly, do not just add a hack into
debugfs that no one can use as that is not a good idea.

thanks,

greg k-h
