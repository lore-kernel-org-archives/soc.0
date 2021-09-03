Return-Path: <SRS0=w/cp=NZ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BBDC433EF
	for <soc@archiver.kernel.org>; Fri,  3 Sep 2021 00:39:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97DFD60F21; Fri,  3 Sep 2021 00:39:12 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6852F60F90
	for <soc@kernel.org>; Fri,  3 Sep 2021 00:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6852F60F90
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id eb14so5540045edb.8
        for <soc@kernel.org>; Thu, 02 Sep 2021 17:39:12 -0700 (PDT)
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
        b=A9HxlyoT/EHjx028XrrcrtCHkJhssvXHDPiLuDcE+w2dN2tHbFNsIJIUpWCGrNwR3H
         wZbqhkkP89GcS+7CDrrFK2vGaSLNM81nQ+aBz3vUYc38cbTu3+VS/xrUos3hT69K/i3d
         DbaWpZtBgJkXyPL+8eSnUre1Te9fVYB7Qbta4ZFgv3ia9fiDZSxr7GKbXe+YKSNKAX8Z
         x6Nl6ntDM3j2/ncD4dsIL89jssb4apKiO2kqFOzDdwB7XPK2Ld7PjCLXuVBtd+0sp8MG
         4A2pzx9zoHs52zK6fOk2CsWaSV1/56gfqE+D985JwSx/5iddXvxhWGQPu8tfml6N6uoj
         QINQ==
X-Gm-Message-State: AOAM533IcfRjKCd3GekfcwhYbp9B+iy9kVWpc+fsTF11Rsv84GmPRBe/
	sqU5FUAdGLT8huc/prHW70l/WtU5pOwmqVcIMGFkfJ1J6A==
X-Google-Smtp-Source: ABdhPJzke42+EmkLysb6yj5EFKNvA62b/SDQndPMDtARHrLmDSJxDEeyr+KtwUxxe66iBuRSn9iMyYxfaZ0qIosvINU=
X-Received: by 2002:a50:9b52:: with SMTP id a18mr1059118edj.165.1630629551053;
 Thu, 02 Sep 2021 17:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210824131850.62b29724@canb.auug.org.au> <CAL_JsqKooHHmePPxRXGfB3DNfceO1=cdwAP=Esp-HUWtcaWefg@mail.gmail.com>
 <20210903083419.6981f63b@canb.auug.org.au>
In-Reply-To: <20210903083419.6981f63b@canb.auug.org.au>
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 2 Sep 2021 19:38:59 -0500
Message-ID: <CAL_JsqKPc=Twa=P02t7B9Er0L2SoH9jVdfvShW9HhUX=AG-n0w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the devicetree tree
List-Id: <soc.lore.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, SoC Team <soc@kernel.org>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

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
