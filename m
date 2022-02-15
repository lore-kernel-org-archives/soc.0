Return-Path: <SRS0=jFEg=S6=linaro.org=lee.jones@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF93C433EF
	for <soc@archiver.kernel.org>; Tue, 15 Feb 2022 09:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD9B7C340EC; Tue, 15 Feb 2022 09:22:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FAD7C340EB
	for <soc@kernel.org>; Tue, 15 Feb 2022 09:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FAD7C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id az26-20020a05600c601a00b0037c078db59cso981274wmb.4
        for <soc@kernel.org>; Tue, 15 Feb 2022 01:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MGallghbqZYnV5XKa1+ZW10tPrTrZGW9EkboS7fw5MQ=;
        b=wVvz2W3ESnbTzOVGKu+YOG9h+YDJ+KwFyhJTmJJzyRY5M+7hZeO8mDzNq02IwUr/w/
         DQ9Ebxsy4tukzG+Cv6VjxPGiR+YHA6KhNobCh/HL8IqlVnIy+cRSv/SolinaKdGTiEH7
         El8dS3NWdA5UVReFFH5aG1HRZ0CSbs9d1xECsLMcNdFIs5Mub3MSiNm/3F3Np9aWpXuS
         u766soTHmG4JViYSnWGynU7neqFnv7ynOCe6FTvE2+YeZOmgw+t5HeBA0zCPuLc3Po6l
         WWU1j+6BMCRYVmqMsTBzAvFQujRevjh5OkxuFxTUE9YGTKPpT+0/im0ba/1mUUF0UcjD
         BKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MGallghbqZYnV5XKa1+ZW10tPrTrZGW9EkboS7fw5MQ=;
        b=KHTSwBFzPQIRsQ7QmJbAzsOhWAqvUxGVsJsQbRIb9YxNbUj8lxtjUoygC0LrmmUONh
         xvJQRS6uqzta2b6nj0Z2bZVMyN6dgwNY6nAqYiSit2FCnVgoaUvEifd0BRqDrWn/Gx5J
         XPI7pgoIhHMBo0cVn/FBETPBl6UeVDzzpPWOxlFtTtXy6RXua4ljMd/0Xy8207TJZ4EG
         310mRXbMXKJcphbAByR3+UpBCF0Mxv2yxEbh3aWRnjwIaI4CDSmtuLPsghN8HXxPN065
         gOF+2A/UY0bEEzbPuCutTLvtKttllKaF1iU7xFFhDWeUesGeAPih/BDNEpkJWazHRFzK
         bO2w==
X-Gm-Message-State: AOAM533etpHUbavLrmeyWsXl9GAviYMXtsxB6TX+e41v7jDDggWXTHZ6
	ssbb+Cr1R60zYiPJBNaWbPorkg==
X-Google-Smtp-Source: ABdhPJzELvsNi/azn1IFMoIkFlgJQS6KAnNJYi5Q+IUJAj5r3qfJnM0VYiWzldu9oTmC+b3qdCyTGg==
X-Received: by 2002:a05:600c:1e8e:b0:37b:b9ab:e35d with SMTP id be14-20020a05600c1e8e00b0037bb9abe35dmr2228754wmb.109.1644916972521;
        Tue, 15 Feb 2022 01:22:52 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f14sm13569965wmq.3.2022.02.15.01.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 01:22:51 -0800 (PST)
Date: Tue, 15 Feb 2022 09:22:50 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Michael Walle <michael@walle.cc>, SoC Team <soc@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] MAINTAINERS: add myself as a maintainer for the sl28cpld
Message-ID: <Ygtw6hJFfDC6fd07@google.com>
References: <20220207184652.1218447-1-michael@walle.cc>
 <YgpkCyoSMg5RYfkO@google.com>
 <YgpkQMbhWAJG6oCh@google.com>
 <CAK8P3a0UWO=h6K4NpzCVC2vbOvThJH28GM5ddm9U1crr1Su7vQ@mail.gmail.com>
 <YgqE/OvNDco5wEY3@google.com>
 <CAK8P3a1aqcsD-fGBgAmsi0qf9Td_y3Ry+o32Z1fU8H3qmEn0GA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a1aqcsD-fGBgAmsi0qf9Td_y3Ry+o32Z1fU8H3qmEn0GA@mail.gmail.com>

On Mon, 14 Feb 2022, Arnd Bergmann wrote:

> On Mon, Feb 14, 2022 at 5:36 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Mon, 14 Feb 2022, Arnd Bergmann wrote:
> > > On Mon, Feb 14, 2022 at 3:16 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > > Hold on, you're not going to get many Acks if you don't send it to the
> > > > other subsystem maintainers. :)
> > >
> > > I've already applied this one through the soc tree.
> >
> > You did?  I missed the acceptance email.
> 
> I see now that the automated mails only get sent the submitter and
> the list that is owned by patchwork. I completely missed how this
> was sent to multiple maintainers and just grabbed it from patchwork
> along with some other maintainer changes I picked up.
> 
> > It would have been nice to give the other maintainers a chance to look
> > at it first, but I guess it's not a big deal in the great scheme.
> 
> Right, I need to find a better process to look at the actual emails
> when going through patchwork. Sorry about that.

No problem at all.  Thank you for the explanation.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
