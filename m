Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DFEC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 17:01:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B99DD23C84; Wed,  9 Dec 2020 17:01:23 +0000 (UTC)
X-Gm-Message-State: AOAM5332z02KZD1LGtB74CqX3c9bciclaBCYWfNVvLLDVm4iMrjNFHv5
	MPblBAqeNuOxVHPn6ZTVW3MDp1f6MhTAM16mfAM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607533283;
	bh=9vFT6yJYkF46vbUR6Srtzis/Epuio+A30+71uKluc3w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=T997hC+n5hKMiL0ZOqbId24Jbl1IE68kCt1jDDbAUuHoF5NsEOI9EDu3OtkZAbQAX
	 wB5yRSwoHXpfM4oaAPcDSZqs35YbjupMt1MZWDwKph9VzHsO6Yr/XtXhZibmT7VZPr
	 3tg2brJF+vcc0n4/2bHLGiI6x4iamfIvx4ldDBpdL7AqazBUsKUTrzTa2JmfKSAbF5
	 uZyMZ4Pl6PfPNznVwHHQHIUD+uoALRJ6ri3MFu/QtB0wHj6LkqcFZWVO1gF1L/CbOz
	 IDDymydgekiXa9OvTZnkbpMahxUHSiPCv3ee+IrMXhKnG8m4mshGesNH/dkKYT4n2v
	 FACCviZabCAfA==
X-Google-Smtp-Source: ABdhPJzf0S0JyawVfrlGrgNSMXIvrVUCeAYxFXwUTOTAQsH5H4gcg2tuIko/YcdA3w29HqKrRBTuXd/3ZVE5djAGOvA=
X-Received: by 2002:aca:418b:: with SMTP id o133mr2346271oia.67.1607533282924;
 Wed, 09 Dec 2020 09:01:22 -0800 (PST)
MIME-Version: 1.0
References: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
In-Reply-To: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 18:01:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
Message-ID: <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	arm-soc <arm@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 3:51 PM Michal Simek <monstr@monstr.eu> wrote:
>
> Hi,
>
> please pull the following changes to your tree. The tree is based on
> zynqmp-soc-fixes-for-v5.10-rc6 tag or acfdd18591ea ("firmware: xilinx:
> Use hash-table for api feature check") which went to v5.10-rc6.

Is it necessary that this is based on top of the bugfix? This means
I'd have to do a backmerged of -rc4 into my dt tree, which is something
I would prefer to avoid.

I also notice that the subject is the same as the DT pull request, which
seems to have messed up patchwork into thinking it is an updated
version of the former.  If I had not noticed the backmerge, the DT pull
request would have gotten lost.

       Arnd
