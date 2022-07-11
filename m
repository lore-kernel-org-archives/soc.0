Return-Path: <SRS0=O2Vz=XQ=gmail.com=fancer.lancer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A1CC43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 19:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 887A5C341C8; Mon, 11 Jul 2022 19:09:30 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E55AFC34115
	for <soc@kernel.org>; Mon, 11 Jul 2022 19:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E55AFC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id d12so10241944lfq.12
        for <soc@kernel.org>; Mon, 11 Jul 2022 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NNCQrtnWgXhweJyHBzmUMAvNZjug28FIArGHTvNylrU=;
        b=LytjKyLMp2QvtPgcfXhehbLH0cHqmVC7tGT5N0b9lPbyskD0GSK2so9hz7mo+MvsFP
         wkTXigM/IowhrRJf7f50XTXEUdLp6ySvTTCdzRnvuJuXfonICikuRbFCX1FPA2eI2pPZ
         9N2Eg0ZtNX3lY1bhP++ULq4ewWzt8Tz0XFq7R4CxIKPFbrq92mQKpgSKaUahI76/lePt
         9GT3RosG28W4H7Uuo8Ws4cdNm2fWkCIzqfihnaG27chA9tH4BiguWEf6u73qqS6lnu+8
         z25nBEiYU5nZr6oU82Tb2WzdM7suqOLwpWTTETig3PbHIXJVgtHkSopEERyjfFLGlgGU
         8FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NNCQrtnWgXhweJyHBzmUMAvNZjug28FIArGHTvNylrU=;
        b=R9Pcw/vo/jLqkclSVRVfpYpafCyoR7tpD8j0JNFrdtY8fPjGecgRc+yEGwOKx9tSHA
         SQYwQKOCGzp3xrbYtP6AWVV/EEC9md4ymd89aFxDaQhjwxckTVBBgQooYRhUlbdH0c04
         6u6bzcTGR1NdCcE8+B8laict9kCxqb/FAjMwNCTe7Wmh+93PnmZUQfb9jRArbcnHV/VG
         bIuCgMKINXctYplhL1yNxG4RLHxo+yutn8ECOzozHu3vqo7dEdzue+wm/iFSid4Cr7Xp
         Xt9b2l35qJRQDKYBDlQNT4W4eYkl1PdZLvw/uuVjn6oC1TzTE139y3QOkPiczGgHLb/q
         ZQxA==
X-Gm-Message-State: AJIora/tP89pPEjmmNNjFrYE8VTo9zh8UCU4fRepEf6/UA8qKhjom8ww
	T8D1XmHAF5zoT/CcrfuagsQ=
X-Google-Smtp-Source: AGRyM1vXa70epjhbuq8PxAzpww+wC+BQvclHtmuk7j1QBF+G+OQIMszM+RebFISkxQOoXfG9CGOQ6A==
X-Received: by 2002:a05:6512:3e08:b0:489:d3c3:e901 with SMTP id i8-20020a0565123e0800b00489d3c3e901mr6142805lfv.125.1657566567925;
        Mon, 11 Jul 2022 12:09:27 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id w6-20020a05651204c600b0047f9cfa914csm1706987lfq.18.2022.07.11.12.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 12:09:27 -0700 (PDT)
Date: Mon, 11 Jul 2022 22:09:25 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	SoC Team <soc@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v4 1/2] bus: bt1-apb: Don't print error on
 -EPROBE_DEFER
Message-ID: <20220711190925.pk4pt3kh5tgxd3mv@mobilestation>
References: <20220708194448.10700-1-Sergey.Semin@baikalelectronics.ru>
 <20220711155335.ltctlk66vylwcpcj@mobilestation>
 <CAK8P3a2H0+LDO18onn3F469t4ci=VbL+EZV83dct74Ce8tqfqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2H0+LDO18onn3F469t4ci=VbL+EZV83dct74Ce8tqfqg@mail.gmail.com>

On Mon, Jul 11, 2022 at 08:54:26PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 11, 2022 at 5:53 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> >
> > Hi Arnd, Philipp
> >
> > Since no comments have been posted for the patches lately and the @Philipp
> > notes have been fixed way on v2, could you please consider merge the
> > patchset in through any of your repos?
> 
> 

> Hi Sergey,
> 
> I already merged these into the arm/drivers tree on June 10,

Hi Arnd. Great! Thanks for accepting the patches.

> I suppose
> something went wrong with the notification email.

Alas I haven't got any notification. Spam folder has nothing too.

-Sergey

> 
>       Arnd
