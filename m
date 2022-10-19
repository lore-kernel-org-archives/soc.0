Return-Path: <SRS0=2x3j=2U=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1459C43217
	for <soc@archiver.kernel.org>; Wed, 19 Oct 2022 15:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84D38C43470; Wed, 19 Oct 2022 15:02:52 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6B1DC43141
	for <soc@kernel.org>; Wed, 19 Oct 2022 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6B1DC43141
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-360871745b0so170989797b3.3
        for <soc@kernel.org>; Wed, 19 Oct 2022 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bnmLmQrEHGWyf/DP85PzcqeX9D/CGzWWLqd5Fnlbrv8=;
        b=k0KN8LlIvQBow2s/oliIw8O/7H+huGPzD7jXeREApqjrWLcdaB5mUlfK0ROnzJL99b
         Hi+idS4l11+AdJMCqqQ+KhX/hENdM7GRDi6KxSmM7k37YOUIhS1u/mvvRFi4/8QXTqJK
         p4NiaG9FgCVPtht0OIETHTe9ZFxsQ/qePg5fZPyl3kkxjoUpNLYrMxxpB0/iy74zwnR6
         NEHY0xFMpHocQYLyppb6yWl1BfFiwmfqMsX9oxsxv+KKxehvZuVDrsIKs6XI4zsb9l9i
         W217l0G9zwYINqXD9U7yCXpwjxxOiJv52tn+jPJVlYLKslhIAKMYTP19MNznT34ig7Xu
         Mc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnmLmQrEHGWyf/DP85PzcqeX9D/CGzWWLqd5Fnlbrv8=;
        b=qZb5k6do2Has/YvbYiBBQzNGIh3sqJ822DPRes4op6AbqCXCP7WvsYTNHe0xNY8B9l
         oP2nd9IfUYm5J4oexo7AYbhYdIQRQvIFcpOSWc1ikzQxyad8fZknjQxVwreHiA5D8EOe
         lNB/4lBCiueFsZt/t5lz7GbhFTNldMFYgnwp3q/exINib0pNeeuIJSFCDO2Td4BhqITT
         TPGJDG6XpjbVP44DwYRPjEDEfQr1m0l0LsJZfajfuG2HcREUHoC2fhO9WYf2/lKkIHiZ
         lExg8aU4Fg9/yMfFmxQ7Kf2kW3lKEYzoP+stRQgqYVfN8MpDXd57TJl5atDcRIiu02ch
         8qog==
X-Gm-Message-State: ACrzQf0CWeDiMKqhXf7sWwu/ns83C0FdJf18SIaw/+TlJ0qKN0OBFpZP
	q/01wTK879n6mW7zADdUKMY/ociQGHGz00XdQ4QQpw==
X-Google-Smtp-Source: AMsMyM4aKUU+Xo8+u+QOdSuWJsM2dyiR014622G8w1nRSjAetHd/clPnpESByxfrGp88QUjr+O0p8KiAsdi25FaLjLQ=
X-Received: by 2002:a81:844f:0:b0:356:9481:8792 with SMTP id
 u76-20020a81844f000000b0035694818792mr7592658ywf.138.1666191768516; Wed, 19
 Oct 2022 08:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220926110249.666813-1-dmitry.baryshkov@linaro.org>
 <Y1AGLPXWFOmjfdd0@hovoldconsulting.com> <CAPDyKFr9MraGWz7hbHyGtFsk7V2_GBUqvWBG5yM40zV6utwXOQ@mail.gmail.com>
In-Reply-To: <CAPDyKFr9MraGWz7hbHyGtFsk7V2_GBUqvWBG5yM40zV6utwXOQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Oct 2022 18:02:37 +0300
Message-ID: <CAA8EJpoHSHqsqok1hhVhF-24O5dwjA46fmdjsUg1aHjuiy266w@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] firmware/psci: Print a warning if PSCI doesn't
 accept PC mode
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	soc@kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Oct 2022 at 17:37, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 19 Oct 2022 at 16:14, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Sep 26, 2022 at 02:02:49PM +0300, Dmitry Baryshkov wrote:
> > > The function psci_pd_try_set_osi_mode() will print an error if enabling
> > > OSI mode fails. To ease debugging PSCI issues print corresponding
> > > message if switching to PC mode fails too.
> > >
> > > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > This is a replacement for [1], now moving the warning from
> > > psci_set_osi_mode() callers to the function iself.
> > >
> > > The patch is resent to include soc@kernel.org
> > >
> > > [1] https://lore.kernel.org/all/20220727182034.983727-1-dmitry.baryshkov@linaro.org/
> > >
> > > ---
> > >  drivers/cpuidle/cpuidle-psci-domain.c | 4 +---
> > >  drivers/firmware/psci/psci.c          | 2 ++
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> > > index 3db4fca1172b..821984947ed9 100644
> > > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > > @@ -124,10 +124,8 @@ static bool psci_pd_try_set_osi_mode(void)
> > >               return false;
> > >
> > >       ret = psci_set_osi_mode(true);
> > > -     if (ret) {
> > > -             pr_warn("failed to enable OSI mode: %d\n", ret);
> > > +     if (ret)
> > >               return false;
> > > -     }
> > >
> > >       return true;
> > >  }
> > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > index 9fdcb6bff403..42cae0ba10e2 100644
> > > --- a/drivers/firmware/psci/psci.c
> > > +++ b/drivers/firmware/psci/psci.c
> > > @@ -164,6 +164,8 @@ int psci_set_osi_mode(bool enable)
> > >                       PSCI_1_0_SUSPEND_MODE_PC;
> > >
> > >       err = invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE, suspend_mode, 0, 0);
> > > +     if (err < 0)
> > > +             pr_warn("failed to set %s mode: %d\n", enable ? "OSI" : "PC", err);
> > >       return psci_to_linux_errno(err);
> > >  }
> >
> > When booting 6.1-rc1 I now see:
> >
> >         [    0.000000] psci: OSI mode supported.
> >         [    0.000000] psci: failed to set PC mode: -3
> >
> > on every boot with sc8280xp, while later enabling OSI mode still works:
> >
> >         [    0.227358] CPUidle PSCI: psci_pd_try_set_osi_mode - success
> >         [    0.227599] CPUidle PSCI: Initialized CPU PM domain topology
> >
> > Judging from Sudeep's comment on v1:
> >
> >         The platform must boot in PC mode, so even if it fails we ignore
> >         so not sure if the logging is of much help here IMO.
> >
> > perhaps logging this as an error is not a good idea?

As far as I understand, some of the Qualcomm platforms booted in the
OSI mode, no matter what the spec says. I'm not sure about the
sc8280xp, but it definitely was the case previously. This was the
primary reason for adding a log here.

> I think it's useful to get information that the FW doesn't fully
> conform to the spec (it should support PC mode), but that doesn't
> really mean that it can't work.
>
> To me, it sounds like we should move the logging to the debug level!?

I'd say, either ignore the error, or move the warning to the info or
debug level.

-- 
With best wishes
Dmitry
