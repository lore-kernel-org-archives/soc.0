Return-Path: <SRS0=2z6+=2V=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8B6C4332F
	for <soc@archiver.kernel.org>; Thu, 20 Oct 2022 09:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5AE0C4347C; Thu, 20 Oct 2022 09:21:53 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72366C433C1
	for <soc@kernel.org>; Thu, 20 Oct 2022 09:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72366C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id h185so18667633pgc.10
        for <soc@kernel.org>; Thu, 20 Oct 2022 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HAUKqpTZL1oN0c9IARv/EOZ8nI32TTVILYbCQedcdiU=;
        b=P7NZvwau6kxXOBRIIPyDX9UCBLToPv4i/BiJHPENAqMm5loIr7xxv3CoNnsp7efEfp
         SQ5PaZjfxLZ8aiBplZPxd7qJeCbjTYbNDEeu/fKNuECsb8FMCjBDaMkLxFCQz5vQH0Vj
         f1MI4Dq9Znu/acZm+twTBTvTDjWglA7WUxOHZM5cCuXrkIYFegxmkq81zAcMr81Fw5Zx
         SBcsS0ObJqMWWHLR2a4G5npO43lAq1a5eKeMsG78zl4Y0vVb4CFuwhTRXKyW7YI3sw54
         xc7DCbVEYTRtN5HvTWDCVqOp5+m5qK08YaowEW3gQn5MoHweteeTi44N2TzlpRvooR1Y
         xLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAUKqpTZL1oN0c9IARv/EOZ8nI32TTVILYbCQedcdiU=;
        b=Dly35NIO+wL7AsUcNLLY5UxdBRJLJX379+rkpv4xUKs7an+i0J85aoJDupSo6yERj3
         Q6FmNBCovk0618pQCPoBr4fIbuhLe3hd4zPp/HfnOVoJNcMr4kSvf1Tf1Vcyl0kMQTYV
         qHf9sr7UQF3rRIvC1OElfVmUa28Oj5kFhPpPVGU/e2n38VTyRbpbawEkswezlsgywtSj
         /1JZ6W6wqQDQkrSYb77jkc6oAMY4IOrWEEsnsjyVILcwXm4VYOGlZLlhHyGaD8ArL3HE
         /xUOE5NeQPplC3U8P6GYURmelCPKcl8wqoxv3zamr0pGoANiCh2nOqz/CvObgZvXM7Iv
         Ut/g==
X-Gm-Message-State: ACrzQf26rAWAWpwTndyeGQRnLgRSHmCACqtMn8cTMo46oejQIREZJd0e
	D7L70y8X16e8KyVD4Wx8pHUbZiwlwqwvrWKv2IJSXA==
X-Google-Smtp-Source: AMsMyM5EFhZcOKXD4jbLC4uJzH/sLnLqYeToOwRNI1b/xi2JyJW5VutuhS/86IgXXTBJCl+Hhoqdh3D/BFP7AWKBLrE=
X-Received: by 2002:a63:464d:0:b0:441:5968:cd0e with SMTP id
 v13-20020a63464d000000b004415968cd0emr11355967pgk.595.1666257711904; Thu, 20
 Oct 2022 02:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220926110249.666813-1-dmitry.baryshkov@linaro.org>
 <Y1AGLPXWFOmjfdd0@hovoldconsulting.com> <CAPDyKFr9MraGWz7hbHyGtFsk7V2_GBUqvWBG5yM40zV6utwXOQ@mail.gmail.com>
 <CAA8EJpoHSHqsqok1hhVhF-24O5dwjA46fmdjsUg1aHjuiy266w@mail.gmail.com> <Y1DxfjExuzfKLWDs@hovoldconsulting.com>
In-Reply-To: <Y1DxfjExuzfKLWDs@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 20 Oct 2022 11:21:14 +0200
Message-ID: <CAPDyKFpvyrp3Lyyou8TT-KcC-_Q9NLs3wpb6qrDbz7=i0e_vhg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] firmware/psci: Print a warning if PSCI doesn't
 accept PC mode
To: Johan Hovold <johan@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	soc@kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Oct 2022 at 08:58, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Oct 19, 2022 at 06:02:37PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 19 Oct 2022 at 17:37, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Wed, 19 Oct 2022 at 16:14, Johan Hovold <johan@kernel.org> wrote:
> > > > On Mon, Sep 26, 2022 at 02:02:49PM +0300, Dmitry Baryshkov wrote:
> > > > > The function psci_pd_try_set_osi_mode() will print an error if enabling
> > > > > OSI mode fails. To ease debugging PSCI issues print corresponding
> > > > > message if switching to PC mode fails too.
> > > > >
> > > > > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > > > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > > > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > > > index 9fdcb6bff403..42cae0ba10e2 100644
> > > > > --- a/drivers/firmware/psci/psci.c
> > > > > +++ b/drivers/firmware/psci/psci.c
> > > > > @@ -164,6 +164,8 @@ int psci_set_osi_mode(bool enable)
> > > > >                       PSCI_1_0_SUSPEND_MODE_PC;
> > > > >
> > > > >       err = invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE, suspend_mode, 0, 0);
> > > > > +     if (err < 0)
> > > > > +             pr_warn("failed to set %s mode: %d\n", enable ? "OSI" : "PC", err);
> > > > >       return psci_to_linux_errno(err);
> > > > >  }
> > > >
> > > > When booting 6.1-rc1 I now see:
> > > >
> > > >         [    0.000000] psci: OSI mode supported.
> > > >         [    0.000000] psci: failed to set PC mode: -3
> > > >
> > > > on every boot with sc8280xp, while later enabling OSI mode still works:
> > > >
> > > >         [    0.227358] CPUidle PSCI: psci_pd_try_set_osi_mode - success
> > > >         [    0.227599] CPUidle PSCI: Initialized CPU PM domain topology
> > > >
> > > > Judging from Sudeep's comment on v1:
> > > >
> > > >         The platform must boot in PC mode, so even if it fails we ignore
> > > >         so not sure if the logging is of much help here IMO.
> > > >
> > > > perhaps logging this as an error is not a good idea?
> >
> > As far as I understand, some of the Qualcomm platforms booted in the
> > OSI mode, no matter what the spec says. I'm not sure about the
> > sc8280xp, but it definitely was the case previously. This was the
> > primary reason for adding a log here.
> >
> > > I think it's useful to get information that the FW doesn't fully
> > > conform to the spec (it should support PC mode), but that doesn't
> > > really mean that it can't work.
> > >
> > > To me, it sounds like we should move the logging to the debug level!?
> >
> > I'd say, either ignore the error, or move the warning to the info or
> > debug level.
>
> "Ignore the error" as in removing the warning or as in telling every
> owner of an X13s Thinkpad to ignore it?
>
> If there's nothing that can be done about it and this is nothing to
> worry about, then moving to debug level would seem like the right thing
> to do here. At least for the PC case.

Yes.

For the OSI case, I think a better option is to extend the print of
"Initialized CPU PM domain topology\n", in psci_cpuidle_domain_probe()
with information about whether OSI is being used or not.

Kind regards
Uffe
