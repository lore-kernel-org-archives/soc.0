Return-Path: <johan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8B6C43217
	for <soc@archiver.kernel.org>; Wed, 19 Oct 2022 14:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01F4DC433B5; Wed, 19 Oct 2022 14:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85F0C433C1;
	Wed, 19 Oct 2022 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666188856;
	bh=/6HxliF+O90I74ybFJn/y4dqB2sGJTLvlhB20rV8hUg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=gmx/8MoVdje7U94zG8PcHLFNeZt3k0ywIZhFlKOqIgb9H10XfJXFNEiRjZZurlRrx
	 N+V+uHpZv+HeQl3MMZmO21CCUChNDOKKmLCvRCo3W9dl2kie+5cPBO8xOXo9tA3WYM
	 FLplIflSfm362Qp5AkOfnrrUrkz0qS7Gw7Q9yZQHo7ZHrdgUcSOQ8hBYNNKlTVC3VK
	 qsktyGP4DIjidBRsH/tRf1ZfIC+IHNMcBXWPq2b7gNogF3bbOl5E3mqzJzL/XS7iWT
	 rGHb9We7PUtFSTH6SWxOulvhDnS9nUZLHf3rx+wYBlJYg/7dn/PaGYre2Fb60aLXjO
	 adVG/rSVIu2nA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1ol9pc-0002qm-7Z; Wed, 19 Oct 2022 16:14:04 +0200
Date: Wed, 19 Oct 2022 16:14:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, soc@kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [RESEND PATCH v2] firmware/psci: Print a warning if PSCI doesn't
 accept PC mode
Message-ID: <Y1AGLPXWFOmjfdd0@hovoldconsulting.com>
References: <20220926110249.666813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926110249.666813-1-dmitry.baryshkov@linaro.org>

On Mon, Sep 26, 2022 at 02:02:49PM +0300, Dmitry Baryshkov wrote:
> The function psci_pd_try_set_osi_mode() will print an error if enabling
> OSI mode fails. To ease debugging PSCI issues print corresponding
> message if switching to PC mode fails too.
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> This is a replacement for [1], now moving the warning from
> psci_set_osi_mode() callers to the function iself.
> 
> The patch is resent to include soc@kernel.org
> 
> [1] https://lore.kernel.org/all/20220727182034.983727-1-dmitry.baryshkov@linaro.org/
> 
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 4 +---
>  drivers/firmware/psci/psci.c          | 2 ++
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index 3db4fca1172b..821984947ed9 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -124,10 +124,8 @@ static bool psci_pd_try_set_osi_mode(void)
>  		return false;
>  
>  	ret = psci_set_osi_mode(true);
> -	if (ret) {
> -		pr_warn("failed to enable OSI mode: %d\n", ret);
> +	if (ret)
>  		return false;
> -	}
>  
>  	return true;
>  }
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 9fdcb6bff403..42cae0ba10e2 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -164,6 +164,8 @@ int psci_set_osi_mode(bool enable)
>  			PSCI_1_0_SUSPEND_MODE_PC;
>  
>  	err = invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE, suspend_mode, 0, 0);
> +	if (err < 0)
> +		pr_warn("failed to set %s mode: %d\n", enable ? "OSI" : "PC", err);
>  	return psci_to_linux_errno(err);
>  }

When booting 6.1-rc1 I now see:

	[    0.000000] psci: OSI mode supported.
	[    0.000000] psci: failed to set PC mode: -3

on every boot with sc8280xp, while later enabling OSI mode still works:

	[    0.227358] CPUidle PSCI: psci_pd_try_set_osi_mode - success
	[    0.227599] CPUidle PSCI: Initialized CPU PM domain topology

Judging from Sudeep's comment on v1:

	The platform must boot in PC mode, so even if it fails we ignore
	so not sure if the logging is of much help here IMO.

perhaps logging this as an error is not a good idea?

Johan
