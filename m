Return-Path: <SRS0=MBVL=L4=linaro.org=dan.carpenter@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7A0C4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 16:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62568C2BD10; Tue, 23 Apr 2024 16:21:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D077C116B1
	for <soc@kernel.org>; Tue, 23 Apr 2024 16:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D077C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41ae3dbedf3so2116515e9.0
        for <soc@kernel.org>; Tue, 23 Apr 2024 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713889279; x=1714494079; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jk07xKC61VymhBC6QxQA9TRsF6zm6ITh/JpGGzhoaA0=;
        b=Mre8lNRr022lZ9SBN2wCwkaonz++rGLVXXZuN7HFJF8f1MJpD5kpwDel5cVsho3BAo
         oBnOD0Q8r01NpQfdDGBCB6/YDZEFbWl3wusKKV3CITPeTMPdYM1tWLIVcxofGzv2by/m
         /UhICeUeliQEs4/tjT36gj9wK0sqR8hGcWetK70OSoCeOGBCqueq8X7F0G3+xNK3sS00
         Nl2cZglP5WF9kw7LeEVycLCQyEi1O0ociDDF4tD6iQWRJkfQ6Z4qRITXhbOSLJuGLM59
         WIkTD8zOKIK9aFhhi/iUYF1Wt2Lx5RNtJgimtkMMoFgTad9AG8heA1ICtp2FPNOI6DAs
         t/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713889279; x=1714494079;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jk07xKC61VymhBC6QxQA9TRsF6zm6ITh/JpGGzhoaA0=;
        b=O+PGhGHvycEaVmBph7+cU2FWVz9CyWjVLALoUd/zHVR/nO5x/WL6mVNA2VSaNuDL4z
         BKtWy2Vm8eJ9aYZo6kWCr4eQFCTrMBRD77QOAU+Kgf2D9gojYlROHmJDs4LOBWhwV2uD
         DBvBGNceWCa4+kTz/XSJg8DFQpBNdt4708/SRGjSU9jxVS3HsJ6G3jkfH4LNIRRq6WiS
         FTVbNbJYDJI8PCTR6FMxnxLr7RPrqRXsK4QkHYHyGs2Lyv7/lskxgsIbDw45/UflybCQ
         E2QsTq4eJgUJsg6sGTCFlMtzbDvP/rp4IA6Igo9AtJ6dyU7uaJg/rAgswlv9brx8o2op
         RCvg==
X-Forwarded-Encrypted: i=1; AJvYcCX4fhPvQEjDoD0mGfZgmxy1VNXqruAM4nOi5ZWT6YTZ1AJdd++0Nq1yT7iz/XyhJuGFLIKKH00nGuDHGYGMTQ==
X-Gm-Message-State: AOJu0YyFpNvZ8gtYAc1o1Mx7oaqVBhf5Gwy6zAK8CC3F3w9w5KTKCshy
	a9xnFBc7L4uQu2A4Qd2NBNQjKGohc0S4mqUIjSEby1ivBKYQtoPZrewZpR4dVXY=
X-Google-Smtp-Source: AGHT+IHcR2WLM4H55RX2yoY/CYl60KsKyEx8BRjcx1WVBr25f7fEhpasL/28RrLbfdZ557jjL9vlww==
X-Received: by 2002:a05:600c:510b:b0:418:f616:f087 with SMTP id o11-20020a05600c510b00b00418f616f087mr8118449wms.29.1713889278588;
        Tue, 23 Apr 2024 09:21:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c358900b00419f7b73c55sm12331114wmq.0.2024.04.23.09.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 09:21:18 -0700 (PDT)
Date: Tue, 23 Apr 2024 19:21:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, arm@kernel.org
Subject: Re: [PATCH v6 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <89dce5a3-e5f7-4525-9cfc-aed4d7c1199c@moroto.mountain>
References: <20240418121116.22184-1-kabel@kernel.org>
 <20240418121116.22184-9-kabel@kernel.org>
 <ZifbjfBg0lBRkpoS@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZifbjfBg0lBRkpoS@smile.fi.intel.com>

On Tue, Apr 23, 2024 at 07:02:21PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 18, 2024 at 02:11:13PM +0200, Marek Behún wrote:
> > A few drivers register a devm action to remove a debugfs directory,
> > implementing a one-liner function that calls debufs_remove_recursive().
> > Help drivers avoid this repeated implementations by adding managed
> > version of debugfs directory create function.
> 
> ...
> 
> > +static inline struct dentry *
> > +devm_debugfs_create_dir(struct device *dev, const char *name,
> > +			struct dentry *parent)
> > +{
> > +	struct dentry *dentry;
> > +	int err;
> 
> > +	dentry = debugfs_create_dir(name, parent);
> > +	if (IS_ERR(dentry))
> > +		return dentry;
> 
> Why do we care?

We don't.

I am missing some patches, but I suspect this breaks when
CONFIG_DEBUGFS is disabled.  Errors from debugfs functions are supposed
to be ignored.

regards,
dan carpenter

