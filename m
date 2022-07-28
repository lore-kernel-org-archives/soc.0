Return-Path: <SRS0=ZCVf=YB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7CAC04A68
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 12:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 161F8C433C1; Thu, 28 Jul 2022 12:08:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E5E4C433D6;
	Thu, 28 Jul 2022 12:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E5E4C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ej1-f52.google.com ([209.85.218.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MyKYE-1nXzCJ0qT6-00ykgN; Thu, 28 Jul 2022 14:03:23 +0200
Received: by mail-ej1-f52.google.com with SMTP id l23so2779357ejr.5;
        Thu, 28 Jul 2022 05:03:22 -0700 (PDT)
X-Gm-Message-State: AJIora+vZqoRi5FAYReqIOPYB/tJ88A8niTDOiq82q1acX5w2lrZSeBe
	WkK5z8KkL3pUnYKbls0L6u/ZIwtdr8kyhR1WA5M=
X-Google-Smtp-Source: AGRyM1vbcZtXff9wdVPPzf+JJ956N9jBi6RVLMTg4p5oOr7chFDjRAgayypXIkN9s9OCY7Rbo+VZ/Wqd9spSTPDDM/I=
X-Received: by 2002:a17:907:d0f:b0:72e:db1f:9b91 with SMTP id
 gn15-20020a1709070d0f00b0072edb1f9b91mr21266735ejc.470.1659009802540; Thu, 28
 Jul 2022 05:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
 <25237c44-ebc4-fc9a-7c6f-3e990f968038@huawei.com> <CAK8P3a2+0EwSJ=fRBL2JCGypJRL-qE4rEiXYnJbqhZ=weethdQ@mail.gmail.com>
 <b39bf8c4-c702-8f49-12aa-d3ac05889b80@huawei.com> <CAK8P3a0w+_MLOjJAKMENe6MYvBcXWXSir47Hz34WbtdEeAmaBw@mail.gmail.com>
 <4d010f40-6c4c-32c7-2772-1bbfa02c03b7@linaro.org> <CAK8P3a38uGGGLA4b2bi=v8cV6-dH5yEcvBYcwr5ChzkwMTX9_Q@mail.gmail.com>
 <966a62da-52b6-1789-13d6-5fe06b62c7fe@marek.ca>
In-Reply-To: <966a62da-52b6-1789-13d6-5fe06b62c7fe@marek.ca>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Jul 2022 14:03:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2HGYJZvcXM+9fROys5A6c40zFWD2qATT4xssSJf6hRfQ@mail.gmail.com>
Message-ID: <CAK8P3a2HGYJZvcXM+9fROys5A6c40zFWD2qATT4xssSJf6hRfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: Jonathan Marek <jonathan@marek.ca>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	John Garry <john.garry@huawei.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PkZILWH2N2gjuU9308dN7dF/qdlkvmeGXcsSMH5K5D2Req5btB6
 lpo6wGGgjMszu00/cz862Hnnb3iSoZY7ot/UxTUr5lDNBP/R3SZBPScPEfDdknVwkUvVs/a
 O1p9eIp2Fpnu/o2NadBabBC4EyMNBYk5NTZkjyeau+QrvRrKujVrI5q6LQXfuvEcAPsPgMw
 ywQDXKO1neUkySIDJB7dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9mMBVIE2Q0g=:16Vptcv2EdTGTsb3IsAFTZ
 NoMW+fTcUmT4xEgBvzJ70hwxH98KmgCFXWeUCyEs8QJVKpq8GH4ALGvKw5xLfN32zzPe883Cb
 nc0huOoB210mzj7Uiv5TkSBjO/TzyM+erANtLioLkFMt76uZen+8f2pnUSz3C74Cf41H3qtmK
 0TMZ1CFwJtogEoZruJ4w1NvT3hDzlUlHvW3uONBY1tiBWTnUPvUt2EARK2fzRzg3eNaVWpnQc
 GzhNFfdU3fnj5eU1nP71n1D0dhj9+PVMzc6mur2MyK9LF5KSQu+gIApToDNmKYXGSJH/nYple
 y/npjx0crzKI+6jy8ES0AQRBM23YXIJeDkO/TjaGeF5zP7VWiZGw7pxSdYvYbMS6KSwWvT9hH
 yQN98/nL3CM4sPWIj+IgjBKrGLE2OAxr2zydx/CrvcSPs7bCP9vIDkDFHeGkhGuni3AFZBuaU
 +9V00S4SZNimShTKAWrU7ik42Fh+eSo39j7d8Oh+WM+BJ0wn7/eBD1om7CIRuhbJmU2ZjypbI
 xehUWIAeVV0j8m3XBAtU3UJ8lQvVYaTbsLLEQs88wnuOuksDLd4IlEd6iLidcyfE8s9cNrlaS
 89GECjuDsjbedjQT2mtSvMOKi0WXyXlpm/pbvK9vUMxiunSkudGP9ilNv6+CNgHBKcOmcjXMk
 i0cIkZ93sowT910XQpkrkO+2Hv9EunUqYU2HK4ixnSfq2xLKWcqhdDgIiXahTGX6xWhPlhHf0
 77j9gC0Clq4tlwrSxaFbOgIJjqgUzUGX4zNclBhEOa0EqtxjOlLBsMbM1GZwIylCqpKiEkpwX
 W/l7Y47Cb/0EKsALmyc5sjXdPxJ43XmDM3y9qLn4qcDR1tydloyBUn5fXoQ+Bo6Wl9m3Q3t1U
 MKmS1vJfTpbEDA2lT7cw==

On Thu, Jul 28, 2022 at 1:57 PM Jonathan Marek <jonathan@marek.ca> wrote:
> On 7/28/22 5:09 AM, Arnd Bergmann wrote:
> > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> > index 22b706350ead..f65c7737c2db 100644
> > --- a/drivers/soundwire/qcom.c
> > +++ b/drivers/soundwire/qcom.c
> > @@ -1289,11 +1289,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
> >          data = of_device_get_match_data(dev);
> >          ctrl->rows_index = sdw_find_row_index(data->default_rows);
> >          ctrl->cols_index = sdw_find_col_index(data->default_cols);
> > -#if IS_REACHABLE(CONFIG_SLIMBUS)
> > -       if (dev->parent->bus == &slimbus_bus) {
> > -#else
> > -       if (false) {
> > -#endif
> > +       if (IS_ENABLED(CONFIG_SLIMBUS) && dev->parent->bus == &slimbus_bus) {
> >                  ctrl->reg_read = qcom_swrm_ahb_reg_read;
> >                  ctrl->reg_write = qcom_swrm_ahb_reg_write;
> >                  ctrl->regmap = dev_get_regmap(dev->parent, NULL);
> >
>
> This relies on the compiler optimizing out the reference to slimbus_bus,
> which doesn't exist in the CONFIG_SLIMBUS=n case (not tested, but I
> think this means an O0 build will fail?).

That is correct: We rely on this everywhere in the kernel, which is why
it is impossible to build kernels with -O0.

       Arnd
