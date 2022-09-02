Return-Path: <SRS0=llEl=ZF=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75019C54EE9
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 09:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CC6EC433B5; Fri,  2 Sep 2022 09:22:31 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61775C433D6
	for <soc@kernel.org>; Fri,  2 Sep 2022 09:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61775C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id g21so1252718qka.5
        for <soc@kernel.org>; Fri, 02 Sep 2022 02:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=L9O5decV2/N6JOI8M13p/L7aDc3oKkUKc7b1+iVr6Ns=;
        b=n8pH9KVWUwdC05ORursrzQoLTB97iTUEuehPv0ggTG2QfBGg4nhiwfUPI/g+QGH3zT
         r9xBeHoditdJ7HHhnwz0AeDSPO8cfpprt8M7agSmx3x6JQS5ZWR1kvT3LsYcbVnvpvwm
         omAtNUkcO62GYE8XSPDGGD5cVtwdCjlLJ2fJD01v4N1jRJZv/Fxvo2StNLMikWN/6ods
         0H5mdHSLTjgbx77KBirRUlzPEWeDgPxO3CE1inI1PJ8QqlMTwyG+Kig104RY9g4hIx1w
         ju4WuFunjO25RTn99gp3+OZWHMLi58Zn5cjvS7v9Iw6GkeavE3qAUE4yDKd1VotFCsTp
         l2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=L9O5decV2/N6JOI8M13p/L7aDc3oKkUKc7b1+iVr6Ns=;
        b=t4TdFc/fRsw6rhQb0gxAu/4sR/kXfg0V51mUO1LorgooNtpQ54zvlJBRgURb3Ds3aA
         FNjmNtWGBRNOp7whhZQxomL/AtLlFUmcnQqW57X8b9Q2mGnq1gbwfJHLmxNl6J8xD2dU
         NVN8QslSNae9RZ2ccOJG9oln5zEE3RTCfzukfvaiFnytZ6I/rgmrqgw+MhA4L+q89GjH
         6j/SpJECWfWpypoxq5bFiBZduTO/Pb6p1Fion9K1t39fWGX3i7kmeZKy7+TE2YbTWNg9
         KMhR257s4fk1PKBSLJU0Epd6u+LJs8wJ8b8aUuFv8Vz5mPVJt9NxBOoO6YGnx8WcX8+p
         74+g==
X-Gm-Message-State: ACgBeo36EeqkiPTZuUzAWVpNns+J/02v6Oi0zPgD7cZ2qdToUip2RNIp
	DDFybq+HxDvxoHvqmPsnnxXoDrXR112G6vmOwaw=
X-Google-Smtp-Source: AA6agR5D3GHip/lU9Aj+WQapz0eupiIvUYun+mL3ehqHavPF9Osvco/OW9GJftX+j+YzjPj7xn78DqEhKYcPwbahytE=
X-Received: by 2002:a05:620a:410e:b0:6bc:5cdc:88ec with SMTP id
 j14-20020a05620a410e00b006bc5cdc88ecmr22866476qko.734.1662110549331; Fri, 02
 Sep 2022 02:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <1662104841-55360-1-git-send-email-john.garry@huawei.com>
 <1662104841-55360-6-git-send-email-john.garry@huawei.com> <CAHp75VdfwGCUpZN3b1AD1kARc=FhyA4EDWDuZ8+1DKN3u73DeA@mail.gmail.com>
In-Reply-To: <CAHp75VdfwGCUpZN3b1AD1kARc=FhyA4EDWDuZ8+1DKN3u73DeA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 12:21:53 +0300
Message-ID: <CAHp75VeE2OZHzwG-KbTHYks+G=sLfyx9Yy1W=RxORTtet-vDnQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] bus: hisi_lpc: Use platform_device_register_full()
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: "xuwei (O)" <xuwei5@hisilicon.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linuxarm <linuxarm@huawei.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, 
	Yang Yingliang <yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 12:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Sep 2, 2022 at 11:10 AM John Garry <john.garry@huawei.com> wrote:
> >
> > The code to create the child platform device is essentially the same as
> > what platform_device_register_full() does, so change over to use
> > that same function to reduce duplication.
>
> Now statistics plays for you and not against.
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Too fast to give a tag, see below (keep tag if addressing it)

...

> > -       pdev = platform_device_alloc(cell->name, PLATFORM_DEVID_AUTO);
> > +       pdev = platform_device_register_full(cell->pdevinfo);

> >         if (!pdev)
> >                 return -ENOMEM;

As per kernel doc:
 * Returns &struct platform_device pointer on success, or ERR_PTR() on error.

-- 
With Best Regards,
Andy Shevchenko
