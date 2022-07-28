Return-Path: <SRS0=ZCVf=YB=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A7CC19F29
	for <soc@archiver.kernel.org>; Thu, 28 Jul 2022 08:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A869EC433D7; Thu, 28 Jul 2022 08:23:23 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0262CC433D6;
	Thu, 28 Jul 2022 08:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0262CC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ed1-f46.google.com ([209.85.208.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N0Fl9-1nVUDA3XpH-00xLWq; Thu, 28 Jul 2022 10:23:19 +0200
Received: by mail-ed1-f46.google.com with SMTP id v17so1251878edc.1;
        Thu, 28 Jul 2022 01:23:19 -0700 (PDT)
X-Gm-Message-State: AJIora8gznIkgHnLPHSWqWAEpZZ63vKeb7fpgzwTNkcmdzqQWqquYUMD
	04lZjCPCUhZKazJ3RQXfIGUQ1yTOOt5n0sl/Zuc=
X-Google-Smtp-Source: AGRyM1sJuwUbmaCJfA40knbmqWZ6z0D1fCr71/zKh90EOApXVyeo6usVYaUQDdPyOAwkYssRbDuQTKlmtjb0qISTAEE=
X-Received: by 2002:a05:6402:26c2:b0:43b:e542:9f68 with SMTP id
 x2-20020a05640226c200b0043be5429f68mr23098858edd.227.1658996599300; Thu, 28
 Jul 2022 01:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
 <25237c44-ebc4-fc9a-7c6f-3e990f968038@huawei.com> <CAK8P3a2+0EwSJ=fRBL2JCGypJRL-qE4rEiXYnJbqhZ=weethdQ@mail.gmail.com>
 <b39bf8c4-c702-8f49-12aa-d3ac05889b80@huawei.com>
In-Reply-To: <b39bf8c4-c702-8f49-12aa-d3ac05889b80@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Jul 2022 10:23:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0w+_MLOjJAKMENe6MYvBcXWXSir47Hz34WbtdEeAmaBw@mail.gmail.com>
Message-ID: <CAK8P3a0w+_MLOjJAKMENe6MYvBcXWXSir47Hz34WbtdEeAmaBw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8JyjGDGSyULad/SixMg8jW7jcOS30nwKZpYd/Q8mLwY+E7/Btqj
 ocEBYqG1+PBwQHmGb+8ECcZxWzlkEL8aI8xZkxGxFQLsEnAU0vm5CBg44LOroVlP+qpbLxm
 nddZUhJFGb5QNhLN4TETa1L4oDu+C7/XHCPIeQj0z/txz34GWL7z0y/lITW+fpHmekWWVUN
 mkcDTyWGkNj1iO7FtvRBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TqU4zq0oHQU=:pTqvIPL1QY7eisE1qNgYpU
 uKFPU6yE9TnhnndiSZLSzC8RFh4K0yPII+LRrMIBt/D0CXdf5s4odvbY71ytoXCrPESVPMgsV
 jWX5s560zq9EfUiz/ue9vcDbwvhkLmE/tJ679B7C5L7oe+Im0qse10vSY9IcZ16LpyNiS9r/c
 LzCRRvqpuVPpl4KBSmrRcmjuzy4Dh+dBBnvTVqpBkEfqtyb7z2A+s8iVqtB8tZXmmCfaqmkuj
 pUN6jSD2LMH45pwDfXcFNWJ6oRkQ9isun0BoClq/NIexwFTf5LbgSv9xYBXr3lVCCck1fyEVU
 NWykaOVUzstrXQFIK4jp8Z83k54G0BRqda0Q/QViCnQNCCLMDhwXUsmMYzwLqczSsB+KmRzoc
 xwZDXWFA2etI/uRRQ93scTe3VUdndw3YpxfFHUTgKbexCtcQ+X2kdiTFZ4BZH5dfHEwslChcu
 A/akC01YiszDtqkPaI8vSCIa6uZ72zodgamXOmgyp15SpUCO4gTzeIRYlXVkaJR3a69ehFtlA
 +mV2xjN+nh6I6RB3uuMEXJH8YLRv/yxlzWr35esUQp/7luE0gLJlm5caSSxJuMEiVsh4nRGyt
 0oGTutQmZAXsy8n0pO9bHTOspdhZ6sGFeXQovEIpDp8iWDRscLr3Spp4gp9bNnky83YqIJCaa
 hbCXJDZIPgPUMsNLGk3fpA2VduZdATH1Pko7pIawI/cxguLdw6TfFK+X2QPiN0DkRP8CIGUf2
 8+yhaxxuL2ujfiWMQ3/wH68e01o6AaZSnt6EwEumJ7nOiKHs3VBxIK4IoSKDHgKf9+3Ft7gXp
 mC4t2RTrnLluDKmAXCjXj4Zox9u78N5TqIdvvBSPxU7DTciBIt9M1SFGTu32sunpip44UyIta
 qCJHXesNxmTO3yn6r59w==

On Thu, Jul 28, 2022 at 10:06 AM John Garry <john.garry@huawei.com> wrote:
>
> trim list

Adding a few other people for slimbus.

> On 25/07/2022 13:51, Arnd Bergmann wrote:
> >>> CONFIG_SLIMBUS=m
> >> Config 5bd773242f75 added a kconfig "imply" on config SLIMBUS from
> >> config SOUNDWIRE_QCOM, and this happens to mean that we don't explicitly
> >> require config SLIMBUS enabled in the defconfig.
> > That 'imply' looks like it was added to solve a problem using the old 'imply'
> > semantics that are not what this keyword does today. I suspect it's still
> > broken when CONFIG=SOUNDWIRE_QCOM=y and CONFIG_SLIBMUS=m,
> > and the correct fix is to use a dependency like
> >
> >        depends on SLIMBUS || !SLIMBUS
> >
> > so the defconfig symbol should stay.
> >
>
> JFYI, building for CONFIG_SOUNDWIRE_QCOM=y and CONFIG_SLIBMUS=m is ok.
> The driver has a runtime check for CONFIG_SLIMBUS in qcom_swrm_probe().
>
> That implementation seems consistent with guidance in
> kconfig-language.rst - so do you think that there is still a problem?

I see Vinod added the IS_REACHABLE() check, which makes it build, but
I think both the 'imply' and the IS_REACHABLE() are mistakes here, as they
are almost everywhere else.

From what I understand, the driver can actually use two different
back-ends, with slimbus being one of them. In the configuration
with CONFIG_SOUNDWIRE_QCOM=y and CONFIG_SLIBMUS=m,
I think you can end up with a slimbus device being detected at
runtime, which gets passed to the built-in qcom driver, but that driver
then misdetects the bus because it is not linked against the
slimbus module. It then uses the incorrect code path, causing
unintended behavior.

The 'depends on SLIMBUS || !SLIMBUS' dependency would completely
avoid this issue and make the driver work correctly in each configuration.

        Arnd
