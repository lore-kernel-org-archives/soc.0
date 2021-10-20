Return-Path: <SRS0=Wie5=PI=chromium.org=swboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB72DC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 04:24:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7C2576115A; Wed, 20 Oct 2021 04:24:22 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544EC611B0
	for <soc@kernel.org>; Wed, 20 Oct 2021 04:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 544EC611B0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f44.google.com with SMTP id d21-20020a9d4f15000000b0054e677e0ac5so5000697otl.11
        for <soc@kernel.org>; Tue, 19 Oct 2021 21:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=elvoUBl7XEkbVo1g2RE1z3K+d4jyUSFlULoK7AzhEdQ=;
        b=f1QKTIRCxNZb0itcE4P7vDHamWDkwmiUTe7FxK85ftucfSGYVuGRin5WuQc0AMorfL
         ywKnPZMOlvBzFcunr64r7ASciayJ3Bhpfa/OBAjCWMMlNkBv/A8MWgOA+KANZQ9TFxns
         lxnvWXTkZ3QI3Jky81N9oEkkZISXT/A+S3XkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=elvoUBl7XEkbVo1g2RE1z3K+d4jyUSFlULoK7AzhEdQ=;
        b=4Epob99cM5I3BQXPh051Tv1Yg8AYph5vYy6gP+UhLQIRlcX+Xgk36gvzqZbjAz4ApE
         uoKOIfttnhPab2tXpAmFW5uxfwlJom/qlRNYRK7Gs11Ti6bE1DePcOKvN6fuGMz19A0y
         8qP+q+D8RgG4dfafoF1Ec+j2Ah/HKKtufrTX+zNI/bNZ9lUE/+vj+HZyg2Uf2UILn3aG
         o1m0igrEartyFvzEKjVWkFu8ZX4ZGPpWjwDkLlAmpW4XCHrm4XwN2OmKcBZIer1U8UG3
         Mkhy256vlw7FT7PIQwMiItAWb65y0jhfdwudzvu9raP5icdLqkFLxrIZtbLKbzlFfEpJ
         rIqw==
X-Gm-Message-State: AOAM531plZjBM6oUOqbW9VzQJpouTKc7oVf54+teSc6VxwekhIwBO1s5
	1KoKQU3mButvZiDwe4ACf7002xEN0lRnhsRGUpllkw==
X-Google-Smtp-Source: ABdhPJxaMZNzxtyBmA4rCXE3sYY70xRGR5VrFGomRibATDr1WeO/j2fA6f2qZduAErjFaES8HxDZ5QCDKXAE3lvSHz0=
X-Received: by 2002:a05:6830:4187:: with SMTP id r7mr8915979otu.126.1634703861597;
 Tue, 19 Oct 2021 21:24:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Oct 2021 23:24:21 -0500
MIME-Version: 1.0
In-Reply-To: <20211019154224.624204-1-arnd@kernel.org>
References: <20211019154224.624204-1-arnd@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 19 Oct 2021 23:24:21 -0500
Message-ID: <CAE-0n51jb=H=tTusjhQYY09A5B6BVgYWokGoVsSaQUQ+0rtqGA@mail.gmail.com>
Subject: Re: [PATCH 1/3] qcom: spm: allow compile-testing
To: Arnd Bergmann <arnd@kernel.org>, linux-pm@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Gross <agross@kernel.org>, Lina Iyer <ilina@codeaurora.org>, 
	John Stultz <john.stultz@linaro.org>, Maulik Shah <mkshah@codeaurora.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Mahesh Sivasubramanian <msivasub@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	He Ying <heying24@huawei.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Arnd Bergmann (2021-10-19 08:42:02)
> From: Arnd Bergmann <arnd@arndb.de>
>
> ARM_QCOM_SPM_CPUIDLE can be selected when compile-testing on
> other architectures, but this causes a Kconfig warning
> for QCOM_SPM:
>
> WARNING: unmet direct dependencies detected for QCOM_SPM
>   Depends on [n]: ARCH_QCOM [=n]
>   Selected by [y]:
>   - ARM_QCOM_SPM_CPUIDLE [=y] && CPU_IDLE [=y] && (ARM [=y] || ARM64) && (ARCH_QCOM [=n] || COMPILE_TEST [=y]) && !ARM64 && MMU [=y]
>
> Make it possible to also compile-test this one, which can
> be done now that v5.15-rc5 lets you select QCOM_SCM everywhere.
>
> Fixes: a871be6b8eee ("cpuidle: Convert Qualcomm SPM driver to a generic CPUidle driver")
> Fixes: 498ba2a8a275 ("cpuidle: Fix ARM_QCOM_SPM_CPUIDLE configuration")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
