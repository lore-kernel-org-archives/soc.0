Return-Path: <SRS0=kd9Q=Z5=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0EAC32771
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 12:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E98E8C433D7; Mon, 26 Sep 2022 12:04:14 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB4BEC433B5
	for <soc@kernel.org>; Mon, 26 Sep 2022 12:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB4BEC433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-350cb1c0abaso28738297b3.9
        for <soc@kernel.org>; Mon, 26 Sep 2022 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JXQJXsGI89BdCSLfZat6mqt1uav/fNaAZbjr/4gf+nY=;
        b=Not6ByvvqSIZQZHWVAoraSBErTyfNCZuQSIsTP+CvEuMvX3ZkKWYVvXCGe9AxSdFo0
         JAHu9LPuzFdg5FzLsjNs6LuQDIz+9+InCcPb6zNLim4sko7brzZlZ1Kk4BaslnHHQZpg
         UIb3DPD+qDElW0JEOomkrX7IPwbgXVo8u7zESg1fB78A1Eqn9LYElbsktdSu4c+HXCxb
         u/T7pDhKeDvZNqN33veQ910oYVeBojxWdns+B9KQOK8HmAjIabdYSxlxZ//xoPVH9ATl
         axnSCwRXnbqnWV8W1xL+65kCeo4fZhf/o8WnGcxsX4875LPPAUUpzagm4dbfF3y9YwgQ
         u/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JXQJXsGI89BdCSLfZat6mqt1uav/fNaAZbjr/4gf+nY=;
        b=u9qVct5yPMB3jAtSwyXgUtw4YbS7q9XJtAeZoHWhHxXRgRuM/BwGV8D5Qeh8r0PAjj
         jh5sz2bYKWPM5xLfbanJlNawX9XuLe+NgV9in4M1MjjGIytZgB+VkFMJJXyktPLCjuFr
         y2kB74de2zKh3gpcdi+frHMV8k/chljfdlZ0tCzEq0OiJ7YJqMEngDxPWKsbcx7pmuJb
         s8boAcgjogV54k83E1vgavtOW1WgQs3reDAiL51ABaQYHOu7Hz1WY9zu9tdQUFL8y8Ce
         BFL7QAfioZ+WTJMjqx1MOLm7jTiG7icILRiQDKo/4WQzraigiFpQ9Y+mlGUtKmvzsOwP
         IscQ==
X-Gm-Message-State: ACrzQf1EEy5CUBugfxEw2JEJ2tLS5hERa7nzN4vX8GA8QXrLuoT7G74n
	bt1R6vGx/pyBu/glxszz/M1pvKw7/NSw7GUApqe3zg==
X-Google-Smtp-Source: AMsMyM4cNRRF1ligGecX4Z88psxs6jU2e2tZuXyzXnEvHF+OxhZDXd+5vRzIuCnI3wf+uU2N7khkngp7Huh+qm7tt4o=
X-Received: by 2002:a81:8502:0:b0:340:a7fc:ddb2 with SMTP id
 v2-20020a818502000000b00340a7fcddb2mr21484301ywf.378.1664193851645; Mon, 26
 Sep 2022 05:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220926110758.666922-1-dmitry.baryshkov@linaro.org> <CAPDyKFqAgukYVPvkrE=mzM88e+PfFnecwPLxdRogjnwHgLq=Jw@mail.gmail.com>
In-Reply-To: <CAPDyKFqAgukYVPvkrE=mzM88e+PfFnecwPLxdRogjnwHgLq=Jw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Sep 2022 15:04:00 +0300
Message-ID: <CAA8EJpqq-DKL-8z15C33KmQNs4CYcWUi6zaCN856OyE2VoJwzg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] firmware/psci: Add debugfs support to ease debugging
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, soc@kernel.org, 
	linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Sept 2022 at 14:39, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 26 Sept 2022 at 13:08, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > To ease debugging of PSCI supported features, add debugfs file called
