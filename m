Return-Path: <SRS0=UfjI=JU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039E5C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 13:45:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4043B613B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 13:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4043B613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kHBn+xypDGpnHmNAoK9XgvE+O1s0oVcGnh1hCxVgWvI=; b=qFOArUf7HAa6X/saYAzW2uIvu
	AhxCdw/vps3Sp4Po4I3PYPAjJjHX+y1OpfmbZ4mkg1sCmlRcK8aA1TARNb/CVQkl6syiXlJ7oHw4q
	vKBhx4uoeX1NA3W/XDsNjOSMW3lVhM6WHYLgschLfRSXXzHnxP0rRETxCfmG/zvKlEICtv/66XKjT
	t54veOyDe5beyJrJqilAt6CEtt/IQ+91xp8JJDLjAfR4RtAt6gx1VihSm1+DDOMOJK7zRqJiuF2MW
	7sRIy7ULlHHrH8gfepIu0jUVxiHRIBD93KlNc1o+SXiYK+tMeYaB4JE+Xs4HBmLICGG5g0rbLmFX9
	mP0KEjx6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZw5X-001aka-Uj; Fri, 23 Apr 2021 13:43:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZw5U-001akH-O3
 for linux-arm-kernel@desiato.infradead.org; Fri, 23 Apr 2021 13:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kdMFyQ2qxZEomdBLb2xs6B2wjYEbZj/Cg3zRX9kTAFg=; b=FRgy4WTBfmgzWHMgRmISaEAjo5
 AgaFBYbVhGf/i4lLXvtJakM7rqfjwGJLaqoHKcCjYAah4sum/ZOkN6iY0vKPZ8MuukGTPJpTo4FrR
 F9MzIilRt8dv3usrwY94Old+qzaPgKoIxnB2cDdcuadUAT9RBBEu/3VmDaFmfXAxk25E9Dp/QXyHD
 NsUNO/TVGZHkbVeIOkUtsU5dUPnP99i+Ov6K1fc2c9/1eTIK5wPIpsrJoo4qmx1YZlBfEmy9Ij6SL
 miI6VXEwAZlTOtkmx1w8g7+PMISZSpIC2zBsle5fPyaD9OX8n0ZUXdR4+wM8L8c9rXY09fhrCUHme
 HJKAQsDw==;
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZw5R-00ERfj-Vj
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Apr 2021 13:43:15 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MWAWq-1m6M6N3oeQ-00Xfge for <linux-arm-kernel@lists.infradead.org>; Fri,
 23 Apr 2021 15:43:05 +0200
Received: by mail-wr1-f52.google.com with SMTP id h4so39429837wrt.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 06:43:05 -0700 (PDT)
X-Gm-Message-State: AOAM531yWWaX0tcttl8kb0gx6csIwHRf0oeHrA7rPWBgZFChGLp9/0he
 Bf0JZDxJKwsbh1YjXhIPB/I81xXVAfsaBe735K0=
X-Google-Smtp-Source: ABdhPJyYEz3oAXfA6QGQ8pDBYCOWietlua8xR8+nwPHJcQITOjWTJqOWfw/bCo59vyTE1f48HCKqz3MvbCPSUfzzUTc=
X-Received: by 2002:adf:e483:: with SMTP id i3mr5013767wrm.286.1619185385314; 
 Fri, 23 Apr 2021 06:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-5-thierry.reding@gmail.com>
 <YILD4yyPXuiYbHW1@orome.fritz.box>
In-Reply-To: <YILD4yyPXuiYbHW1@orome.fritz.box>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 23 Apr 2021 15:42:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
Message-ID: <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, 
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:tBTu+vn5GE5H3rFYXxi0MXYNQ05p2k1tP/8f7W6q67WdTw7UCnu
 eP6EyNDx1nC5xH4zkFtJD5te7Y0bpWfS8He5gNxnkUbZxdbH3uSZqk765uIJ8zYURegHzy+
 S4SbIJZiXTPdUordhxJFPYPOP+MD6r9wa/DIAsJuIFqZWUf6r3dJkYrgl+OJptSKkdqqI2W
 yxB5A1kHt5tf6zsLsZqWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cGTgGuR8KFI=:wF57pWYzGYp9Zi9Qk1dcwh
 qV5TiIJSMBhWsGq645RtQpBdnb4jaXTrSRR85WpdJ7TtXFOwzPBBUUGDqK5uuTzLSYjw7gUqT
 DYsuFUDKBPs5INWxDwG/b2XcJ9/LXgivEuqrafDB121J0/uGsNafsAYkaEAI0qRzXg2AMaj5M
 t1US385a78q52iiq2Se+8ILN9XHIbq3lZuvQ9R4N9rKzhUUGGHaotsD6kKwhrYbnddcszk3L1
 BD11xR8ai8NGtJInighsK3gP+CI5u5QCyNT6PB1+oj4H5TBKO/YJTW9ZzFxX07TV3L4uXwO05
 fnV9tifBBzOJ0J9MTrYQWLROWlCvxaHQVnkLH7yJpQFbVA7Mz6YEhYePmmZTIxSpPr3HEp8Ac
 G7m7auiPlBX2pwaRzej7Fuhdvwy/D7Qd5DSzoew9/FAFBSNNrM03r34C4DKXIqR2ABGxibaQ4
 OZO0etD5pJy6MktAcnOaJt0XLciY2FJQrKZJXyQGcDHBDkmK2zIqid3BhwKpMYvec0prXYtrM
 g74BYnp6JZVqueimz6mzjUm29PI5TT+x1Zyg5V0TLjrIdwDFjBHn6Ko5RpxAsACgNZ0fuB6xl
 /1NjOZobjqhpo9Ny8lqm6IRWczFEYnbgAQvuWYI9kYSW0vaQKE2t06RHgSx3TpocBL0eCPgQE
 2Axg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_064314_358029_C4683A19 
X-CRM114-Status: GOOD (  22.45  )
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
Message-ID: <20210423134242.uz_18AC7Cg8JWc4MIzZAfEcofkN1VlNOc9Wuay_g-jk@z>

On Fri, Apr 23, 2021 at 2:56 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Apr 01, 2021 at 07:26:22PM +0200, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >
> > The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> >
> >   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt
> >
> > for you to fetch changes up to 405fa9e9d8664e830982c5fbcb70f9ba8656bafc:
> >
> >   arm64: tegra: Move clocks from RT5658 endpoint to device node (2021-03-25 14:04:49 +0100)
> >
> > Thanks,
> > Thierry
>
> Hi Arnd,
>
> I noticed that v5.12-rc8 is still broken because of the missing
> fw_devlink=on patch from this PR. This PR was meant to go into v5.12,
> but it looks like you pulled it for the next release.

Indeed, I never noticed the difference between the subject line and
the tag name. I usually go by the subject to see what branch to pick
and only then check if there are any discrepancies, but I missed this one.

> In retrospect I realize that the way I sent this out was rather
> confusing. Any chance you can still pull these into v5.12 to unbreak
> the final release?

I've pulled it into the arm/fixes branch now. There is only one other fix in
the arm/fixes, but I should still be able to send it out tomorrow.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
