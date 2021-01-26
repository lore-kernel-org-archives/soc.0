Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CA9C433E6
	for <soc@archiver.kernel.org>; Tue, 26 Jan 2021 20:22:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A7CDF22A83; Tue, 26 Jan 2021 20:22:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7480C22241
	for <soc@kernel.org>; Tue, 26 Jan 2021 20:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611692567;
	bh=zH1U1uI6X9uBT8TMD/NHApRX3IVhZdifyAc9/uJBgRM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dhPlbk4/LBIr7O+DbbEZ4ttyXhfnlIOZWVqEDuUf/340wLdZJ9WI/Xwdxu/j7ZTh0
	 SkpgdyeboeOic5mP6mqkyR2oRG16sfGon5JXRQ3gUySrz/PLmfr0ijjHwufsYM1LXL
	 jaJ90As5l3DFKNWz0vpmEgidxPen42H/ooZMDaJSLzNmGovbGeJrwc9iDM6diw65nR
	 uinROTt7iwgJDgGKFrFE1k2Sm7QtR8tzlKOvSuWCH8EhPHE3SJIOqQgooLJOsAOw1I
	 uoRtgrvnWuguL6YpFwH+kmF3wLXAp/kb225ebHWoFYLsGBslQBT2is2q9PzdwgXUJH
	 1Fovb5Y+caVqA==
Received: by mail-ot1-f54.google.com with SMTP id i20so17544082otl.7
        for <soc@kernel.org>; Tue, 26 Jan 2021 12:22:47 -0800 (PST)
X-Gm-Message-State: AOAM533o029e9cJYYb5t+NrgwlGqxM+3Io9tc0E5gaHghL3T4gBhYpPq
	QEujSjiXPO89prAO/+KTfcJ5XzgcfgxpgsWevyg=
X-Google-Smtp-Source: ABdhPJzUBQW8yXMT6w4lpEmXlQpJ5vFQC65lVtOQZ8keLlO8KH3Ui56FPe/YeX114AmNp+nP/tIfynF9y2l0hHILhZo=
X-Received: by 2002:a9d:3bb7:: with SMTP id k52mr5376043otc.251.1611692566704;
 Tue, 26 Jan 2021 12:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20210122074234.GA1074747@jade> <161135641124.29035.6761157228532077144.git-patchwork-notify@kernel.org>
 <CAHUa44HCnzgYndTccs=SSb1BQ9nk05k8vUQ-TO6Z2ZukwQcUPA@mail.gmail.com> <CAK8P3a3gbLPsSz1c95ExBqnZ=y-4p=b9awpDQjVSEXXUTr13LQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3gbLPsSz1c95ExBqnZ=y-4p=b9awpDQjVSEXXUTr13LQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 26 Jan 2021 21:22:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2G9q+fu7jir7AvmsZuBY3kz7rKCCVKg4o8oDyPE34pfg@mail.gmail.com>
Message-ID: <CAK8P3a2G9q+fu7jir7AvmsZuBY3kz7rKCCVKg4o8oDyPE34pfg@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE driver fix for v5.11
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 25, 2021 at 10:30 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Jan 25, 2021 at 8:21 AM Jens Wiklander
> <jens.wiklander@linaro.org> wrote:
> >
> > Was this merged by mistake? You had some concerns about the need_resched() test.
> >
>
> Indeed, thanks for noticing!
>
> Could you send a fixup to remove the need_resched() check after verifying that
> it works? Alternatively I can remove the patch I merged by accident and send
> my next pull request without it, but I'd prefer to avoid rebasing the fixes I
> merged later.

I need to send out the fixes branch for upstream. As it was my mistake to
merge the fix while complaining about it, and the it's also harmless, I'll
leave the version I pulled now.

It would be nice to get a follow-up in your pull request for v5.12 though.

        Arnd
