Return-Path: <johan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435A6C4332F
	for <soc@archiver.kernel.org>; Thu, 20 Oct 2022 06:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 101E7C4347C; Thu, 20 Oct 2022 06:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E634FC433D7;
	Thu, 20 Oct 2022 06:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666249101;
	bh=PP67Sfe4my3BPjEvhljdfbZ7tiQ1kUCl/ugv2NE8w5o=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=oaJmh/tZ8Xs5TuzdoWrBr1svZtjiumywvkDHWUyuxSLmjxCeyJOeAhjZQWqZfp19j
	 Z0F1M46sbf3AnBq4fwZBDxKp0BLnPS6g6DL0KFlzF1oxjNFDIGipq2eIR6Q/V10gsz
	 61Y8+Bf0OJrhEMI6cZLUUTYYhUEIV/eRQIw+hIfI3tMuHkxeHJv1Ex/8xuIcZvGeSw
	 4EobGBN08wDiCgfWuljCuGVhxf2Oo9RD+HT7hPbCiBnQ5SOaN6VFTcFNnAeFyMrnHW
	 NA+Wy8+mKSvbblqlESOMUc07JMCzuanyhxSKrniFN/yzDgrymcenEpXjr8Tr8nwZCA
	 xXohW49l/4x9g==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1olPVG-00089x-BZ; Thu, 20 Oct 2022 08:58:07 +0200
Date: Thu, 20 Oct 2022 08:58:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, soc@kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [RESEND PATCH v2] firmware/psci: Print a warning if PSCI doesn't
 accept PC mode
Message-ID: <Y1DxfjExuzfKLWDs@hovoldconsulting.com>
References: <20220926110249.666813-1-dmitry.baryshkov@linaro.org>
 <Y1AGLPXWFOmjfdd0@hovoldconsulting.com>
 <CAPDyKFr9MraGWz7hbHyGtFsk7V2_GBUqvWBG5yM40zV6utwXOQ@mail.gmail.com>
 <CAA8EJpoHSHqsqok1hhVhF-24O5dwjA46fmdjsUg1aHjuiy266w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoHSHqsqok1hhVhF-24O5dwjA46fmdjsUg1aHjuiy266w@mail.gmail.com>

On Wed, Oct 19, 2022 at 06:02:37PM +0300, Dmitry Baryshkov wrote:
> On Wed, 19 Oct 2022 at 17:37, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Wed, 19 Oct 2022 at 16:14, Johan Hovold <johan@kernel.org> wrote:
> > > On Mon, Sep 26, 2022 at 02:02:49PM +0300, Dmitry Baryshkov wrote:
> > > > The function psci_pd_try_set_osi_mode() will print an error if enabling
> > > > OSI mode fails. To ease debugging PSCI issues print corresponding
> > > > message if switching to PC mode fails too.
> > > >
> > > > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> > > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > > index 9fdcb6bff403..42cae0ba10e2 100644
> > > > --- a/drivers/firmware/psci/psci.c
> > > > +++ b/drivers/firmware/psci/psci.c
> > > > @@ -164,6 +164,8 @@ int psci_set_osi_mode(bool enable)
> > > >                       PSCI_1_0_SUSPEND_MODE_PC;
> > > >
> > > >       err = invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE, suspend_mode, 0, 0);
> > > > +     if (err < 0)
> > > > +             pr_warn("failed to set %s mode: %d\n", enable ? "OSI" : "PC", err);
> > > >       return psci_to_linux_errno(err);
> > > >  }
> > >
> > > When booting 6.1-rc1 I now see:
> > >
> > >         [    0.000000] psci: OSI mode supported.
> > >         [    0.000000] psci: failed to set PC mode: -3
> > >
> > > on every boot with sc8280xp, while later enabling OSI mode still works:
> > >
> > >         [    0.227358] CPUidle PSCI: psci_pd_try_set_osi_mode - success
> > >         [    0.227599] CPUidle PSCI: Initialized CPU PM domain topology
> > >
> > > Judging from Sudeep's comment on v1:
> > >
> > >         The platform must boot in PC mode, so even if it fails we ignore
> > >         so not sure if the logging is of much help here IMO.
> > >
> > > perhaps logging this as an error is not a good idea?
> 
> As far as I understand, some of the Qualcomm platforms booted in the
> OSI mode, no matter what the spec says. I'm not sure about the
> sc8280xp, but it definitely was the case previously. This was the
> primary reason for adding a log here.
> 
> > I think it's useful to get information that the FW doesn't fully
> > conform to the spec (it should support PC mode), but that doesn't
> > really mean that it can't work.
> >
> > To me, it sounds like we should move the logging to the debug level!?
> 
> I'd say, either ignore the error, or move the warning to the info or
> debug level.

"Ignore the error" as in removing the warning or as in telling every
owner of an X13s Thinkpad to ignore it?

If there's nothing that can be done about it and this is nothing to
worry about, then moving to debug level would seem like the right thing
to do here. At least for the PC case.

Johan
