Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66884C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 00:16:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1814122BF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 00:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1814122BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I0RzGod3G1VrxvpiRd54Ft19y+cQf/RmWDdoYxR4VZc=; b=uPyQWlbCO31R0wzGeEiM2+GPp
	UMpl7GA3U1ezDDraHLRko0pB+sVuEOlMrB5HlBG/vQhu1B2DWd3FWwxjkdo3HZPHGGeKvqQWpo02/
	5rU2CBSYWLC1yDBgPAoD8If+FXpwFUX1hcY8tHtvrNLoT4qJEbYA2vrEjdQzM87dxX43lSRx0unan
	2SnsdKNfN7bYWvsPvjJtX7jUiyFZKSN+CzWsBbaE/WoD3dfxS3sTTQt+4WbX4myCkzzzFuAeeZy5/
	1cIIl5ViD0dqlK2TNySGPLOTRSUluqe/stypz0wymCKRhjDCq5Kn86kFRlhcHUmVxyyxi8jUdWzlW
	QH0G6gMOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3pW4-0002Go-AF; Mon, 25 Jan 2021 00:14:00 +0000
Received: from mo-csw1514.securemx.jp ([210.130.202.153]
 helo=mo-csw.securemx.jp)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3pW0-0002Fz-1b
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 00:13:58 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 10P0Dd8R019344;
 Mon, 25 Jan 2021 09:13:40 +0900
X-Iguazu-Qid: 34tMK0YvimQpXomfjz
X-Iguazu-QSIG: v=2; s=0; t=1611533619; q=34tMK0YvimQpXomfjz;
 m=0PtYV3Pjb7ZYebfWpJzjoaqMRdZj4YsvQz5Z5MZncYo=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
 by relay.securemx.jp (mx-mr1510) id 10P0DccX012355;
 Mon, 25 Jan 2021 09:13:39 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
 by imx12.toshiba.co.jp  with ESMTP id 10P0DcV5013788;
 Mon, 25 Jan 2021 09:13:38 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc02.toshiba.co.jp  with ESMTP id 10P0Dcwf008235;
 Mon, 25 Jan 2021 09:13:38 +0900
Date: Mon, 25 Jan 2021 09:13:36 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.11
X-TSB-HOP: ON
Message-ID: <20210125001336.m2jvjbv6wnfdhhnq@toshiba.co.jp>
References: <20201214043922.p7njpxzrcwfoaphe@toshiba.co.jp>
 <CAK8P3a27RkYuw8GMHWpGUbqfHjeraQCNJc7B1m_hXd4_Zgsspg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a27RkYuw8GMHWpGUbqfHjeraQCNJc7B1m_hXd4_Zgsspg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_191356_412959_6E86B5E2 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 yuji2.ishikawa@toshiba.co.jp, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210125001336.O_wVvfzw_ZhRJxTeQdHlWOGZL57wbbq3aZ9xsh5rV0s@z>

Hi,

On Fri, Jan 15, 2021 at 06:07:19PM +0100, Arnd Bergmann wrote:
> On Mon, Dec 14, 2020 at 5:39 AM Nobuhiro Iwamatsu
> <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> >
> > Hi, SoC team,
> >
> > This request includes the WDT / DT patch for the Visconti SoC.
> > Please pull for v5.11 kernel cycle.
> 
> I'm sorry this came too late before the merge window and did not make
> it into v5.11.

I see.

> Can you please rebase on top of v5.11-rc1 and resend the pull request?

Yes, I will do it soon, thanks.

Best regards,
   Nobuhiro

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
