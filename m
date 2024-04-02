Return-Path: <SRS0=KAAI=LH=linaro.org=dan.carpenter@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607A9CD1284
	for <soc@archiver.kernel.org>; Tue,  2 Apr 2024 09:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 333D2C433C7; Tue,  2 Apr 2024 09:59:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92197C433F1
	for <soc@kernel.org>; Tue,  2 Apr 2024 09:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92197C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4e9195be52so20595466b.2
        for <soc@kernel.org>; Tue, 02 Apr 2024 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712051988; x=1712656788; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIK3my8ABKRdtJyG7KGkkQYs6AXtO/OOQOFft5RPt10=;
        b=RfM4Fnw+nIzZm/JPdRBdRBFkz6cBgLfJ3dNsFmoqhhK5iGshTjli/2JukWDrKWA91w
         MtmqqgcqiJz5CcKhH4XH2pVVYiNdCO81ePyQ2Fo6+6MEr/LSb8dGx4HMGxdKnOwKNpm2
         MdcDmT4VIUwAIsR9A8c55zwNK6a8yCEnr/2QVIka03TPcKT97LY1M5Obk/kr7U2oNqbW
         JmJdC56b1TZV/j878uBcsH4DDgyqWW8S3fUs3NnXHFv6X+lVIwY+OQ3TDci9ajspdspk
         vLFDstFYUQSI6XwZ0+rxRf68PR8/1Aup3UG1MyTpElCylcceJvwRZ+U+Bpxwq5lzE2vF
         3esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051988; x=1712656788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIK3my8ABKRdtJyG7KGkkQYs6AXtO/OOQOFft5RPt10=;
        b=La2gy1g2v6KxVJ9dc2KZHL9xA6KPr1W8VqeBL04GrLZOnqb1pt0g7r2G61Az0wqQ2j
         dPCvy0nJs+BBtJuN5p941tsly/iLWNRcR/6rGRnpIYmFjebhjFcXYxndxqArOD9N+Zhw
         KC/NgN9ecW7xZtMTnJlMNIhxEIojrN1l+2n1807BXdC6agTCfA41PqjK0x5vSc2Y7CL0
         UK6Sn/8NUkzyba0UV/4uVEz+ANsftZJrPbb2ODS3QHywzaO9K/JYMWaBYhUV8RnOp/ge
         6ZfRZfnEoiHDHMRTwj1IvCV9fbAPN+ni9HlMH4+TOyOyhLVgKUBKAf6sTmNouWJ9EOtN
         bR2A==
X-Forwarded-Encrypted: i=1; AJvYcCU+wdnrHRMo012+eY1SIod7WVj3sPIZ3zvIJWtj7aAfpRZOhfVVIdzO9Z5JOX9ddE61TiNikxnbV4cXmNif6w==
X-Gm-Message-State: AOJu0YzlDSTPtjbXtyc0kOhnsX6kUzL4S1jCTArLxLkWgqFgRyycuSXE
	d/Q1TgUT95MQovn7qFfKNB5i7joaYiwHllZb1hO8bG8zTKDnutKH9dTjvZMpFR4=
X-Google-Smtp-Source: AGHT+IHiPuNBTdnlzshXbP/5TpbBgxsfsjL3mHvPWbZ/i8OnttVYGnTesKL64t9BOLVMqjcBTGlyrw==
X-Received: by 2002:a17:906:aa4c:b0:a47:4e09:e685 with SMTP id kn12-20020a170906aa4c00b00a474e09e685mr8026763ejb.32.1712051987776;
        Tue, 02 Apr 2024 02:59:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k5-20020a170906a38500b00a4761c94a5esm6360373ejz.107.2024.04.02.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:59:47 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:59:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
	arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 03/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <38fc3188-7c44-4797-b2ab-b06b7f60d1a9@moroto.mountain>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-4-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240323164359.21642-4-kabel@kernel.org>

On Sat, Mar 23, 2024 at 05:43:51PM +0100, Marek Behún wrote:
> +static ssize_t front_button_mode_store(struct device *dev,
> +				       struct device_attribute *a,
> +				       const char *buf, size_t count)
> +{
> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
> +	u8 mask, val;
> +	int err, i;
> +
> +	mask = CTL_BUTTON_MODE;

No need for the mask variable.  Just use CTL_BUTTON_MODE directly.

regards,
dan carpenter

> +
> +	i = sysfs_match_string(front_button_modes, buf);
> +	if (i < 0)
> +		return i;
> +
> +	val = i ? mask : 0;
> +	err = omnia_ctl_cmd_locked(mcu, CMD_GENERAL_CONTROL, val, mask);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(front_button_mode);

