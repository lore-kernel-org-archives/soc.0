Return-Path: <SRS0=ztSF=Z5=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C19C6FA86
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 13:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB8CFC43140; Mon, 26 Sep 2022 13:50:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7528AC433D6
	for <soc@kernel.org>; Mon, 26 Sep 2022 13:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7528AC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id t7so10293651wrm.10
        for <soc@kernel.org>; Mon, 26 Sep 2022 06:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=51L11/Eb0FzfzPONeQTaL/VY2y3dvAoHKauy/xTHuE4=;
        b=X3SwnMtC+ZcczcNmCkVzFFRP5wKAClQbc6zKdrN4XjyOC1ievUb9e5H2FblwKKo7/N
         E0qYejC6HSnwtJsUwmPBUMlR/Bu0xkapidnanYtkaH0VApVmDdFJjhgIS9oT1rQTL8Ru
         DhaIRBLfT12GYjE+0EHKh5aY6bI3ANszQXkDKq6pk8qUymNFzZRa+3AXvmG484OP1M+4
         bzG4vlObkndYekbqsG/d9lS6T01Iv/No8h1Das7F/EpBIEanqmDBduQ6yDs7fExRjzkG
         d4MgjoJm7l6IEyPR0eEKhh9rZyFLGcfc8BTOEafioufzgslCXO72RTg7G82AwnE1CStM
         f/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=51L11/Eb0FzfzPONeQTaL/VY2y3dvAoHKauy/xTHuE4=;
        b=45Al8Jkbc0Mj7llY8T6REDh9ReniN1J0yvEbcA6J3Ql8uFbrA10Q6IezEO8pTUENC3
         dNkOWqD06U8kDQcQHXAmkRtpNbqAZDowqbXgmtw3446ima7EGG6fSmVFPYjnIg5eVI7L
         SBVA1X5NERuEn1cfr0GIEi7q8dyUUgra+eQvfSNaPpWQ6M7x/FuWT4pS/k11ruF5aoYP
         jdEYyjwhE4pLgDVkwctvHwqDpteA9RVTWtgWTgGwXKwakJ3693MU9My8sBvDw1O4GClM
         lvg2OCeHB3LyQiRC8+BDPRioWpvWdniFWR+NJt2OQW6j6q62FDLSPu1qDv0rlvFWChDg
         kKvg==
X-Gm-Message-State: ACrzQf0c2q4mYikvulsO68KAseU+qqwKYa9UlEJj5Lau1HMCVmrw0PDY
	yltjJi39vgQX65lQmFZ8Is1pCC0VDGKnRQUyhYNWBQ==
X-Google-Smtp-Source: AMsMyM4DSZsg80UMW9gmncp54qOAxC+heRjWLPvbzKg9P5pBwAwJV+IvQGRKEYPqITaFdrW7X8ObfY9fn+pTk7Kq14A=
X-Received: by 2002:a05:6000:81e:b0:228:a17f:92f0 with SMTP id
 bt30-20020a056000081e00b00228a17f92f0mr13959102wrb.31.1664200249678; Mon, 26
 Sep 2022 06:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220926110758.666922-1-dmitry.baryshkov@linaro.org>
 <CAPDyKFqAgukYVPvkrE=mzM88e+PfFnecwPLxdRogjnwHgLq=Jw@mail.gmail.com> <CAA8EJpqq-DKL-8z15C33KmQNs4CYcWUi6zaCN856OyE2VoJwzg@mail.gmail.com>
In-Reply-To: <CAA8EJpqq-DKL-8z15C33KmQNs4CYcWUi6zaCN856OyE2VoJwzg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 26 Sep 2022 15:50:13 +0200
Message-ID: <CAPDyKFpJGdX39ZKqwZZhsFns4aKq++3se_EPcAGzUjOy_dj3mg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] firmware/psci: Add debugfs support to ease debugging
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, soc@kernel.org, 
	linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Sept 2022 at 14:04, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 26 Sept 2022 at 14:39, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Mon, 26 Sept 2022 at 13:08, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > To ease debugging of PSCI supported features, add debugfs file called
