Return-Path: <SRS0=VULX=K7=linaro.org=dan.carpenter@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56564CD11DB
	for <soc@archiver.kernel.org>; Mon, 25 Mar 2024 11:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 156C4C43399; Mon, 25 Mar 2024 11:05:37 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8122BC433B1
	for <soc@kernel.org>; Mon, 25 Mar 2024 11:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8122BC433B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a45f257b81fso486152966b.0
        for <soc@kernel.org>; Mon, 25 Mar 2024 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711364734; x=1711969534; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRILSzvwAIpvZwjiJmtXP3wS29AHppU0XGaszbPtEV8=;
        b=Nx7dezcW1SZJwZ7LKelO48K94nZJFNaq9zvZSHsxrkSFzSEhQhZ5T4gjOGROqO2urS
         JQ3YDlpEuhkqKPs5NDzZl7R/8myxdRxH5DLZAlfOqpK6Yk3euxPjGwV97O93pEeF8zrK
         glNsg9lkreIUzEIXcSrdyrdXbNZXp4A7Bh/rI400To81nToLZnwJD/uSkcKdGknN90Ru
         +jmvF3kSMo/GnXF44etO9HuanDYHq/IKdPdavp7D89RCizsyn8NXJGc8vPrFCJ4app3A
         TFFiAyS6CGIpQ5XqDfnLNBj+EWk78vMafgR+O2kQt3NnLCtdqJyd7uvbYccO+xNk4WLy
         Rhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364734; x=1711969534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRILSzvwAIpvZwjiJmtXP3wS29AHppU0XGaszbPtEV8=;
        b=RAhK1uos27ZKuLCYjtV6rAluRM1Crw0i3VeE+WSZaH4Uzb2xydqUcKeIMxgOUwUit7
         QMjFbB/vdvOounQ29WmjhXJJmuoCwmWsEfASIvjReJ9CwB87Mba6K4ZHhxjVFG5WnH/L
         h4Ezzw28TdHptbXQ9zXSRMQxqCTTW2WgDkUyQzlO0Gf1xd074JAjtXg1J35wLOCfdMI2
         6vM+2nZoL+IiSlPqbt0vKdCmQ0Orwvb00mQ3WkvTzSWiQlBJlx3NbiEmJ5MIl6sZ9OME
         Ukuv4bBgS+/UlGYFeks5jw90qsndP45OGvCxpyn3KqAKptWgwCvjy1z4YNd8MuiLpqYM
         PU5g==
X-Forwarded-Encrypted: i=1; AJvYcCVAqpfT96eDFvl72ZrwPYhyhl+TU5tGdP8xey6tmCpgKG7X56kY9HkMqgsXShm7no4CwmLaz9wlRY6rg4Qjqw==
X-Gm-Message-State: AOJu0Ywf9mfWoQmCkYCzk3gCE7GKKco7CvGt6LC6wwuHIt0o4c8dYBa1
	EUmbDaPwOQcYVAc/PmkGZy81wCSNjzR+6jzd+Zy+BsqhJkVWpW3S//VAYsCJWUE=
X-Google-Smtp-Source: AGHT+IEhtdf7x6x6qjqq4K75Nxdbj/nJMl44w91CE9A41I8PB9hLaFhw4s15oV2TjS9l0ZLDyPjoIA==
X-Received: by 2002:a17:906:40ca:b0:a47:206b:5951 with SMTP id a10-20020a17090640ca00b00a47206b5951mr4770720ejk.59.1711364733579;
        Mon, 25 Mar 2024 04:05:33 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id m3-20020a1709061ec300b00a449026672esm2901792ejj.81.2024.03.25.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:05:33 -0700 (PDT)
Date: Mon, 25 Mar 2024 14:05:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-Id: <soc.lore.kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Jonathan.Cameron@huawei.com, Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com, andrzej.hajda@intel.com, arm@kernel.org,
	arnd@arndb.de, bamv2005@gmail.com, brgl@bgdev.pl, daniel@ffwll.ch,
	davem@davemloft.net, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	gaurav.jain@nxp.com, gregory.clement@bootlin.com,
	hdegoede@redhat.com, herbert@gondor.apana.org.au,
	horia.geanta@nxp.com, james.clark@arm.com, james@equiv.tech,
	jdelvare@suse.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
	linus.walleij@linaro.org, linux-crypto@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	maarten.lankhorst@linux.intel.com, mazziesaccount@gmail.com,
	mripard@kernel.org, naresh.solanki@9elements.com,
	neil.armstrong@linaro.org, pankaj.gupta@nxp.com,
	patrick.rudolph@9elements.com, rfoss@kernel.org, soc@kernel.org,
	tzimmermann@suse.de
Subject: Re: [PATCH v5 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Message-ID: <486947a7-98fc-4884-a5fd-354677fa66ce@moroto.mountain>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-9-kabel__6885.49310886941$1711212291$gmane$org@kernel.org>
 <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>

On Sat, Mar 23, 2024 at 10:10:40PM +0100, Christophe JAILLET wrote:
> >   static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
> >   {
> > -	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> > +	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> > +	if (IS_ERR(pvt->dbgfs_dir))
> > +		return PTR_ERR(pvt->dbgfs_dir);
> 
> Not sure if the test and error handling should be added here.

Yep.  debugfs_create_dir() is not supposed to be checked here.  It
breaks the driver if CONFIG_DEBUGFS is disabled.  I have written a blog
about this:

https://staticthinking.wordpress.com/2023/07/24/debugfs-functions-are-not-supposed-to-be-checked/

regards,
dan carpenter

