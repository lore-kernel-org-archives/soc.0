Return-Path: <SRS0=1kgv=RW=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F06C433EF
	for <soc@archiver.kernel.org>; Thu,  6 Jan 2022 00:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47EB3C36AF3; Thu,  6 Jan 2022 00:23:13 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 840E2C36AEB
	for <soc@kernel.org>; Thu,  6 Jan 2022 00:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 840E2C36AEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pf1-f180.google.com with SMTP id t187so896181pfb.11
        for <soc@kernel.org>; Wed, 05 Jan 2022 16:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ioidDsGJvFcnk6drHAhA52LvZnAQkZqJyhbDT8n1/YQ=;
        b=O2hrtnBw74uIbSTENybXO3A3mRFsujj3JykkKw7fPQMdJ7lN/mLPayFeqEFBZGZjYP
         NLUbVlPjSa37bFIauwi3H4WwwE2TTrn4Tu0NL9gZokLfQLAynqJD3daNLl6LAGU/TbHm
         Z5UNLQItCdsreZbLBlrqT3ryDePGbCrmun2ENYPfPjVHJ5KPLFOCsFi0jsFvGh5JUERX
         JzIeliEF926KVVc+sob2Qb0QxgKAsklNwTBQs8aWRJZXOR+rcRG3hDUwuF5+IzBCGyIP
         DiQXTnm7Iv/9y7Zm+lCqNWT/2YapwNsUjSfKhgg7483GCtmNI8LHhAdGwcf080yKL1cr
         yVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ioidDsGJvFcnk6drHAhA52LvZnAQkZqJyhbDT8n1/YQ=;
        b=0N7hlxbTBn+wP+Nfto13F69pKLt7S1FdqzK5oblwNCToqsnGObhrVUenJF8SIi+A4F
         ugTtJSx7TrVc1lIa2aMcRtmbfuPP/+7iFl+zlw6ZvjIMTle6Uct5tphCzdu6GSFuvjMP
         48KX8+3ioyS1a7a8V00x+WxBYoeiGsUoihnCFZAEqiOvjcWJpppOpLKSzbeZLGxdu3Sg
         NaF7CKtL6ZrG8D8rnaWVF5VaNtmRVTQK6Bgo7Nx9OvYl0wCJpIIVHkDA5GclMryzvzJi
         XWTY0ftVFByPRdaHwKI1lm42mb6KHlxO9mcjLF2eD4JcQTwb8+dqcfByE8jFgt3Zp+2+
         LUJg==
X-Gm-Message-State: AOAM532YscWXBnEMJ100HlAMSS9kI6KKPco8IHB9emGj0jJSCSgYInpf
	cDFjJM4x1gOikeHTF6txtaT4SkgUGAP7aNz2CkQdMw==
X-Google-Smtp-Source: ABdhPJzN7FgmefgOl14LGtlwZm4GTDIcSEYnFsy29RaVQvc846tLx4QX5PhtdtGZqk9B150UzxzoctG+tKmdmL1vl8M=
X-Received: by 2002:a62:b607:0:b0:4bb:f708:174 with SMTP id
 j7-20020a62b607000000b004bbf7080174mr44634199pff.82.1641428591671; Wed, 05
 Jan 2022 16:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20211227103644.566694-1-dinguyen@kernel.org>
In-Reply-To: <20211227103644.566694-1-dinguyen@kernel.org>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 5 Jan 2022 16:23:00 -0800
Message-ID: <CAOesGMj7y6z6p_vMUVaPbSuieZBhHqk=L9MC+yx8UwK2T+coog@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: socfpga: fix for v5.16, part 3
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: ARM-SoC Maintainers <arm@kernel.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dinh,

On Mon, Dec 27, 2021 at 2:36 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>
> Hi Arnd/Olof,
>
> Please pull in these 2 patches for v5.16. The reason for this dts compatible
> change is that the commit 98d948eb833 ("spi: cadence-quadspi: fix write
> completion support") is already part of v5.16, thus we need these 2 patches to
> be in v5.16.
>
> Thanks,
> Dinh
>
> The following changes since commit fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2:
>
>   Linux 5.16-rc7 (2021-12-26 13:17:17 -0800)

Was there a reason you chose to base this fixes branch on 5.16-rc7
instead of an older -rc, or the previous fixes branch that you sent
in?

As a result, we now have to bring the base version forward for our
fixes branch in our tree (and our for-next branch as well).

It's usually best practices to use an older -rc (-rc1/-rc2 if you
can), and/or continue using the same fixes branch if you have
dependencies between previous fixes sent in for this release cycle.

> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v5.16_part_3
>
> for you to fetch changes up to 36de991e93908f7ad5c2a0eac9c4ecf8b723fa4a:
>
>   ARM: dts: socfpga: change qspi to "intel,socfpga-qspi" (2021-12-27 04:20:06 -0600)

Merged this time, but please try to use older base branches in the
future. Thanks.


-Olof
