Return-Path: <SRS0=IRNQ=G4=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A544FC433DB
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 00:15:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 82D2222C7B; Mon, 25 Jan 2021 00:15:08 +0000 (UTC)
X-Greylist: delayed 78 seconds by postgrey-1.34 at mail.kernel.org; Mon, 25 Jan 2021 00:15:07 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30B8122BF3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=nobuhiro1.iwamatsu@toshiba.co.jp
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1515.securemx.jp [210.130.202.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30B8122BF3;
	Mon, 25 Jan 2021 00:15:06 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1515) id 10P0Doak010462; Mon, 25 Jan 2021 09:13:50 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 10P0Dd8R019344; Mon, 25 Jan 2021 09:13:40 +0900
X-Iguazu-Qid: 34tMK0YvimQpXomfjz
X-Iguazu-QSIG: v=2; s=0; t=1611533619; q=34tMK0YvimQpXomfjz; m=0PtYV3Pjb7ZYebfWpJzjoaqMRdZj4YsvQz5Z5MZncYo=
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
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        yuji2.ishikawa@toshiba.co.jp
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.11
X-TSB-HOP: ON
Message-ID: <20210125001336.m2jvjbv6wnfdhhnq@toshiba.co.jp>
References: <20201214043922.p7njpxzrcwfoaphe@toshiba.co.jp>
 <CAK8P3a27RkYuw8GMHWpGUbqfHjeraQCNJc7B1m_hXd4_Zgsspg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a27RkYuw8GMHWpGUbqfHjeraQCNJc7B1m_hXd4_Zgsspg@mail.gmail.com>

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
