Return-Path: <SRS0=rBqz=LB=linaro.org=dan.carpenter@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F75C54E67
	for <soc@archiver.kernel.org>; Wed, 27 Mar 2024 11:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A4ECC43390; Wed, 27 Mar 2024 11:39:28 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B5C5C43394
	for <soc@kernel.org>; Wed, 27 Mar 2024 11:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B5C5C43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a4702457ccbso841190966b.3
        for <soc@kernel.org>; Wed, 27 Mar 2024 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711539565; x=1712144365; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m93ME46lQ7B8wqoBDoWv3GJg3rLMXw/sn+I50eOHnUw=;
        b=xFI7as5N71DV4cCWQ/uS+CW+lkLZHtcguaCYdKtj6AMj5Is+JAjL3DPiqSwFboCe6S
         IkGpU0KF9mkjKmmKZ5KXFTUeklgaVHDGMldPERDFqF4Gxm9A6krvGcqqaTEkseB7i3Xg
         ATJeAtXi2mzVsHilPok1zQYt6rMj79IOhD34L4hHzCl9qXp0hGfTkUPlapoWaf94fC7C
         wB/pCJATHZBxH2jfUpOPJKIDLH5KQN/QEDhW20Eu+oC23Lo11z89fyDUggImURyAk2ue
         WALmAo6f3o0csDXUK+KzRURwwYcXCmAlPoviiUBUE9q5403H/19Vi+yPjlqviQ+BU1qn
         2vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539565; x=1712144365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m93ME46lQ7B8wqoBDoWv3GJg3rLMXw/sn+I50eOHnUw=;
        b=vai+7aThcgSIEF5CAXznwCHgpaWARvOqajPwiDjRyvBhFVc2dJVTwDKL8zRb2QIAFe
         lpOKFI1TuLVOkYdJMtRy7fEyzeLfNXQ/kiA6cc3INqzgXCnb4UG99Aho09k0KYRmIB9V
         DzGnFR2qowAUQ2uH9on3/au1ij10QSD1TMj+4rk/dbvqQCBatxF3N/+TR5t6VjULVLsq
         Bj3EdjS6OnjNZ7bH7gALc/TYTOiVlpzpyGiJ6s/U+wtlsD8ffSdVX9EQ4vFLbFBSx8Xv
         FdlVvL/hia6saLiph58926oBMYv0gZXDNMtVDMKEUwPFmuAWkEPkwp9mKd4SSQTJjgV7
         KU0A==
X-Forwarded-Encrypted: i=1; AJvYcCVHgZKvmFd1xeBXSQD5T451UEnTJx0/8VgBoEmzLO/GEat7bIQnCXOsOIpzQmVwZ70hCdrY0iqSJWpKKDaHoQ==
X-Gm-Message-State: AOJu0YxbqZ149ILErT66I8NDueCEM2ieDpSzvnXl0nEbHyF0KDj9iNv7
	kHmjGWJYe4l2/aIU6PbXDk99a+EUuvTelEMdaB9setnCOhqor50UWEg1CM4bN3w=
X-Google-Smtp-Source: AGHT+IEh2db7nxCaUxEgb8RbXF0TQ7G70ljNTsa7xYgI7dJAup4kRdGFRMsvRHBlJJgmz+2s0cMLaQ==
X-Received: by 2002:a17:906:b1b:b0:a47:499b:d735 with SMTP id u27-20020a1709060b1b00b00a47499bd735mr745672ejg.14.1711539565301;
        Wed, 27 Mar 2024 04:39:25 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id la5-20020a170907780500b00a45621ded4bsm5395486ejc.146.2024.03.27.04.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:39:25 -0700 (PDT)
Date: Wed, 27 Mar 2024 14:39:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v5 06/11] devm-helpers: Add resource managed version of
 irq_create_mapping()
Message-ID: <b70ec580-dfac-48bc-87d6-b30f2e91f723@moroto.mountain>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-7-kabel@kernel.org>
 <72bf31c3-337d-4747-8353-639492507a7b@moroto.mountain>
 <20240327103419.3918953a@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240327103419.3918953a@dellmb>

On Wed, Mar 27, 2024 at 10:34:19AM +0100, Marek Behún wrote:
> On Tue, 26 Mar 2024 12:00:25 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > On Sat, Mar 23, 2024 at 05:43:54PM +0100, Marek Behún wrote:
> > > +/**
> > > + * devm_irq_create_mapping - Resource managed version of irq_create_mapping()
> > > + * @dev:	Device which lifetime the mapping is bound to
> > > + * @domain:	domain owning this hardware interrupt or NULL for default domain
> > > + * @hwirq:	hardware irq number in that domain space
> > > + *
> > > + * Create an irq mapping to linux irq space which is automatically disposed when
> > > + * the driver is detached.
> > > + * devm_irq_create_mapping() can be used to omit the explicit
> > > + * irq_dispose_mapping() call when driver is detached.
> > > + *
> > > + * Returns a linux irq number on success, 0 if mapping could not be created, or  
> >                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > > + * a negative error number if devm action could not be added.
> > > + */
> > > +static inline int devm_irq_create_mapping(struct device *dev,
> > > +					  struct irq_domain *domain,
> > > +					  irq_hw_number_t hwirq)
> > > +{
> > > +	unsigned int virq = irq_create_mapping(domain, hwirq);
> > > +
> > > +	if (!virq)
> > > +		return 0;  
> > 
> > What is the point of returning zero instead of an error code?  Neither
> > of the callers that are introduced later in the patchset use this.
> > 
> > I understand that it matches some of the other legacy irq function
> > behaviors, but I think we are trying to move away from that because it
> > just leads to bugs.
> > 
> > Since we don't need the zero now, let's wait until we have a user before
> > introducing this behavior.  Then we can add a new function that returns
> > zero, but we'll still encourage people to use the standard error code
> > function where possible.  And at the same time, when we do introduce the
> > zero is an error code, function you should contact
> > kernel-janitors@vger.kernel.org so someone an write a static checker
> > rule to detect the bugs that result from it.
> 
> Hi Dan,
> 
> the first user of this function is the very next patch of this series,
> and it does this:
> 
> +	irq = devm_irq_create_mapping(dev, mcu->gc.irq.domain, irq_idx);
> +	if (irq <= 0)
> +		return dev_err_probe(dev, irq ?: -ENXIO,
> +				     "Cannot map MESSAGE_SIGNED IRQ\n");
> 
> So it handles !irq as -ENXIO.

Yeah.  But imagine how much easier it would be if devm_irq_create_mapping()
returned -ENXIO directly.

	irq = devm_irq_create_mapping();
	if (irq < 0)
		return dev_err_probe(dev, irq,
				     "Cannot map MESSAGE_SIGNED IRQ\n");

> 
> I looked into several users who do
>   virq = irq_create_mapping()
> and then reutrn errno if !virq:
> 
>   git grep -A 3 'virq = irq_create_mapping'
> 
> Some return -ENOMEM, some -ENXIO, some -EINVAL.
> 
> What do you think?

-ENXIO is fine.

regards,
dan carpenter

