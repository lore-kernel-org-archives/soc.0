Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4C7C433FE
	for <linux-next@archiver.kernel.org>; Fri,  3 Sep 2021 00:39:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E84E56101A
	for <linux-next@archiver.kernel.org>; Fri,  3 Sep 2021 00:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245425AbhICAkM (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 2 Sep 2021 20:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbhICAkL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Sep 2021 20:40:11 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9022CC061575;
        Thu,  2 Sep 2021 17:39:12 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id l6so5544932edb.7;
        Thu, 02 Sep 2021 17:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqXY12iIL6ozApUhBW3EO4+5asrjOwnSa/Or7mP2HcU=;
        b=NjusxJdmhVh592JKKa504zSajo1+dFWnY676Gx8h4HuJkkX2JAg/OjbbIzok2R7gBc
         1fOKpS2La5OaczNAcjLNlEtgWgNI+18pmVprwXE9GIhhH6Tk19pSU8VjnHvyN+lGpS9i
         3zUoueA20rm3RIuzLztYrb/9XSC6Ezt75vnWJ9OR2JdQNRb94dn/XvuJsZwKFFT+14sh
         coXcF6Tx3KcO+JhJdrtCgBJP7Hl94KbuSToGjRDNQ/kef6h8YoeD9rSMvqHg2IDgV0SL
         DV5JplIL1zykN7CrB6/qU6fAiLWBgFpoR9krON9a/vyGbQdaPolCuIehITrXoDZeO0un
         VRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqXY12iIL6ozApUhBW3EO4+5asrjOwnSa/Or7mP2HcU=;
        b=awECU+A5xQbTMmCNd8dSqg/qL7SM069j07cetuuHPfAa9XW4SkPif8aNmXPZh12XrL
         eKcCoMSxDG51r4/enOPVGpbQKYrJ/nTXw1GkKJOrKzOdcSJAgvO76BLQRYG6/ulYHKWp
         JSUK91iJQolJ5QL0oaDVjs/NGfAzJm2Lx+c4vNm0Tv+oxQbOTjBd5uf/Kw/GD82BLEYT
         DDba1Cq2Fc7RNPqLHAISd5/CEsAboA/b4+UvjWEQcA4Hy/Y85pJp/Ut6QoD1n3Olsp3o
         zmIdw1yheU0FMLhvtBUpFFs+Kex9NOtNujKbPmgmGUw5NNdOGuhltgd+9By45MD1Kq+X
         V1oQ==
X-Gm-Message-State: AOAM532OrXZ92Mq+THz/wafdqc/BIprGzFg7SCe0XzRAdnpLGNlushdu
        Nf8hrQOexspsdOVL+z0MZOs+3DjVu47BRL3Ing==
X-Google-Smtp-Source: ABdhPJzke42+EmkLysb6yj5EFKNvA62b/SDQndPMDtARHrLmDSJxDEeyr+KtwUxxe66iBuRSn9iMyYxfaZ0qIosvINU=
X-Received: by 2002:a50:9b52:: with SMTP id a18mr1059118edj.165.1630629551053;
 Thu, 02 Sep 2021 17:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210824131850.62b29724@canb.auug.org.au> <CAL_JsqKooHHmePPxRXGfB3DNfceO1=cdwAP=Esp-HUWtcaWefg@mail.gmail.com>
 <20210903083419.6981f63b@canb.auug.org.au>
In-Reply-To: <20210903083419.6981f63b@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Thu, 2 Sep 2021 19:38:59 -0500
Message-ID: <CAL_JsqKPc=Twa=P02t7B9Er0L2SoH9jVdfvShW9HhUX=AG-n0w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the devicetree tree
List-Id: <soc.lore.kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>, SoC Team <soc@kernel.org>,
        Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
Message-ID: <20210903003859.88m-8Q3Pqs5LHYQdnDXL2-wc6S6220wvn_5LjBe5OZ4@z>

On Thu, Sep 2, 2021 at 5:34 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Rob,
>
> On Tue, 24 Aug 2021 07:35:37 -0500 Rob Herring <robherring2@gmail.com> wrote:
> >
> > On Mon, Aug 23, 2021 at 10:18 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the devicetree tree, today's linux-next build (arm
> > > multi_v7_defconfig) produced this warning:
> > >
> > > arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"
> > > arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"
> > >
> > > Presumably exposed by commit
> > >
> > >   1ee7943c3343 ("kbuild: Enable dtc 'pci_device_reg' warning by default")
> >
> > Yep, that's expected. There's a couple on arm64 builds too.
>
> These warnings are now in Linus' tree :-(

There's some pending patches for them now[1]. The SoC tree needs to
pick them up.

Rob

[1] https://lore.kernel.org/all/20210831125843.1233488-1-nsaenzju@redhat.com/
