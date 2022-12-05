Return-Path: <SRS0=D3XN=4D=linux.intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD9CC4321E
	for <soc@archiver.kernel.org>; Mon,  5 Dec 2022 12:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E7FFC433D6; Mon,  5 Dec 2022 12:22:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FEFDC433C1
	for <soc@kernel.org>; Mon,  5 Dec 2022 12:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FEFDC433C1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670242966; x=1701778966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lcxVp1A+yBTRM/AOTd0nAsYWpVQXLhD464zMr8HvkrY=;
  b=QoU+8D9nIan41iIgyDAtUChfK1nTYuMGe668P7buJSY2sEQVzcCoaHRm
   DalJfJRANVvnhz3zDv9rbB5yBiMephZSHGuajT0NjlNNQFRNDuHuNcOdX
   I+e3535tdqIJsQhO6PMDPB0KnpjQsYpL9ZB65jw6uNibuWX6OYD32dEjz
   KkCyH4Yf9q8jJgpnrCNx9Ojk79HCKCBjz91f+ggP8BmOKlvafUQjW7P1m
   ITbEEqwhNWudbF2nMFcMDWUX4qZBnF7g6vyDqTnekTxb08rNx3b02VXyi
   lpqVuTWdrnHeQ2R/6Ce2iVydJv5+st02OevX9/a0LViO1g8092jucmJFj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343327240"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="343327240"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 04:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="639465380"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="639465380"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 05 Dec 2022 04:22:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p2AUZ-004rjI-3D;
	Mon, 05 Dec 2022 14:22:40 +0200
Date: Mon, 5 Dec 2022 14:22:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Li Yang <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RESEND PATCH] soc: fsl: qe: request pins non-exclusively
Message-ID: <Y43ij5rwNLOaztch@smile.fi.intel.com>
References: <Y4wnGgMLOr04RwvU@google.com>
 <81a7715b-559f-4c5c-bdb6-1aa00d409155@app.fastmail.com>
 <Y40zZ8fkE9d1zbbV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y40zZ8fkE9d1zbbV@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Dec 04, 2022 at 03:55:19PM -0800, Dmitry Torokhov wrote:
> On Sun, Dec 04, 2022 at 01:10:19PM +0100, Arnd Bergmann wrote:
> > On Sun, Dec 4, 2022, at 05:50, Dmitry Torokhov wrote:
> > >
> > > SoC team, the problematic patch has been in next for a while and it
> > > would be great to get the fix in to make sure the driver is not broken
> > > in 6.2. Thanks!
> > 
> > I have no problem taking thsi patch, but I get a merge conflict that
> > I'm not sure how to resolve:
> > 
> > 
> > @@@ -186,23 -182,27 +180,43 @@@ struct qe_pin *qe_pin_request(struct de
> >         if (WARN_ON(!gc)) {
> >                 err = -ENODEV;
> >                 goto err0;
> > ++<<<<<<< HEAD
> >  +      }
> >  +      qe_pin->gpiod = gpiod;
> >  +      qe_pin->controller = gpiochip_get_data(gc);
> >  +      /*
> >  +       * FIXME: this gets the local offset on the gpio_chip so that the driver
> >  +       * can manipulate pin control settings through its custom API. The real
> >  +       * solution is to create a real pin control driver for this.
> >  +       */
> >  +      qe_pin->num = gpio_chip_hwgpio(gpiod);
> >  +
> >  +      if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
> >  +              pr_debug("%s: tried to get a non-qe pin\n", __func__);
> >  +              gpiod_put(gpiod);
> > ++=======
> > +       } else if (!fwnode_device_is_compatible(gc->fwnode,
> > +                                               "fsl,mpc8323-qe-pario-bank")) {
> > +               dev_dbg(dev, "%s: tried to get a non-qe pin\n", __func__);
> > ++>>>>>>> soc: fsl: qe: request pins non-exclusively
> >                 err = -EINVAL;
> > -               goto err0;
> > +       } else {
> > +               qe_pin->controller = gpiochip_get_data(gc);
> > +               /*
> > +                * FIXME: this gets the local offset on the gpio_chip so that
> > +                * the driver can manipulate pin control settings through its
> > +                * custom API. The real solution is to create a real pin control
> > +                * driver for this.
> > +                */
> > +               qe_pin->num = desc_to_gpio(gpiod) - gc->base;
> >         }
> > 
> > Could you rebase the patch on top of the soc/driver branch in the
> > soc tree and send the updated version?
> 
> I see, it conflicts with:
> 
> 	c9eb6e546a23 soc: fsl: qe: Switch to use fwnode instead of of_node
> 
> that is in next but not in soc/driver tree/branch.

That's due to no reaction on the patch [1] from Freescale maintainers (*).
Either soc subsystem can pull this [2] or your patch can go via
pin control subsystem.

*) Note, there is not Arnd's name nor soc mailing list in the MAINTAINERS
   regarding those files, so I had had no idea about the correct route of
   the change.

[1]: https://lore.kernel.org/lkml/20221005152947.71696-1-andriy.shevchenko@linux.intel.com/
[2]: https://lore.kernel.org/linux-gpio/Y3YY%2Fm0F%2FRh0jUc7@black.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko


