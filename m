Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C63FC25B48
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 16:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3451C433C8; Thu, 26 Oct 2023 16:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB8DC433C7;
	Thu, 26 Oct 2023 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698336853;
	bh=KizJtl13hOtSppTamlYfo/ms0fCi/1LJMGw5ZCwLWQA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Uvuae6ymP3KuVU9Eqd8HZNwi0pTwuPu/pZYYJuxy0iMsMhA2tWJO6GmEB2hwjW5uX
	 HJYzLn1lSyOL3Sy8H+bfZca/10sALx4/8VM9ib5YkRACP4gjjtaper11b9cIMYpXHX
	 sThB+/OaP6MK3ZRDKScynESR8veiY70s76pn5iWisnzMbQ1Kq2Lc7yDj2azAiYZEtj
	 Kq2SRCc4M4BSGajFMmTwyf9hD7jFQ1NPUDhoN5IjPi0I9SDMmHrGvE6tIiGrWs03v/
	 PA/HfRWISqXNd1nWd0NCGiGz8eTZopBoMMEESA+FLSkPxaogid7oMdhZNI8REv4IIg
	 tj08QlElIF0QA==
Date: Thu, 26 Oct 2023 18:14:06 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20231026161406.2tjlc7b4ood2gbry@kandell>
References: <20231023143130.11602-1-kabel@kernel.org>
 <20231023143130.11602-4-kabel@kernel.org>
 <ZTbRtwTsmAjp3QG0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZTbRtwTsmAjp3QG0@smile.fi.intel.com>

On Mon, Oct 23, 2023 at 11:04:07PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 23, 2023 at 04:31:26PM +0200, Marek Behún wrote:

...

> > +static void omnia_irq_bus_lock(struct irq_data *d)
> > +{
> > +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +	struct omnia_mcu *mcu = gpiochip_get_data(gc);
> > +
> > +	/* nothing to do if MCU firmware does not support new interrupt API */
> > +	if (!(mcu->features & FEAT_NEW_INT_API))
> > +		return;
> > +
> > +	mutex_lock(&mcu->lock);
> 
> I'm wondering if sparse complains on unbalanced locking. If so,
> the function needs an annotation.

Hi Andy, thanks for your review.

OK so I looked into this and it seems that mutex API does not do
__acquire / __release yet...

I've incorporated your other suggestions and am sending v4.

Marek
