Return-Path: <SRS0=T102=PK=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254D4C433EF
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 19:55:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BC02F611CB; Fri, 22 Oct 2021 19:54:59 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91DCF6103D;
	Fri, 22 Oct 2021 19:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91DCF6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MirfI-1nA1WW2oaa-00ewzc; Fri, 22 Oct 2021 21:54:56 +0200
Received: by mail-wr1-f47.google.com with SMTP id y3so1763010wrl.1;
        Fri, 22 Oct 2021 12:54:56 -0700 (PDT)
X-Gm-Message-State: AOAM533FnHxAVH2crJ2Tq0BASaO+tleFUfZ5S58hwAsTn0EhwPwMLlrw
	IMjcmBmFdcefgThoZrxjkpzqdSitWrO5VrCm01g=
X-Google-Smtp-Source: ABdhPJxaBoY+j7evAJR9nKHPeSqSpIWsO9lvFcI+piIA0yZoVJhYPemgz55zc/SnlURZX+C7pDp9Gk55MCbMvJ8lpW0=
X-Received: by 2002:adf:e292:: with SMTP id v18mr2180860wri.369.1634932496330;
 Fri, 22 Oct 2021 12:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211022010027.11866-1-leoyang.li@nxp.com>
In-Reply-To: <20211022010027.11866-1-leoyang.li@nxp.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Oct 2021 21:54:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a35adaG9OzWWFSvjJcQo+hEnEJuLCL-8je-m+78JfjWxQ@mail.gmail.com>
Message-ID: <CAK8P3a35adaG9OzWWFSvjJcQo+hEnEJuLCL-8je-m+78JfjWxQ@mail.gmail.com>
Subject: Re: [GIT PULL] soc/fsl drivers changes for fix(v5.15)
To: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Diana Craciun <diana.craciun@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xoHyhrCt7yvmbyAOdRG6Dh82rq5sAbMjkksUrjI0T5hKi32Szrn
 xGcvCQ8NLkRgISkT/Aqhe3FFvJ88Mv2X8CcdwQ7H7CeVEtR6lR7UG0ccRLfwaT3qA0StiUz
 oUmfn3r6E47wh5DUCrKnVdxi4H5sc2/t5NkLMjenGic44Ey54wtqc6/5xlyfHs4ITavUg9I
 /S60FKRkwI1IYmbm1W2rA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QyoQHH5CKC8=:icRftqPHh3kh7iGSxXEHvI
 Lnb6BXItgwVrl5GQ35Q8CMvGARM1oX8L6waZTs1zCCbylZ3EfUismJzUffNnshWxVn19vFgMN
 MFt5rUY7FOODdikJOwuF5d50Hru+0RljWxs1Qf3ohsXbU0uwn1FqD5IacZ5WWnRtnI062R8Vc
 FaZ3RaQBlwCkitEJC3svfaOK0jO9eLZRirms3UwvFqjXHujSSI5BifBBXhTkyhuAysq5le/cW
 +5Cn7f1vG1kJSxBvu9e2c//JHf8b7VdMDagvedmrmZFClD7D895VAFCNxMcso9TWo5gjkyNBn
 5fEOpb0RJ8h5Vmcc6DGVmjcSxlOTLxM0iI9gjPNZM/Bnq1q8OtgCo6b6h0H8/K1d88Ej1Q37J
 R6CmFknbUL44B5cIVAxbVgl3CCIR6Osdl8NEKcswOuDmQexHqZhktGTxomxTXznbl2qMo6RFY
 mg4lqPQaekRDEy2Jpw5JXr7vV9fMY5LKQb43EdNDkdHTBbvBoWnhjhGDfQKnvNYAl4BY5EaEv
 M0WahHCL0wnpmFFKnFOVpFoqoSDx1CiJ3ag/cTBF+sjioULKttFmuDpN5r2X9gDYST91vMnas
 TadUy7yJPW3h+HtXj16N+kvwKLW8+Cr6rQKbD5MRyPneGfJ2xh3m/QeEfXij9wiYqkiRR6fWl
 QEg+PrlhNJrgQVSkQXKtkjD3BBT282jVJL7LjbZmrxoMfQE8S42fQWVUWaAJWVbLxd2o=

On Fri, Oct 22, 2021 at 3:00 AM Li Yang <leoyang.li@nxp.com> wrote:
> ----------------------------------------------------------------
> NXP/FSL SoC driver fixes for v5.15

> - fix qbman alignment error in the virtualization context

This patch looks very suspicious to me, I don't think it's generally safe to
use memcpy_toio() on a normal pointer, as the __iomem tokens may
be in a separate address range, even though this currently works
on arm64. Adding the  (__iomem void *) cast without a comment that
explains why it's added seems similarly wrong, and finally the
changeset text does not seem to match what the code does:

According to the text, the pointer is to a virtual address mapped as
"device memory" (i.e. PROT_DEVICE_nGnRE or PROT_DEVICE_nGnRnE),
but the code suggests it's actually write-combining normal
(PROT_NORMAL_NC).

I don't see any discussion of this patch on the mailing list either, so
please resend the pull request without this patch, while we try to figure
out what the driver should actually be doing here.

       Arnd