> > 'psci' describing PSCI and SMC CC versions, enabled features and
> > options.
> >
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > I sketched this while trying to narrow down the particular issue on
> > the Qualcomm platform (which started as an attempt to implement PSCI
> > domains, but then led to understanding that while the platform claims
> > supports OSI, it doesn't support SET_SUSPEND). We were going to use
> > this to help to narrow down issues with the PSCI support on other
> > platforms as well.
> >
> > Changes since v1:
> > - Extended the table to include MEM_PROTECT functions (noted by Mark
> >   Brown)
> > - Switched to seq_puts where possible
> > - Changed S_IRUGO to 0444
> >
> > The patch is resent to include soc@kernel.org
> > ---
> >  drivers/firmware/psci/psci.c | 116 ++++++++++++++++++++++++++++++++++-
> >  include/uapi/linux/psci.h    |  14 +++++
> >  2 files changed, 129 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > index cfb448eabdaa..9fdcb6bff403 100644
> > --- a/drivers/firmware/psci/psci.c
> > +++ b/drivers/firmware/psci/psci.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/acpi.h>
> >  #include <linux/arm-smccc.h>
> >  #include <linux/cpuidle.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/errno.h>
> >  #include <linux/linkage.h>
> >  #include <linux/of.h>
> > @@ -324,12 +325,125 @@ static void psci_sys_poweroff(void)
> >         invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
> >  }
> >
> > -static int __init psci_features(u32 psci_func_id)
> > +static int psci_features(u32 psci_func_id)
> >  {
> >         return invoke_psci_fn(PSCI_1_0_FN_PSCI_FEATURES,
> >                               psci_func_id, 0, 0);
> >  }
> >
> > +#ifdef CONFIG_DEBUG_FS
> > +
> > +#define PSCI_ID(ver, _name) \
> > +       { .fn = PSCI_##ver##_FN_##_name, .name = #_name, }
> > +#define PSCI_ID_NATIVE(ver, _name) \
> > +       { .fn = PSCI_FN_NATIVE(ver, _name), .name = #_name, }
> > +
> > +/* A table of all optional functions */
> > +static const struct {
> > +       u32 fn;
> > +       const char *name;
> > +} psci_fn_ids[] = {
> > +       PSCI_ID_NATIVE(0_2, MIGRATE),
> > +       PSCI_ID(0_2, MIGRATE_INFO_TYPE),
> > +       PSCI_ID_NATIVE(0_2, MIGRATE_INFO_UP_CPU),
> > +       PSCI_ID(1_0, CPU_FREEZE),
> > +       PSCI_ID_NATIVE(1_0, CPU_DEFAULT_SUSPEND),
> > +       PSCI_ID_NATIVE(1_0, NODE_HW_STATE),
> > +       PSCI_ID_NATIVE(1_0, SYSTEM_SUSPEND),
> > +       PSCI_ID(1_0, SET_SUSPEND_MODE),
> > +       PSCI_ID_NATIVE(1_0, STAT_RESIDENCY),
> > +       PSCI_ID_NATIVE(1_0, STAT_COUNT),
> > +       PSCI_ID_NATIVE(1_1, SYSTEM_RESET2),
> > +       PSCI_ID(1_1, MEM_PROTECT),
> > +       PSCI_ID_NATIVE(1_1, MEM_PROTECT_CHECK_RANGE),
> > +};
> > +
> > +static int psci_debugfs_read(struct seq_file *s, void *data)
> > +{
> > +       int feature, type, i;
> > +       u32 ver;
> > +
> > +       ver = psci_ops.get_version();
>
> This call and some other calls below, triggers calls into the PSCI FW
> (via smc calls). Rather than having to do that, each time user space
> wants to read the debugfs data, we could cache/store that data during
> the "probe" sequence of the psci fw driver. In this way, we don't need
> to run the smc calls each time, but just once when probing.
>
> Did you consider that option? Or perhaps there are other problems of doing that?

Basically I did not want to complicate this. While caching firmware
information sounds appealing, it would complicate adding support for
the additional debugging features, like checking sleep state stats.

So, I'd say, it's not worth doing that.

>
> > +       seq_printf(s, "PSCIv%d.%d\n",
> > +                  PSCI_VERSION_MAJOR(ver),
> > +                  PSCI_VERSION_MINOR(ver));
> > +
> > +       /* PSCI_FEATURES is available only starting from 1.0 */
> > +       if (PSCI_VERSION_MAJOR(ver) < 1)
> > +               return 0;
> > +
> > +       feature = psci_features(ARM_SMCCC_VERSION_FUNC_ID);
> > +       if (feature != PSCI_RET_NOT_SUPPORTED) {
> > +               ver = invoke_psci_fn(ARM_SMCCC_VERSION_FUNC_ID, 0, 0, 0);
> > +               seq_printf(s, "SMC Calling Convention v%d.%d\n",
> > +                          PSCI_VERSION_MAJOR(ver),
> > +                          PSCI_VERSION_MINOR(ver));
> > +       } else {
> > +               seq_puts(s, "SMC Calling Convention v1.0 is assumed\n");
> > +       }
> > +
> > +       feature = psci_features(PSCI_FN_NATIVE(0_2, CPU_SUSPEND));
> > +       if (feature < 0) {
> > +               seq_printf(s, "PSCI_FEATURES(CPU_SUSPEND) error (%d)\n", feature);
> > +       } else {
> > +               seq_printf(s, "OSI is %ssupported\n",
> > +                          (feature & BIT(0)) ? "" : "not ");
> > +               seq_printf(s, "%s StateID format is used\n",
> > +                          (feature & BIT(1)) ? "Extended" : "Original");
> > +       }
> > +
> > +       type = psci_ops.migrate_info_type();
> > +       if (type == PSCI_0_2_TOS_UP_MIGRATE ||
> > +           type == PSCI_0_2_TOS_UP_NO_MIGRATE) {
> > +               unsigned long cpuid;
> > +
> > +               seq_printf(s, "Trusted OS %smigrate capable\n",
> > +                          type == PSCI_0_2_TOS_UP_NO_MIGRATE ? "not " : "");
> > +               cpuid = psci_migrate_info_up_cpu();
> > +               seq_printf(s, "Trusted OS resident on physical CPU 0x%lx (#%d)\n",
> > +                          cpuid, resident_cpu);
> > +       } else if (type == PSCI_0_2_TOS_MP) {
> > +               seq_puts(s, "Trusted OS migration not required\n");
> > +       } else {
> > +               if (type != PSCI_RET_NOT_SUPPORTED)
> > +                       seq_printf(s, "MIGRATE_INFO_TYPE returned unknown type (%d)\n", type);
> > +       }
> > +
> > +       for (i = 0; i < ARRAY_SIZE(psci_fn_ids); i++) {
> > +               feature = psci_features(psci_fn_ids[i].fn);
> > +               if (feature == PSCI_RET_NOT_SUPPORTED)
> > +                       continue;
> > +               if (feature < 0)
> > +                       seq_printf(s, "PSCI_FEATURES(%s) error (%d)\n",
> > +                                  psci_fn_ids[i].name, feature);
> > +               else
> > +                       seq_printf(s, "%s is supported\n", psci_fn_ids[i].name);
> > +       }
> > +
> > +       return 0;
> > +}
>
> [...]
>
> Kind regards
> Uffe



-- 
With best wishes
Dmitry