> > > 'psci' describing PSCI and SMC CC versions, enabled features and
> > > options.
> > >
> > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > I sketched this while trying to narrow down the particular issue on
> > > the Qualcomm platform (which started as an attempt to implement PSCI
> > > domains, but then led to understanding that while the platform claims
> > > supports OSI, it doesn't support SET_SUSPEND). We were going to use
> > > this to help to narrow down issues with the PSCI support on other
> > > platforms as well.
> > >
> > > Changes since v1:
> > > - Extended the table to include MEM_PROTECT functions (noted by Mark
> > >   Brown)
> > > - Switched to seq_puts where possible
> > > - Changed S_IRUGO to 0444
> > >
> > > The patch is resent to include soc@kernel.org
> > > ---
> > >  drivers/firmware/psci/psci.c | 116 ++++++++++++++++++++++++++++++++++-
> > >  include/uapi/linux/psci.h    |  14 +++++
> > >  2 files changed, 129 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > index cfb448eabdaa..9fdcb6bff403 100644
> > > --- a/drivers/firmware/psci/psci.c
> > > +++ b/drivers/firmware/psci/psci.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/acpi.h>
> > >  #include <linux/arm-smccc.h>
> > >  #include <linux/cpuidle.h>
> > > +#include <linux/debugfs.h>
> > >  #include <linux/errno.h>
> > >  #include <linux/linkage.h>
> > >  #include <linux/of.h>
> > > @@ -324,12 +325,125 @@ static void psci_sys_poweroff(void)
> > >         invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
> > >  }
> > >
> > > -static int __init psci_features(u32 psci_func_id)
> > > +static int psci_features(u32 psci_func_id)
> > >  {
> > >         return invoke_psci_fn(PSCI_1_0_FN_PSCI_FEATURES,
> > >                               psci_func_id, 0, 0);
> > >  }
> > >
> > > +#ifdef CONFIG_DEBUG_FS
> > > +
> > > +#define PSCI_ID(ver, _name) \
> > > +       { .fn = PSCI_##ver##_FN_##_name, .name = #_name, }
> > > +#define PSCI_ID_NATIVE(ver, _name) \
> > > +       { .fn = PSCI_FN_NATIVE(ver, _name), .name = #_name, }
> > > +
> > > +/* A table of all optional functions */
> > > +static const struct {
> > > +       u32 fn;
> > > +       const char *name;
> > > +} psci_fn_ids[] = {
> > > +       PSCI_ID_NATIVE(0_2, MIGRATE),
> > > +       PSCI_ID(0_2, MIGRATE_INFO_TYPE),
> > > +       PSCI_ID_NATIVE(0_2, MIGRATE_INFO_UP_CPU),
> > > +       PSCI_ID(1_0, CPU_FREEZE),
> > > +       PSCI_ID_NATIVE(1_0, CPU_DEFAULT_SUSPEND),
> > > +       PSCI_ID_NATIVE(1_0, NODE_HW_STATE),
> > > +       PSCI_ID_NATIVE(1_0, SYSTEM_SUSPEND),
> > > +       PSCI_ID(1_0, SET_SUSPEND_MODE),
> > > +       PSCI_ID_NATIVE(1_0, STAT_RESIDENCY),
> > > +       PSCI_ID_NATIVE(1_0, STAT_COUNT),
> > > +       PSCI_ID_NATIVE(1_1, SYSTEM_RESET2),
> > > +       PSCI_ID(1_1, MEM_PROTECT),
> > > +       PSCI_ID_NATIVE(1_1, MEM_PROTECT_CHECK_RANGE),
> > > +};
> > > +
> > > +static int psci_debugfs_read(struct seq_file *s, void *data)
> > > +{
> > > +       int feature, type, i;
> > > +       u32 ver;
> > > +
> > > +       ver = psci_ops.get_version();
> >
> > This call and some other calls below, triggers calls into the PSCI FW
> > (via smc calls). Rather than having to do that, each time user space
> > wants to read the debugfs data, we could cache/store that data during
> > the "probe" sequence of the psci fw driver. In this way, we don't need
> > to run the smc calls each time, but just once when probing.
> >
> > Did you consider that option? Or perhaps there are other problems of doing that?
>
> Basically I did not want to complicate this. While caching firmware
> information sounds appealing, it would complicate adding support for
> the additional debugging features, like checking sleep state stats.
>
> So, I'd say, it's not worth doing that.

Alright, no strong opinion from my side. Feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]

Kind regards
Uffe
