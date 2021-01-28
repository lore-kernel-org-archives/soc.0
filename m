Return-Path: <SRS0=ZyEH=G7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2373C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 21:19:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED7F64DE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 21:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ED7F64DE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=me.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZQ1kp7OrjmCq6a4o5Ne4SvfYSJ09BcFtuELGtHbt7yo=; b=r7sQbmC3kou1r1siQbU+LtyIr
	a/yDcIOkNbocy5o4nsPQF5Lbhr2iPmyms/g0ks43hCadKGecICfxErd49KG2Vu3OlQIluZcPGm4VJ
	53R6mvl8CHGKhnsnQaLr672MKoj2HvbxIg0DY14GPguHmtwYw3IapOq4DwhDkCRsbwRUiUYUDCySq
	8wsDICJtqLUbOkpmU3gIl+VCosc0nKORKKN5MVqEIIHHENG+n/nU2c6NwLYQEAIhrFR31f4aQ6Fxc
	lraljaLQUofClJrMWLK8stdTA8RRHemBdsFoDC72nj+XGUWYtriDl9k23lzDgx9Qo5beIQ52IXqwp
	fokj0jtXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5EgI-00005x-JS; Thu, 28 Jan 2021 21:18:22 +0000
Received: from st43p00im-ztbu10073601.me.com ([17.58.63.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5EgF-00005Z-VP
 for linux-arm-kernel@lists.infradead.org; Thu, 28 Jan 2021 21:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1611868696; bh=ciV1++1D+OLCgxRRqznQGe+RYOrt49WBPH7f6XfbotU=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=ZQg5ltqK84t/9xNXnvyu4NFbQU1yTz8VaClkIymGEG2sVUziMyLeKFsbxKsO/dJlh
 8W7XULtR9wf/ToLNn9E8mP2ksLyvIqBssNnOBqJLAGO84Mi+iGYpQlxb2kQN7BynJd
 01H8JcWW3jDIlLZsShPzGQZP2BTCdDJqJlSAMKEq3Ao2llovf/E/Kgvo5Te39zHCnQ
 vw4H/2y6KFAzrTIpBvG7bUo7bgS7Qr4ojhoxuBnkhf6SsZrbfzvxmRsI/oh0UGkuYS
 N2NLstugYbmqhuizC/1E10DtthMGemgxxRZR/qpBGKVxV1BZfZogMGH+n1gY6Axdx5
 Bb2vdV2Io848w==
Received: from gnbcxl0029.gnb.st.com (101.220.150.77.rev.sfr.net
 [77.150.220.101])
 by st43p00im-ztbu10073601.me.com (Postfix) with ESMTPSA id 979AF8201B8;
 Thu, 28 Jan 2021 21:18:12 +0000 (UTC)
Date: Thu, 28 Jan 2021 22:18:08 +0100
From: Alain Volmat <avolmat@me.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: sti: Introduce 4KOpen (stih418-b2264) board
Message-ID: <20210128211807.GA15542@gnbcxl0029.gnb.st.com>
Mail-Followup-To: Arnd Bergmann <arnd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210128075825.10368-1-avolmat@me.com>
 <CAK8P3a2TxPHc60c7+FoLm831rTPvyftRixL+BQfeVf3p_szopA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2TxPHc60c7+FoLm831rTPvyftRixL+BQfeVf3p_szopA@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2101280104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_161820_097470_A916E1EE 
X-CRM114-Status: GOOD (  23.71  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210128211808.2gEHNVq05ZV98j3yw4kgHekrOT-UOcilotD2tuSw8AE@z>

Hi Arnd,

thanks for the comments and sorry for the large 'To' list. In my v2 I'll
limit to Patrice Chotard (STi maintainer).

On Thu, Jan 28, 2021 at 02:08:51PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 28, 2021 at 8:58 AM Alain Volmat <avolmat@me.com> wrote:
> >
> > 4KOpen (B2264) is a board based on the STMicroelectronics STiH418 soc:
> >   - 2GB DDR
> >   - HDMI
> >   - Ethernet 1000-BaseT
> >   - PCIe (mini PCIe connector)
> >   - MicroSD slot
> >   - USB2 and USB3 connectors
> >   - Sata
> >   - 40 pins GPIO header
> >
> > Signed-off-by: Alain Volmat <avolmat@me.com>
> 
> The changelog text seems fine here.
> 
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2021 STMicroelectronics
> > + * Author: Alain Volmat <avolmat@me.com>
> > + */
> > +/dts-v1/;
> > +#include "stih418.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +/ {
> > +       model = "STiH418 B2264";
> > +       compatible = "st,stih418-b2264", "st,stih418";
> > +
> > +       chosen {
> > +               bootargs = "console=ttyAS0,115200 clk_ignore_unused";
> > +               stdout-path = &sbc_serial0;
> > +       };
> 
> I don't think the bootargs should be there, both are just hacks
> when things don't work correctly. If they don't, then try to fix them
> first, by making sure that all clocks are properly listed, and that the
> stdou-path points the working console.

Indeed, bootargs can be cleaned up. console is not necessary, however
it's going to be hard to get rid of the clk_ignore_unused now and I'd
prefer to keep it now, in the same way as for the other sti DTs.

> 
> > +&rng11 {
> > +       status = "disabled";
> > +};
> 
> Why do you disable the random number generator?

I shouldn't have putted this within the board DT. This rng11 is not
available on the STiH418.
In the v2 serie I'll had a separate commit to fix the stih418.dtsi instead.

Alain

> 
>        Arnd


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
