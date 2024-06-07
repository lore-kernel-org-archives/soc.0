Return-Path: <SRS0=bnAx=NJ=gondor.apana.org.au=herbert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A44C27C53
	for <soc@archiver.kernel.org>; Fri,  7 Jun 2024 10:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE815C4AF08; Fri,  7 Jun 2024 10:30:42 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2340FC2BBFC;
	Fri,  7 Jun 2024 10:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2340FC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sFWrV-006nL7-2n;
	Fri, 07 Jun 2024 18:30:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 07 Jun 2024 18:30:24 +0800
Date: Fri, 7 Jun 2024 18:30:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Olivia Mackall <olivia@selenic.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
Message-ID: <ZmLhQBdmg613KdET@gondor.apana.org.au>
References: <20240605161851.13911-1-kabel@kernel.org>
 <20240605161851.13911-7-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240605161851.13911-7-kabel@kernel.org>

On Wed, Jun 05, 2024 at 06:18:49PM +0200, Marek Behún wrote:
>
> +static int omnia_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
> +{
> +	struct omnia_mcu *mcu = (struct omnia_mcu *)rng->priv;

Please don't cast rng->priv in this manner.  Please take a look at
drivers/char/hw_random/bcm2835-rng.c for how it should be done.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
