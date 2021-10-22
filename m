Return-Path: <SRS0=AiQL=PK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A92C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 19:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9FE4610A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 19:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9FE4610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJ5auJEyzOfm1ZQ9+W4/kHh80BYEnymNi48ejgneHf0=; b=gIH4xwrGFMl5JD
	NQYRPWJ0bUewgG03Z2PYj9EAMBHU449+0VhslgDFT009H+kul7i26cIKxXQtdjgIZHw1y+3PxlAQV
	U0m3PkZd3BowmlUMDqsy+fnULAl+ojrOS37ji2R+AreIrgvvWSbZpsoYyhX3rYrPUX6ACwnmJygtM
	qC+uOXiFq9HeaHyV2VZskz5uuL9ttJWHEj+AjvJHKA/3b+NlnAmORnFkAApL7bY1DueHFhfpQNpmo
	qO+UsITnerJWgfZYEp63bgKIlEVPpDLOlAlq8f9weNr88MVY3mZgZvGUyVXw64zjxGZt6Ytn/hNcJ
	6YBnHbxt56jCsAv0OLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me0d7-00BuUG-7q; Fri, 22 Oct 2021 19:55:05 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me0d3-00BuT8-8a
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Oct 2021 19:55:02 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MvryJ-1mw5B92a5H-00sxLx for <linux-arm-kernel@lists.infradead.org>; Fri, 22
 Oct 2021 21:54:56 +0200
Received: by mail-wr1-f45.google.com with SMTP id e4so144022wrc.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Oct 2021 12:54:56 -0700 (PDT)
X-Gm-Message-State: AOAM533T5YTWOnn4/MkecU7fQmw2rVQfp+1I7OUAPguzgJdtCuzNnClY
 SuR7p7Sr7PZyTbPbe9bGnrUq7lwjlt/sFIoBDqc=
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Diana Craciun <diana.craciun@nxp.com>
X-Provags-ID: V03:K1:RnETpB0M1+qm51t9el5EB7ZndF4ArCHI70pQiH8pMcbZOkEjVyk
 ws13PgJGmmaojVgCTDN/NeMaAqOgi/vR8sE+jA0kJP5hprX8V0jwgotXDaC8I/745JB/WZi
 w5gBnsJCZXM2A79EV7t1vRobea7jGfzJd0saLUtytsEJGDm9jv2q2Bgp2RvPhknj3iixzOS
 IwN8OZYFDX3DFpQKUk+Xw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:os1rNcRCDS8=:tcRvE399i2R7wASOcIfY3I
 Tx4gtV1BCUHCdodt3m8gvU4etF0z2tUblAgkDHeQc7r9G9QzyJjew2C7bckGD9gOtk6D3VETl
 GqE5ogrfOfutJMaeGskmS7t4aKzaEwqZOMZDG51ZXZZ9rZhvPIKaz4qiQ2oOPmAMCkpTw+jrz
 NZ8iejEjZOtHF00AzVorDJQ2loqrvby3O/ZfQwJW5wLXDzSKbOPrZed0YFtzCLqcxthiaQTX0
 rntcyGla68dgIpOq5jvG7eTm2T1CRUiT1C4ypsfGJ2KyWwGDXYmy/Jvc5Rc/lDXa2XJz0m4/h
 Gxp+eVJfxruDmjhfnOB0odC7ttqvCrSzJPhTdIUasAe6Dktclg91jaSlQifUvY08J0NvFJv7W
 VLf+12+la5KOja9JkNyNd6myYzqCoOj2JOvK/k/VEXloifydG06gNvLfz+0HwrTJLuxukCSbn
 KwVLkEYzuf2mc/yvtzSt2YqaqLaUEETY4+4EGkipT4+uggM3lAMaFEWaecS4WDL89SjhGKinU
 R/om6dUfvnu6YVlfnfFH0YbrZerQWKNo1Y5cNBlKznwC5oh7BZ+1rTLXdyF4qqyrScQd/p4T9
 o9waEwEDeyKPwJ3pEH24dl1y13sNiOMvpUiYhSL7kgS2liZ09VRPr3xMmbvf99e/rxWc8EyM4
 7oosCnywsg/YomqA526U4LkE0LRD1ToeuV9fvJb2+GuhIoIbL8w8QmiVYbhb69re/2NA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_125501_637666_6A2BE75F 
X-CRM114-Status: GOOD (  14.91  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211022195440.OLf97BYG6_Rm5YFTE_DYvFbIMsZIxxXAgWTMS0KWIFM@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
